
# aligning date.time for the different files 


# tdat date.time
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
tdat$t.start <- as.POSIXct(round_date(tdat$t.start, '1 h'), tz = 'UTC')




idat$t.start <- as.POSIXct(round_date(idat$t.start, '1 h'), tz = 'UTC')




clim$t.start <- paste(clim$date, clim$time)
clim$t.start <- as.POSIXct(clim$t.start, format = '%Y-%m-%d %H:%M:%S', tz = 'UTC')
