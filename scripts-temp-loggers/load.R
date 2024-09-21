
idat <- fread('../data-emission/data/MAG_interval.csv')
pdat <- fread('../data-emission/data/MAG_plot.csv')

t1 <- fread('../data-soil-temp/HOBO_A_spring2024_2.csv')
t1$log.ID <- 'A'
t1$date.time <- gsub('2024', '24', t1$date.time)

t2 <- fread('../data-soil-temp/HOBO_B_spring2024_2.csv')
t2$log.ID <- 'B'
t2$date.time <- gsub('2024', '24', t2$date.time)

t3 <- fread('../data-soil-temp/HOBO_C_spring2024_2.csv')
t3$log.ID <- 'C'
t3$date.time <- gsub('2024', '24', t3$date.time)

t4 <- fread('../data-soil-temp/HOBO_D_spring2024_2.csv')
t4$log.ID <- 'D'
t4$date.time <- gsub('2024', '24', t4$date.time)