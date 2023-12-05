
# Combinding ESA data with digestate properties data
colnames(Esumm)[which(names(Esumm) == 'treat')] <- 'code'
dsumm <- merge(dsumm, Esumm, by = c('experiment', 'code'), all.x = TRUE)

# Digestate properties 
dsumm$TS <- paste(dsumm$TS.mn, ' ± ', dsumm$TS.sd)
dsumm$VS <- paste(dsumm$VS.mn, ' ± ', dsumm$VS.sd)
dsumm$ESA <- paste(dsumm$area.perc.mn, ' ± ', dsumm$area.perc.sd)
dsumm$mm2 <- paste(dsumm$mm2.mn, ' ± ', dsumm$mm2.sd)
dsumm$mm2TS <- paste(dsumm$mm2TS.mn, ' ± ', dsumm$mm2TS.sd)
dsumm$NH4 <- paste(dsumm$NH4.mn, ' ± ', dsumm$NH4.sd)
dsumm$totN <- paste(dsumm$totN.mn, ' ± ', dsumm$totN.sd)
dsumm$pH.lab <- paste(dsumm$pH.lab.mn, ' ± ', dsumm$pH.lab.sd)
dsumm$pH.field <- paste(dsumm$pH.field.mn, ' ± ', dsumm$pH.field.sd)

# Select some cols from esumm to export
dsumm.ex <- dsumm[, c('experiment', 'code', 'cat', 'sep', 'amount.mn', 'app.rate.mn', 'TS', 'VS', 'ESA', 'mm2', 'mm2TS', 'density.mn', 'K.mn', 'n.mn', 'r2.mn', 
                      'NH4', 'totN', 'pH.lab', 'pH.field')] 

write.csv(dsumm.ex, '../output/digestate.table.csv', row.names = FALSE)


# Experimental time, soil conditions and temperature 

# Temperature
temp.dat$temp.mean <- paste(temp.dat$air.temp.mean, '(', temp.dat$air.temp.min, ',', temp.dat$air.temp.max,')')
colnames(temp.dat)[which(names(temp.dat) == 'trial')] <- 'experiment'

# Add application method (manual/machine) and treamtment to data frame
tk <- c(`23C` = 'Manual', `23D` = 'Manual', `23G` = 'Manual', `23H` = 'Manual', `23I` = 'Manual')
temp.dat$app.meth <- tk[temp.dat$experiment]

tk <- c(`23C` = 'Treatment of digestate', `23D` = 'Treatment of digestate', `23G` = 'Treatment of digestate', 
        `23H` = 'Digestate properties', `23I` = 'Digestate properties')
temp.dat$treat.var <- tk[temp.dat$experiment]

# Soil data
ssumm$bulk <- paste(ssumm$bulk.mn, ' ± ', ssumm$bulk.sd)
ssumm$water <- paste(ssumm$water.mn, ' ± ', ssumm$water.sd)

stsumm <- merge(temp.dat, ssumm, by = c('experiment'))
stsumm.ex <- stsumm[, c('experiment', 'dt', 'app.meth', 'treat.var', 'bulk', 'water', 'pH', 'crop.height', 'air.temp.start', 'temp.mean')]

write.csv(stsumm.ex, '../output/trial.table.csv', row.names = FALSE)
