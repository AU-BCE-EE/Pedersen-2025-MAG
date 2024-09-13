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

# New ID's for treatment publication
ssumm$new.ID <- ssumm$experiment
ssumm$new.ID <- gsub('23C', '1', ssumm$new.ID)
ssumm$new.ID <- gsub('23D', '2', ssumm$new.ID)
ssumm$new.ID <- gsub('23G', '3', ssumm$new.ID)
ssumm$new.ID <- gsub('24M', '4', ssumm$new.ID)
ssumm$new.ID <- gsub('24B', '5', ssumm$new.ID)
ssumm$new.ID <- gsub('24H', '6', ssumm$new.ID)
ssumm$new.ID <- gsub('24C', '7', ssumm$new.ID)
ssumm$new.ID <- gsub('24D', '8', ssumm$new.ID)
ssumm$new.ID <- gsub('24J', '9', ssumm$new.ID)
ssumm$new.ID <- gsub('24L', '10', ssumm$new.ID)
ssumm$new.ID <- gsub('24N', '11', ssumm$new.ID)
ssumm$new.ID <- gsub('24O', '12', ssumm$new.ID)
ssumm$new.ID <- gsub('24A', '13', ssumm$new.ID)
ssumm$new.ID <- gsub('24I', '14', ssumm$new.ID)
ssumm$new.ID <- gsub('24K', '15', ssumm$new.ID)

# New ID's for properties publication
ssumm$new.ID <- gsub('23H', '1', ssumm$new.ID)
ssumm$new.ID <- gsub('23I', '2', ssumm$new.ID)
ssumm$new.ID <- gsub('24E', '3', ssumm$new.ID)
ssumm$new.ID <- gsub('24F', '4', ssumm$new.ID)
ssumm$new.ID <- gsub('24G', '5', ssumm$new.ID)