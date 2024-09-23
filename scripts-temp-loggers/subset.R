# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))

# temperature logger data: 
tdat <- rbind(t1, t2, t3, t4)
colnames(tdat)[1] <- 'number'

tdat$t.start1 <- as.POSIXct(tdat$date.time, format = '%m-%d-%Y %H:%M:%S', tz = 'UTC')

idat$t.start1 <- round_date(idat$t.start, '10 min', tz = 'UTC')

class(tdat$t.start1)
class(idat$t.start1)
 
idat <- left_join(idat, tdat, by = 't.start1')

tdat1 <- tdat[tdat$pos == 'out', ]
colnames(tdat1)[3] <- 'temp.out'

tdat2 <- tdat[tdat$pos == 'in', ]
colnames(tdat2)[3] <- 'temp.in'

tdat3 <- cbind(tdat1, tdat2)
