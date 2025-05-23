
# Emission data
idat <- fread('../data-emission/data/MAG_interval.csv')
pdat <- fread('../data-emission/data/MAG_plot.csv')

# New IDs for publicatoin purpose
IDs <- c(`24M` =  '4',
         `24J` =  '7',
         `24L` =  '8',
         `24H` =  '10', 
         `24N` =  '11',
         `24O` =  '12',
         `24I` =  '14',
         `24K` =  '15')

pdat[, new.ID := IDs[exper]]

# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))
idat <- idat[! idat$new.ID == 'NA', ]

# Temperature logger data
t1 <- fread('../data-soil-temp/HOBO_A_spring2024_2.csv')
t1$log.ID <- 'A'

t2 <- fread('../data-soil-temp/HOBO_B_spring2024_2.csv')
t2$log.ID <- 'B'

t3 <- fread('../data-soil-temp/HOBO_C_spring2024_2.csv')
t3$log.ID <- 'C'

t4 <- fread('../data-soil-temp/HOBO_D_spring2024_2.csv')
t4$log.ID <- 'D'

tdat <- rbind(t1, t2, t3, t4)


# Climatic data from weather station at Research Center Viborg 
clim <- fread('../data-soil-temp/clim_dat.csv')
