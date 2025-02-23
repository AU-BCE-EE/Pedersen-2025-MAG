
# Combinding ESA data with digestate properties data
colnames(Esumm)[which(names(Esumm) == 'treat')] <- 'dig'
colnames(Esumm)[which(names(Esumm) == 'experiment')] <- 'Trial_B'
dsumm <- merge(dsumm, Esumm, by = c('Trial_B', 'dig'), all.x = TRUE)

# Digestate properties 
dsumm$TS <- paste(dsumm$TS.mn, ' ± ', dsumm$TS.sd)
dsumm$VS <- paste(dsumm$VS.mn, ' ± ', dsumm$VS.sd)
dsumm$ESA <- paste(dsumm$area.perc.mn, ' ± ', dsumm$area.perc.sd)
dsumm$mm2 <- paste(dsumm$mm2.mn, ' ± ', dsumm$mm2.sd)
dsumm$mm2TS <- paste(dsumm$mm2TS.mn, ' ± ', dsumm$mm2TS.sd)
dsumm$d01 <- paste(dsumm$d01.mn, ' ± ', dsumm$d01.sd)
dsumm$d05 <- paste(dsumm$d05.mn, ' ± ', dsumm$d05.sd)
dsumm$d09 <- paste(dsumm$d09.mn, ' ± ', dsumm$d09.sd)
dsumm$ssa <- paste(dsumm$ssa.mn, ' ± ', dsumm$ssa.sd)
dsumm$swm <- paste(dsumm$swm.mn, ' ± ', dsumm$swm.sd)
dsumm$vwm <- paste(dsumm$vwm.mn, ' ± ', dsumm$vwm.sd)
dsumm$mm1 <- paste(dsumm$mm1.mn, ' ± ', dsumm$mm1.sd)
dsumm$mm12 <- paste(dsumm$mm12.mn, ' ± ', dsumm$mm12.sd)
dsumm$K <- paste(dsumm$K.mn, ' ± ', dsumm$K.sd)
dsumm$n <- paste(dsumm$n.mn, ' ± ', dsumm$n.sd)
dsumm$NH4 <- paste(dsumm$NH4.mn, ' ± ', dsumm$NH4.sd)
dsumm$totN <- paste(dsumm$totN.mn, ' ± ', dsumm$totN.sd)
dsumm$pH.lab <- paste(dsumm$pH.lab.mn, ' ± ', dsumm$pH.lab.sd)
dsumm$pH.field <- paste(dsumm$pH.field.mn, ' ± ', dsumm$pH.field.sd)

# Select some cols from esumm to export
# Paper on digestate application and treatment: 
dsumm.treat1 <- dsumm[is.element(dsumm$Trial_B, c('1', '2', '3', '4', '9', '5', '6', '10', '7', '8', '11', '12')), 
                   c('new.ID', 'dig', 'straw', 'treat', 'TS', 'VS', 'NH4', 'totN', 'pH.lab', 'pH.field', 'amount.mn', 'app.rate.mn')] 

dsumm.treat2 <- dsumm[is.element(dsumm$Trial_B, c('1', '2', '3', '4', '9', '5', '6', '10', '7', '8', '11', '12')), 
                      c('new.ID', 'dig', 'straw', 'treat', 'mm2', 'mm2TS', 'ssa', 'swm', 'vwm', 'mm1', 'mm12', 'K', 'n')] 

# Paper on digestate properties:
# dsumm.prop <- dsumm[is.element(dsumm$Trial_B, c('D1', 'D2', 'D3', 'D4', 'D5')), 
#                    c('new.ID', 'dig', 'straw', 'treat', 'TS', 'VS', 'mm2', 'mm2TS', 
#                      'K.mn', 'n.mn', 'ESA', 'NH4', 'totN', 'pH.lab', 'pH.field', 'amount.mn', 'app.rate.mn')] 

dsumm.prop1 <- dsumm[is.element(dsumm$Trial_B, c('D1', 'D2', 'D3', 'D4', 'D5')), 
                      c('new.ID', 'dig', 'straw', 'treat', 'TS', 'VS', 'NH4', 'totN', 'pH.lab', 'pH.field', 'amount.mn', 'app.rate.mn')] 

dsumm.prop2 <- dsumm[is.element(dsumm$Trial_B, c('D1', 'D2', 'D3', 'D4', 'D5')), 
                      c('new.ID', 'dig', 'straw', 'treat', 'mm2', 'mm2TS', 'ssa', 'swm', 'vwm', 'mm1', 'mm12', 'K', 'n')] 


write.csv(dsumm.treat1, '../output/digestate.table.treat1.csv', row.names = FALSE)
write.csv(dsumm.treat2, '../output/digestate.table.treat2.csv', row.names = FALSE)
write.csv(dsumm.prop1, '../output/digestate.table.prop1.csv', row.names = FALSE)
write.csv(dsumm.prop2, '../output/digestate.table.prop2.csv', row.names = FALSE)

# Experimental time, soil conditions and temperature 

# Temperature
temp.dat$temp.mean <- paste(temp.dat$air.temp.mean, '(', temp.dat$air.temp.min, ',', temp.dat$air.temp.max,')')
colnames(temp.dat)[which(names(temp.dat) == 'trial')] <- 'experiment'

# Soil data
ssumm$water <- paste(ssumm$water.mn, ' ± ', ssumm$water.sd)
ssumm$bulk <- paste(ssumm$bulk.mn, ' ± ', ssumm$bulk.sd)

temp.dat$Trial_B <- temp.dat$new.ID
stsumm <- merge(temp.dat, ssumm, by = c('Trial_B'))

stsumm.treat <- stsumm[is.element(stsumm$Trial_B, c('1', '2', '3', '4', '9', '5', '6', '10', '7', '8', '11', '12')),
                       c('new.ID', 'water', 'bulk', 'pH', 'crop.height', 'air.temp.start', 'temp.mean')]

stsumm.prop <- stsumm[is.element(stsumm$Trial_B, c('D1', 'D2', 'D3', 'D4', 'D5')), 
                       c('new.ID', 'water', 'bulk', 'pH', 'crop.height', 'air.temp.start', 'temp.mean')]

write.csv(stsumm.treat, '../output/soil.table.treat.csv', row.names = FALSE)
write.csv(stsumm.prop, '../output/soil.table.prop.csv', row.names = FALSE)

# Column with measurement duration 
dt.treat <- stsumm[is.element(stsumm$Trial_B, c('1', '2', '3', '4', '9', '5', '6', '10', '7', '8', '11', '12')),
                       c('new.ID', 'dt')]
dt.prop <- stsumm[is.element(stsumm$Trial_B, c('D1', 'D2', 'D3', 'D4', 'D5')),
                    c('new.ID', 'dt')]

write.csv(dt.treat, '../output/dt.treat.csv', row.names = FALSE)
write.csv(dt.prop, '../output/dt.prop.csv', row.names = FALSE)

