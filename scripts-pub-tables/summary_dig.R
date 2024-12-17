# Summarizes data

# converting digestate properties from character to numeric
sapply(dig.dat, class)
cols <- c('amount', 'dublicate', 'TS', 'VS', 'mm2', 'mm2TS', 'd01', 'd05', 'd09', 'ssa', 'swm', 'vwm', 'mm1', 'mm12', 'K', 'n', 'r2', 'ammonium.N.A', 'totN', 'pH.lab', 'pH.field')
dig.dat[, (cols) := lapply(.SD, as.numeric), .SDcols = cols]

# Mean and sd of digestate properties
dsumm <- dig.dat[ , list(
                      amount.mn = mean(amount),
                      TS.mn = mean(TS, na.rm = TRUE), TS.sd = sd(TS, na.rm = TRUE), TS.n = length(TS),
                      VS.mn = mean(VS, na.rm = TRUE), VS.sd = sd(VS, na.rm = TRUE), VS.n = length(VS),
                      mm2.mn = mean(mm2, na.rm = TRUE), mm2.sd = sd(mm2, na.rm = TRUE), mm2.n = length(mm2),
                      mm2TS.mn = mean(mm2TS, na.rm = TRUE), mm2TS.sd = sd(mm2TS, na.rm = TRUE), mm2TS.n = length(mm2TS),
                      d01.mn = mean(d01, na.rm = TRUE), d01.sd = sd(d01, na.rm = TRUE), d01.n = length(d01),
                      d05.mn = mean(d05, na.rm = TRUE), d05.sd = sd(d05, na.rm = TRUE), d05.n = length(d05),
                      d09.mn = mean(d09, na.rm = TRUE), d09.sd = sd(d09, na.rm = TRUE), d09.n = length(d09),
                      ssa.mn = mean(ssa, na.rm = TRUE), ssa.sd = sd(ssa, na.rm = TRUE), ssa.n = length(ssa),
                      swm.mn = mean(swm, na.rm = TRUE), swm.sd = sd(swm, na.rm = TRUE), swm.n = length(swm),
                      vwm.mn = mean(vwm, na.rm = TRUE), vwm.sd = sd(vwm, na.rm = TRUE), vwm.n = length(vwm),
                      mm1.mn = mean(mm1, na.rm = TRUE), mm1.sd = sd(mm1, na.rm = TRUE), mm1.n = length(mm1),
                      mm12.mn = mean(mm12, na.rm = TRUE), mm12.sd = sd(mm12, na.rm = TRUE), mm12.n = length(mm12),
                      K.mn = mean(K, na.rm = TRUE), K.sd = sd(K, na.rm = TRUE), K.n = length(K),
                      n.mn = mean(n, na.rm = TRUE), n.sd = sd(n, na.rm = TRUE), n.n = length(n),
                      NH4.mn = mean(ammonium.N.A, na.rm = TRUE), NH4.sd = sd(ammonium.N.A, na.rm = TRUE), ammonium.N.A.n = length(ammonium.N.A), 
                      totN.mn = mean(totN, na.rm = TRUE), totN.sd = sd(totN, na.rm = TRUE), totN.n = length(totN),
                      pH.lab.mn = mean(pH.lab, na.rm = TRUE), pH.lab.sd = sd(pH.lab, na.rm = TRUE), pH.lab.n = length(pH.lab),
                      pH.field.mn = mean(pH.field, na.rm = TRUE), pH.field.sd = sd(pH.field, na.rm = TRUE), pH.field.n = length(pH.field)
                      ), by = list(Trial_A, Trial_B, dig, straw, treat, acid)]                     

# changing TAN and totN from mg/kg to g/kg
cols <- c('totN.mn', 'totN.sd', 'NH4.mn', 'NH4.sd')
dsumm[, (cols) := lapply(.SD, function(x) x / 1000), .SDcols = cols]

# calculating app amount 
dsumm$app.rate.mn <- dsumm$NH4.mn * dsumm$amount.mn
dsumm$app.rate.sd <- dsumm$NH4.sd * dsumm$amount.mn

dsumm <- as.data.frame(dsumm)
dsumm <- rounddf(dsumm, digits = 4, func = signif)

# New ID's for treatment publication
dsumm$new.ID <- dsumm$Trial_B


