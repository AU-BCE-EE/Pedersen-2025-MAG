# Summarizes data

# converting digestate properties from character to numeric
sapply(dig.dat, class)
cols <- c('amount', 'dublicate', 'TS', 'VS', 'mm2', 'mm2TS', 'density', 'K', 'n', 'r2', 'ammonium.N.A', 'totN', 'pH.lab', 'pH.field')
dig.dat[, (cols) := lapply(.SD, as.numeric), .SDcols = cols]

# Mean and sd of digestate properties
dsumm <- dig.dat[ , list(
                      amount.mn = mean(amount),
                      TS.mn = mean(TS), TS.sd = sd(TS), TS.n = length(TS),
                      VS.mn = mean(VS), VS.sd = sd(VS), VS.n = length(VS),
                      mm2.mn = mean(mm2), mm2.sd = sd(mm2), mm2.n = length(mm2),
                      mm2TS.mn = mean(mm2TS), mm2TS.sd = sd(mm2TS), mm2TS.n = length(mm2TS), 
                      density.mn = mean(density), desnity.n = length(density),
                      K.mn = mean(K), K.n = length(K),
                      n.mn = mean(n), n.n = length(n),
                      r2.mn = mean(r2),
                      NH4.mn = mean(ammonium.N.A), NH4.sd = sd(ammonium.N.A), ammonium.N.A.n = length(ammonium.N.A), 
                      totN.mn = mean(totN), totN.sd = sd(totN), totN.n = length(totN),
                      pH.lab.mn = mean(pH.lab), pH.lab.sd = sd(pH.lab), pH.lab.n = length(pH.lab),
                      pH.field.mn = mean(pH.field), pH.field.sd = sd(pH.field), pH.field.n = length(pH.field)
                      ), by = list(experiment, code, cat, sep)]                     

# changing TAN and totN from mg/kg to g/kg
cols <- c('totN.mn', 'totN.sd', 'NH4.mn', 'NH4.sd')
dsumm[, (cols) := lapply(.SD, function(x) x / 1000), .SDcols = cols]

# calculating app amount 
dsumm$app.rate.mn <- dsumm$NH4.mn * dsumm$amount.mn
dsumm$app.rate.sd <- dsumm$NH4.sd * dsumm$amount.mn

sig2 <- c('amount.mn', 'app.rate.mn', 'NH4.mn', 'NH4.sd', 'totN.mn', 'totN.sd', 'pH.lab.mn', 'pH.lab.sd', 'pH.field.mn', 'pH.field.sd')
sig3 <- c('TS.mn', 'TS.sd', 'mm2.mn', 'mm2.sd', 'mm2TS.mn', 'mm2TS.sd', 'density.mn', 'r2.mn')
sig4 <- c('VS.mn', 'VS.sd', 'K.mn', 'n.mn')

dsumm <- as.data.frame(dsumm)
dsumm[, sig2] <- rounddf(dsumm[, sig2], digits = 2, func = signif)
dsumm[, sig3] <- rounddf(dsumm[, sig3], digits = 3, func = signif)
dsumm[, sig4] <- rounddf(dsumm[, sig4], digits = 4, func = signif)


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






Esumm <- rounddf(as.data.frame(Esumm), 2, func = signif)
ssumm <- rounddf(as.data.frame(ssumm), 2, func = signif)



# Select some cols from esumm to export
esumm.ex <- esumm[, c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 






dv.summ1$cum <- paste(dv.summ1$cum.mn, ' ± ', dv.summ1$cum.sd)

dv.summ1 <- dv.summ1[ , c('exp', 'elapsed.time', 'treat', 'compound', 'cum')]