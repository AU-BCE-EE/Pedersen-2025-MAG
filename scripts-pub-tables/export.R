
# Combinding ESA data with digestate properties data
colnames(Esumm)[which(names(Esumm) == 'treat')] <- 'dig'
dsumm <- merge(dsumm, Esumm, by = c('experiment', 'dig'), all.x = TRUE)

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
# Paper on digestate application and treatment: 
dsumm.treat1 <- dsumm[is.element(dsumm$experiment, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')), 
                   c('experiment', 'dig', 'straw', 'treat', 'TS', 'VS', 'NH4', 'totN', 'pH.lab', 'pH.field', 'amount.mn', 'app.rate.mn')] 

dsumm.treat2 <- dsumm[is.element(dsumm$experiment, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')), 
                      c('experiment', 'dig', 'straw', 'treat', 'density.mn', 'mm2', 'mm2TS', 'K.mn', 'n.mn')] 

# Paper on digestate properties:
dsumm.prop <- dsumm[is.element(dsumm$experiment, c('23H', '23I', '24E', '24F', '24G')), 
                   c('experiment', 'dig', 'straw', 'treat', 'TS', 'VS', 'density.mn', 'mm2', 'mm2TS', 
                     'K.mn', 'n.mn', 'ESA', 'NH4', 'totN', 'pH.lab', 'pH.field', 'amount.mn', 'app.rate.mn')] 

write.csv(dsumm.treat1, '../output/digestate.table.treat1.csv', row.names = FALSE)
write.csv(dsumm.treat2, '../output/digestate.table.treat2.csv', row.names = FALSE)
write.csv(dsumm.prop, '../output/digestate.table.prop.csv', row.names = FALSE)


# Experimental time, soil conditions and temperature 

# Temperature
temp.dat$temp.mean <- paste(temp.dat$air.temp.mean, '(', temp.dat$air.temp.min, ',', temp.dat$air.temp.max,')')
colnames(temp.dat)[which(names(temp.dat) == 'trial')] <- 'experiment'

# # Add application method (manual/machine) and treamtment to data frame
# tk <- c(`23C` = 'Manual', `23D` = 'Manual', `23G` = 'Manual', `23H` = 'Manual', `23I` = 'Manual')
# temp.dat$app.meth <- tk[temp.dat$experiment]
# 
# tk <- c(`23C` = 'Treatment of digestate', `23D` = 'Treatment of digestate', `23G` = 'Treatment of digestate', 
#         `23H` = 'Digestate properties', `23I` = 'Digestate properties')
# temp.dat$treat.var <- tk[temp.dat$experiment]

# Soil data
ssumm$water <- paste(ssumm$water.mn, ' ± ', ssumm$water.sd)
ssumm$bulk <- paste(ssumm$bulk.mn, ' ± ', ssumm$bulk.sd)

# CHECK THAT BELOW IS RUNNING AFTER GETTING ALL TEMP DATA IN

stsumm <- merge(temp.dat, ssumm, by = c('experiment'))

stsumm.treat <- stsumm[is.element(stsumm$experiment, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')),
                       c('experiment', 'water', 'bulk', 'pH', 'crop.height', 'air.temp.start', 'temp.mean')]

stsumm.prop <- stsumm[is.element(stsumm$experiment, c('23H', '23I', '24E', '24F', '24G')), 
                       c('experiment', 'water', 'bulk', 'pH', 'crop.height', 'air.temp.start', 'temp.mean')]

write.csv(stsumm.treat, '../output/soil.table.treat.csv', row.names = FALSE)
write.csv(stsumm.prop, '../output/soil.table.prop.csv', row.names = FALSE)

# Column with measurement duration 
dt.treat <- stsumm[is.element(stsumm$experiment, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')),
                       c('dt')]
dt.prop <- stsumm[is.element(stsumm$experiment, c('23H', '23I', '24E', '24F', '24G')),
                    c('dt')]

write.csv(dt.treat, '../output/dt.treat.csv', row.names = FALSE)
write.csv(dt.prop, '../output/dt.prop.table.prop.csv', row.names = FALSE)
