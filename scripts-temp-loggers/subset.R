# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))
idat <- idat[! idat$new.ID == 'NA', ]

ndat <- subset(idat, select = c('t.start', 'air.temp'))
ndat$pos <- 'ambient'
colnames(ndat)[2] <- 'temp'

# temperature logger data: 
tdat <- rbind(t1, t2, t3, t4)

# Date problem: some as dd-mm-yy and some mm-dd-yyyy
# Luckily they can be told apart by number of year digits! (Otherwise, it's back to the source to correct.)
# Correct by identifying which rows have which by date length, correct, then convert separately
tdat[, date := substr(date.time, 1, 10)]
tdat[, date := gsub(' [0-9]$', '', date)]
tdat[, date.len := nchar(date)]

# Create empty t.start column
tdat[, t.start := NA + Sys.time()]
# Separately convert dates and fill into new column
tdat[date.len == 8,  t.start := as.POSIXct(date.time, format = '%d-%m-%y %H:%M:%S', tz = 'UTC')]
tdat[date.len == 10, t.start := as.POSIXct(date.time, format = '%m-%d-%Y %H:%M:%S', tz = 'UTC')]

# Check for missing dates
if (any(is.na(tdat$t.start))) stop('Date problem')

#ggplot(tdat, aes(t.start, temp, colour = log.ID)) + geom_line()


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
