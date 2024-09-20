
idat <- fread('../data-emission/data/MAG_interval.csv')
pdat <- fread('../data-emission/data/MAG_plot.csv')

t1 <- fread('../data-soil-temp/HOBO_A_spring2024_2.csv')
t1$log.ID <- 'A'
t2 <- fread('../data-soil-temp/HOBO_B_spring2024_2.csv')
t2$log.ID <- 'B'
t3 <- fread('../data-soil-temp/HOBO_C_spring2024_2.csv')
t3$log.ID <- 'C'
t4 <- fread('../data-soil-temp/HOBO_D_spring2024_2.csv')
t4$log.ID <- 'D'
