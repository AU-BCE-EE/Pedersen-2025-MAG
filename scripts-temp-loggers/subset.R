
pdat$trial <- pdat$exper

# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))

# Giving new ID's for publication purpose. 
idat$new.ID <- idat$trial

# New ID's for treatment publication
idat$new.ID <- gsub('24M', '4', idat$new.ID)
idat$new.ID <- gsub('24J', '7', idat$new.ID)
idat$new.ID <- gsub('24L', '8', idat$new.ID)
idat$new.ID <- gsub('24H', '10', idat$new.ID)
idat$new.ID <- gsub('24N', '11', idat$new.ID)
idat$new.ID <- gsub('24O', '12', idat$new.ID)
idat$new.ID <- gsub('24I', '14', idat$new.ID)
idat$new.ID <- gsub('24K', '15', idat$new.ID)

# temperature logger data: 
tdat <- rbind(t1, t2, t3, t4)
colnames(tdat)[1] <- 'number'
colnames(tdat)[2] <- 'time'
colnames(tdat)[3] <- 'log.temp'

tdat$t.start1 <- as.POSIXct(paste(tdat$time), format = '%d-%m-%Y %H:%M:%S', tz = 'UTC')

idat$t.start1 <- round_date(idat$t.start, '10 min')

idat <- left_join(idat, tdat, by = 't.start1')