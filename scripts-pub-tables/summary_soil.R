# Summarizes data

# converting soil properties from character to numeric
sapply(soil.dat, class)
cols.nam <- c('dublicate', 'bulk.dens', 'WC', 'W', 'crop.height', 'pH')
soil.dat[, (cols.nam) := lapply(.SD, as.numeric), .SDcols = cols.nam]

# Mean and sd of soil data 
ssumm <- soil.dat[, list(
  bulk.mn = mean(bulk.dens), bulk.sd = sd(bulk.dens), bulk.n = length(bulk.dens), 
  water.mn = mean(W), water.sd = sd(W), water.n = length(W) 
), by = list(experiment, crop.height, pH)]

sig2 <- c('water.mn', 'water.sd')
sig3 <- c('bulk.mn', 'bulk.sd')

ssumm <- as.data.frame(ssumm)
ssumm[, sig2] <- rounddf(ssumm[, sig2], digits = 2, func = signif)
ssumm[, sig3] <- rounddf(ssumm[, sig3], digits = 3, func = signif)
