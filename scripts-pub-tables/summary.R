# Summarizes data

# converting digestate properties from character to numeric
sapply(dig.dat, class)
cols.nam <- c('amount', 'dublicate', 'TS', 'VS', 'mm2', 'mm2TS', 'density', 'K', 'n', 'r2', 'ammonium.N.A', 'totN', 'pH.lab', 'pH.field')
dig.dat[, (cols.nam) := lapply(.SD, as.numeric), .SDcols = cols.nam]

# Mean and sd of digestate properties
dsumm <- dig.dat[ , list(
                      amount.mn = mean(amount),
                      TS.mn = mean(TS), TS.sd = sd(TS), TS.n = length(TS),
                      VS.mn = mean(VS), VS.sd = sd(VS), VS.n = length(VS),
                      mm2.mn = mean(mm2), mm2.sd = sd(mm2), mm2.n = length(mm2),
                      mm2TS.mn = mean(mm2TS), mm2TS.sd = sd(mm2TS), mm2TS.n = length(mm2TS), 
                      density.mn = mean(density), density.sd = sd(density), desnity.n = length(density),
                      K.mn = mean(K), K.sd = sd(K), K.n = length(K),
                      n.mn = mean(n), n.sd = mean(n), n.n = length(n),
                      r2.mn = mean(r2), r2.sd = sd(r2), r2.n = length(r2),
                      NH4.mn = mean(ammonium.N.A), NH4.sd = sd(ammonium.N.A), ammonium.N.A.n = length(ammonium.N.A), 
                      totN.mn = mean(totN), totN.sd = sd(totN), totN.n = length(totN),
                      pH.lab.mn = mean(pH.lab), pH.lab.sd = sd(pH.lab), pH.lab.n = length(pH.lab),
                      pH.field.mn = mean(pH.field), pH.field.sd = sd(pH.field), pH.field.n = length(pH.field)
                      ), by = list(experiment, code, cat, sep)]                     

# Mean and sd of ESA data
Esumm <- ESA.dat[ , list(
                        area.perc.mn = mean(area.perc), area.perc.sd = sd(area.perc), n.area.perc = length(area.perc)
                        ), by = list(experiment, treat)]

# converting soil properties from character to numeric
sapply(soil.dat, class)
cols.nam <- c('dublicate', 'bulk.dens', 'WC', 'W', 'crop.height', 'pH')
soil.dat[, (cols.nam) := lapply(.SD, as.numeric), .SDcols = cols.nam]

# Mean and sd of soil data 
ssumm <- soil.dat[, list(
                      bulk.mn = mean(bulk.dens), bulk.sd = sd(bulk.dens), bulk.n = length(bulk.dens), 
                      water.mn = mean(W), water.sd = sd(W), water.n = length(W) 
                      ), by = list(experiment, crop.height, pH)]






isumm <- rounddf(as.data.frame(isumm), digits = 3, func = signif)
esumm <- rounddf(as.data.frame(esumm), 3, func = signif)
wsumm <- rounddf(as.data.frame(wsumm), 3, func = signif)

# Select some cols from esumm to export
esumm.ex <- esumm[, c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 
