########################################################################################
#### READING IN AND ORDERING DATA ######################################################
########################################################################################

# reading in data, ordering and adding elapse.time 
org <- read.table('BLANK', header = TRUE, fill = TRUE) # Data not uploaded to GitHub, can be obtained by contacting Johanna Pedersen

data <- rbind(org)

data$date.time <- paste(data$DATE, data$TIME)
data$date.time<-ymd_hms(data$date.time)
dat <- data

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
  i$elapsed.time <- difftime(i$date.time, min(i$date.time), units='hour')
  new.dat <- rbind(new.dat,i)
}

dat <- new.dat

dat$elapsed.time <- signif(dat$elapsed.time, digits = 3)

# adding a column with treatment names
dat$treat <- dat$id
dat$treat <- mapvalues(dat$treat, from = c('1', '10', '18'), to = c(rep('A', 3)))
dat$treat <- mapvalues(dat$treat, from = c('2', '8', '13'), to = c(rep('A dis acid', 3)))
dat$treat <- mapvalues(dat$treat, from = c('3', '12', '17'), to = c(rep('A dis', 3)))
dat$treat <- mapvalues(dat$treat, from = c('4', '7', '14'), to = c(rep('A sep acid', 3)))
dat$treat <- mapvalues(dat$treat, from = c('6', '11', '15'), to = c(rep('A sep', 3)))
dat$treat <- mapvalues(dat$treat, from = c('19'), to = c('Bare soil'))

dat$replicate <- dat$id
dat$replicate <- mapvalues(dat$replicate, from = c('1', '2', '3', '4', '6'), to = rep('1', 5))
dat$replicate <- mapvalues(dat$replicate, from = c('10', '8', '12', '7', '11'), to = rep('2', 5))
dat$replicate <- mapvalues(dat$replicate, from = c('18', '13', '17', '14', '15'), to = rep('3', 5))

dat$treat <- mapvalues(dat$treat, from = c('5', '9', '16'), to = c(rep('bg', 3)))

dat$id <- as.character(dat$id)

dat$elapsed.time <- as.numeric(dat$elapsed.time)

dat <- dat[! dat$id == 16, ]
dat <- na.omit(dat)

# background data: 
bg <- dat[dat$treat == 'bg', ]

# outlet data:
out <- dat[! dat$treat == 'bg', ]

# average background values
bg.summ <- aggregate2(bg, x = c('NH3_30s'), by = c('elapsed.time'),
                         FUN = list(bg = mean))

# joining average background and outlet data
dat <- full_join(bg.summ, out, by = 'elapsed.time')

# subtracting background from outlet data
dat$NH3.corr <- dat$NH3_30s - dat$NH3_30s.bg

# check
dat[! complete.cases(dat), ]

# ambient temperature data
weather <- read_xlsx('BLANK') # Data not uploaded to GitHub, can be obtained by contacting Johanna Pedersen
weather$date <- as.Date(weather$date)
weather$date.time.weather <- as.POSIXct(paste(weather$date, weather$time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

dat$date.time.weather <- dat$date.time
dat$date.time.weather <- round_date(dat$date.time.weather, '1 hour')
dat <- left_join(dat, weather, by = 'date.time.weather')

# constants:
p.con <- 1 # atm
R.con <- 0.082057338 # [L * atm * K^-1 * mol^-1]
M.N <- 14.0067 # g * mol^-1
dat$air.flow <- 33.1 * 60 # L min^-1 
dat$A.frame <- (0.7/2)^2 * 3.14 #m^2

dat$air.temp.K <- dat$air.temp + 273.15

# calculation of a concentration from ppb to mol * L^-1
dat$n <- p.con / (R.con * dat$air.temp.K) * dat$NH3.corr * 10^-9  # mol * L^-1        
# calculation of flux, from mol * L^-1 to g.N * min^-1 * m^-2
dat$flux <- (dat$n * M.N * dat$air.flow) / dat$A.frame
# From g.N * min^-1 * m^-2 

# rearranging data by tunnel 
dat <- arrange(dat, by = id)

# calculation of total flux over time
# Average ammonia flux in measurement interval
dat$flux.tr <- rollapplyr(dat$flux, 2, mean, fill = NA)
dat$flux.tr[dat$elapsed.time == 0] <- 0
dat <- dat[! dat$flux.tr == 0, ]

ggplot(dat, aes(elapsed.time, flux.tr, color = treat)) + geom_point()

############# MAKING DATA FRAME FOR ALFAM2 TEMPLATE 

dat$project <- 'MAG'             
dat$exp <- '22C'                
dat$field <- 'A'       
dat$plot.number <- paste(dat$id, dat$treat)
dat$treatment <- dat$treat
dat$replicate.nu <- dat$replicate

# rearanging data by tunnel 
dat <- arrange(dat, by = id)

dat$id <- as.character(dat$id)
dat <- mutate(group_by(dat, id), numbering = row_number())

dat$start.date <- format(dat$date.time, format="%d-%m-%Y %H:%M")
dat$end.date <- dat$start.date
dat$end.date <- c(dat$end.date[-1], dat$end.date[nrow(dat)]) 

dat$start.date <- as.POSIXct(dat$start.date, format = "%d-%m-%Y %H:%M")
dat$end.date <- as.POSIXct(dat$end.date, format = "%d-%m-%Y %H:%M")

dat$shift.length <- as.numeric((as.POSIXct(dat$end.date) - as.POSIXct(dat$start.date) ))
dat$shift.length <- as.numeric(dat$shift.length)
dat$shift.length <- dat$shift.length / 60

dat <- ddply(dat, c('id'), filter, row_number() <= n()-1)

dat$measuring.tech <- 'Dynamic chamber'

dat$details <- ''
dat$detection.limit <- ''
dat$bg.value <- dat$NH3_30s.bg / 1000
dat$bg.unit <- 'ppm'

# from gN * min^-1 * m^-2 to gN * h^-1 * ha^-1
dat$NH3.value <- dat$flux *10^-3 * 60 * 10^4

dat$NH3.unit <- 'kg N/ha-hr'
dat$man.pH <- '' 
dat$temp <- dat$air.temp
dat$air.height <- '2'

dat.table <- dat[, c(46:65)]

# write.xlsx(dat.table, file = '../ALFAM2 submission/dat_22C.xlsx')
