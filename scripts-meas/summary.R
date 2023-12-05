# Summarizes measurements

# cumulative emissions: 
isumm <- idat[, .(e.cum.final = max(e.cum), 
                     e.rel.final = max(e.rel),
                     e.cum.150 = approx(cta, e.cum, xout = 150)$y,
                     e.rel.150 = approx(cta, e.rel, xout = 150)$y
                     ), by = list(trial, treat, pmid)]

# remove one observation where there is no measurements after 2.48 h.
isumm <- isumm[! is.na(e.rel.150)]

# temperature data 
wsumm <- idat[, .(dt = t.start.p[1],
                      air.temp.start = mean(air.temp[interval == 1]), 
                      air.temp.mean = mean(air.temp), 
                      air.temp.min = min(air.temp), 
                      air.temp.max = max(air.temp)) 
                      , by = list(trial)]

# Mean and sd of cumulative emission
esumm <- isumm[ , list(
                       pmid = paste(pmid, collapse = ', '),
                       e.rel.final = mean(e.rel.final), e.rel.final.sd = sd(e.rel.final), e.rel.final.n = length(e.rel.final),
                       e.cum.final = mean(e.cum.final), e.cum.final.sd = sd(e.cum.final), e.cum.final.n = length(e.cum.final),
                       e.rel.150 = mean(e.rel.150), e.rel.150.sd = sd(e.rel.150), e.rel.150.n = length(e.rel.150),
                       e.cum.150 = mean(e.cum.150), e.cum.150.sd = sd(e.cum.150), e.cum.150.n = length(e.cum.150)
                       ), by = list(trial, treat)]

isumm <- rounddf(as.data.frame(isumm), digits = 3, func = signif)
esumm <- rounddf(as.data.frame(esumm), 3, func = signif)
wsumm <- rounddf(as.data.frame(wsumm), 3, func = signif)

# Select some cols from esumm to export
esumm.ex <- esumm[, c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 
