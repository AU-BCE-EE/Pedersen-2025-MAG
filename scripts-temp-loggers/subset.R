# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))
idat <- idat[! idat$new.ID == 'NA', ]

ndat <- subset(idat, select = c('t.start', 'air.temp'))
ndat$pos <- 'ambient'
ndat$log.ID <- 'ambient'
colnames(ndat)[2] <- 'temp'

# temperature logger data: 
tdat <- rbind(t1, t2, t3, t4)

# Date problem: some as dd-mm-yy and some mm-dd-yyyy
# Luckily they can be told apart by number of year digits
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

tdat <- subset(tdat, select = c('t.start', 'temp', 'pos', 'log.ID'))

# dataframe for plotting time vs temp
d1 <- rbind(tdat, ndat)

# dataframe for plotting ambient vs in vs out temperatures 
tdat$t.start <- as.POSIXct(round_date(tdat$t.start, '10 min'), tz = 'UTC')
tdatO <- tdat[tdat$pos == 'out', ]
colnames(tdatO)[2:4] <- paste('O', colnames(tdatO)[2:4], sep = '.')
tdatI <- tdat[tdat$pos == 'in', ]
colnames(tdatI)[2:4] <- paste('I', colnames(tdatI)[2:4], sep = '.')

ndat$t.start <- as.POSIXct(round_date(ndat$t.start, '10 min'), tz = 'UTC')

d2 <- merge(tdatI, tdatO, by = 't.start')
d2 <- merge(d2, ndat, by = 't.start')

