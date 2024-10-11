

ndat <- subset(idat, select = c('t.start', 'air.temp'))
ndat$pos <- 'ambient'
ndat$log.ID <- 'ambient'
colnames(ndat)[2] <- 'temp'

# dataframe for plotting time vs temp
d1 <- rbind(tdat, ndat)

# data frame for plotting the differen temperatures against each other and investigating env effects. 
d2 <- merge(tsummI, tsummO, by = 't.start')
d2 <- merge(d2, ndat[ , 1:2], by = 't.start')
d2 <- merge(d2, clim, by = 't.start')






