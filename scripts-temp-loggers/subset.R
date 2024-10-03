# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))
idat <- idat[! idat$new.ID == 'NA', ]

ndat <- subset(idat, select = c('t.start', 'air.temp'))
ndat$pos <- 'ambient'
colnames(ndat)[2] <- 'temp'

# temperature logger data: 
tdat <- rbind(t1, t2, t3, t4)
tdat$t.start <- as.POSIXct(tdat$date.time, format = '%m-%d-%Y %H:%M:%S', tz = 'UTC')
# tdat <- tdat[, c('temp', 'pos', 't.start')]


ggplot(ndat, aes(t.start, temp)) + geom_point()

ggplot(tdat, aes(t.start, temp)) + geom_point()


test <- rbind(tdat, ndat)
ggplot(test, aes(t.start, temp, color = 'pos')) + geom_point() 



# idat$t.start1 <- as.POSIXct(round_date(idat$t.start, '10 min'), tz = 'UTC')
# 
# ndat <- merge(idat, tdat, by = 't.start1')
# 
# 
# 
# tdat1 <- tdat[tdat$pos == 'out', ]
# colnames(tdat1) <- paste('o', colnames(tdat1), sep = '.')
# 
# tdat2 <- tdat[tdat$pos == 'in', ]
# colnames(tdat2) <- paste('i', colnames(tdat2), sep = '.')
# 
# tdat3 <- cbind(tdat1, tdat2)
