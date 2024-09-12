########################################################################################
#### READING IN AND ORDERING DATA ######################################################
########################################################################################

# reading in data, ordering and adding elapse.time 
df <- readCRDS('BLANK') # Data not uploaded to GitHub, can be obtained by contacting Johanna Pedersen

dat <- df

########################################################################################
#### ORDERING AND CROPING DATA #########################################################
########################################################################################

dat$id <- dat$MPVPosition

# taking the last point of each measurent from each valve 
dat <- filter(dat, !(dat$id == lead(dat$id)))

# Selecting points with whole numbers (when the valve change there is a measurement where the valve position
# is in between two valves, these are removed)
dat <- dat[dat$id == '1' | dat$id == '2' | dat$id == '3' | dat$id == '4' | dat$id == '5' | dat$id == '6' | dat$id == '7' | 
             dat$id == '8' | dat$id == '9' | dat$id == '10' | dat$id == '11' | dat$id == '12' | dat$id == '13' | dat$id == '14' |
             dat$id == '15' | dat$id == '16' | dat$id == '17' | dat$id == '18' | dat$id == '19', ]

# Making elapsed.time fit with the first measurement of each valve = 0
dat$Vid <- 0
dat$Vid[1:19] <- c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8', 'V9', 'V10', 'V11', 'V12', 'V13', 'v14', 'v15', 'v16', 'v17', 'v18', 'v19')

splitdat <- split(dat, f = dat$id)
new.names <- dat$Vid[1:19]

for (i in 1:19){
  assign(new.names[i], splitdat[[i]])
}

z = list(V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, v14, v15, v16, v17, v18, v19)
new.dat = NULL
for(i in z){
  i$elapsed.time <- difftime(i$st, min(i$st), units='hour')
  new.dat <- rbind(new.dat,i)
}

dat <- new.dat

dat$elapsed.time <- signif(dat$elapsed.time, digits = 3)

# adding a column with treatment names
dat$treat <- dat$id
dat$treat <- mapvalues(dat$treat, from = c('1', '6', '11', '15'), to = c(rep('TH-12', 4)))
dat$treat <- mapvalues(dat$treat, from = c('4', '10', '14', '19'), to = c(rep('TH-4', 4)))
dat$treat <- mapvalues(dat$treat, from = c('2', '7', '12', '17'), to = c(rep('TS-TSB-12', 4)))
dat$treat <- mapvalues(dat$treat, from = c('3', '8', '13', '18'), to = c(rep('TS-TSB-4', 4)))

dat$replicate <- dat$id
dat$replicate <- mapvalues(dat$replicate, from = c('1', '4', '2', '3'), to = rep('1', 4))
dat$replicate <- mapvalues(dat$replicate, from = c('6', '10', '7', '8'), to = rep('2', 4))
dat$replicate <- mapvalues(dat$replicate, from = c('11', '14', '12', '13'), to = rep('3', 4))
dat$replicate <- mapvalues(dat$replicate, from = c('15', '19', '17', '18'), to = rep('4', 4))

dat$plot.num <- dat$id
dat$plot.num <- mapvalues(dat$plot.num, from = c('1'), to = c('1'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('2'), to = c('2'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('3'), to = c('3'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('4'), to = c('4'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('6'), to = c('5'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('7'), to = c('6'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('8'), to = c('7'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('10'), to = c('8'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('11'), to = c('9'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('12'), to = c('10'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('13'), to = c('11'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('14'), to = c('12'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('15'), to = c('13'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('17'), to = c('14'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('18'), to = c('15'))
dat$plot.num <- mapvalues(dat$plot.num, from = c('19'), to = c('16'))

dat$treat <- mapvalues(dat$treat, from = c('5', '9', '16'), to = c(rep('bg', 3)))

dat$id <- as.character(dat$id)
ggplot(dat, aes(elapsed.time, NH3_30s, color = treat)) + geom_point() + geom_line(aes(group = id))

dat$elapsed.time <- as.numeric(dat$elapsed.time)

# background data: 
bg <- dat[dat$treat == 'bg', ]

# outlet data:
out <- dat[! dat$treat == 'bg', ]

bg <- as.data.frame(bg)

# average background values
bg.summ <- aggregate2(na.omit(bg), x = c('NH3_30s'), by = c('elapsed.time'),
                         FUN = list(bg = mean))

# joining average background and outlet data
dat <- full_join(bg.summ, na.omit(out), by = 'elapsed.time')

# subtracting background from outlet data
dat$NH3.corr <- dat$NH3_30s - dat$NH3_30s.bg

# check
dat[! complete.cases(dat), ]

# ambient temperature data
weather <- read_xlsx('BLANK') # Data not uploaded to GitHub, can be obtained by contacting Johanna Pedersen
weather$date <- as.Date(weather$date)
weather$date.time.weather <- as.POSIXct(paste(weather$date, weather$time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

dat$date.time.weather <- dat$st
dat$date.time.weather <- round_date(dat$date.time.weather, '1 hour')
dat <- left_join(dat, weather, by = 'date.time.weather')

# constants:
p.con <- 1 # atm
R.con <- 0.082057338 # [L * atm * K^-1 * mol^-1]
M.N <- 14.0067 # g * mol^-1
dat$air.flow <- 34.5 * 60 # L min^-1 
dat$A.frame <- (0.7/2)^2 * 3.14 #m^2

dat$air.temp.K <- dat$air.temp + 273.15

# calculation of a concentration from ppb to mol * L^-1
dat$n <- p.con / (R.con * dat$air.temp.K) * dat$NH3.corr * 10^-9  # mol * L^-1        
# calculation of flux, from mol * L^-1 to g.N * min^-1 * m^-2
dat$flux <- (dat$n * M.N * dat$air.flow) / dat$A.frame

# rearranging data by tunnel 
dat <- arrange(dat, by = id)

# Average ammonia flux in measurement interval
dat$flux.tr <- rollapplyr(dat$flux, 2, mean, fill = NA)
dat$flux.tr[dat$elapsed.time == 0] <- 0
dat <- dat[! dat$flux.tr == 0, ]

ggplot(dat, aes(elapsed.time, flux.tr, color = treat)) + geom_point()

############# MAKING DATA FRAME FOR ALFAM2 TEMPLATE 

dat$project <- 'MAG'             # CHANGE CHANGE CHANGE
dat$exp <- '24B'                # CHANGE CHANGE CHANGE
dat$field <- 'Foulumgård'       # CHANGE CHANGE CHANGE
dat$plot.number <- dat$plot.num
dat$treatment <- dat$treat
dat$replicate.nu <- dat$replicate

# rearanging data by tunnel 
dat <- arrange(dat, by = id)

dat$id <- as.character(dat$id)
dat <- mutate(group_by(dat, id), numbering = row_number())

dat$start.date <- dat$st
dat$end.date <- dat$st
dat$end.date <- c(dat$end.date[-1], dat$end.date[nrow(dat)]) 

dat$shift.length <- ''

dat$start.date <- format(dat$start.date, format = "%d-%m-%Y %H:%M")
dat$end.date <- format(dat$end.date, format = "%d-%m-%Y %H:%M")

dat <- ddply(dat, c('id'), filter, row_number() <= n()-1)

dat$measuring.tech <- 'Dynamic chamber'
dat$details <- ''

dat$detection.limit <- ''
dat$bg.value <- dat$NH3_30s.bg / 1000
dat$bg.unit <- 'ppm'

dat$Type <- 'Emission rate'
dat$NH3.value <- dat$flux *10^-3 * 60 * 10^4 # from gN * min^-1 * m^-2 to gN * h^-1 * ha^-1
dat$NH3.unit <- 'kg N/ha-hr'
dat$man.pH <- '' 
dat$temp <- dat$air.temp
dat$air.height <- '2'
dat$soil.tempA <- dat$soil.temp
dat$soil.depth <- '0.1'
dat$soil.surface <- ''
dat$soil.globa.rad <- ''
dat$WS <- ''
dat$WS.height <- '2'
dat$MO.lenght <- ''
dat$Fric.vel <- ''
dat$rough <- ''
dat$air.val <- ''
dat$air.uni <- ''
dat$air.rain <- '0'
dat$rel.hum <- ''
dat$WS.loc <- ''
dat$far.loc <- ''
dat$C.col <- '0.15'
dat$air.rate <- '15'
dat$C.AER <- '35'

ggplot(dat, aes(elapsed.time, NH3.value, color = plot.number)) + geom_point()

#### CHANGE THESE ##########################################

dat.table <- dat[, c(41:79)]

write.xlsx(dat.table, file = '../ALFAM2 submission/dat_24B.xlsx')