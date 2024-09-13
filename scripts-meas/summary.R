# Summarizes measurements

# cumulative emissions: 
isumm1 <- idat[, .(e.cum.final = max(e.cum), 
                     e.rel.final = max(e.rel),
                     e.cum.150 = approx(cta, e.cum, xout = 150)$y,
                     e.rel.150 = approx(cta, e.rel, xout = 150)$y
                     ), by = list(trial, treat, pmid)]

# cumulative emissions for experiments 24C, 24N, 24O as they are not close to 150 h emission: 
isumm2 <- idat[is.element(idat$exper, c('24C', '24N', '24O')), .(e.cum.final = max(e.cum), 
                  e.rel.final = max(e.rel),
                  e.cum.150 = approx(cta, e.cum, xout = 85)$y,
                  e.rel.150 = approx(cta, e.rel, xout = 85)$y
), by = list(trial, treat, pmid)]


# combining the isumm
isumm <- rbind(isumm1, isumm2)

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
esumm.treat <- esumm[is.element(esumm$trial, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')), c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 
esumm.treat.sup <- esumm[is.element(esumm$trial, c('24B', '24H', '24A', '24I', '24K')), c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 
esumm.prop <- esumm[is.element(esumm$trial, c('23H', '23I', '24E', '24F', '24G')), c('trial', 'treat', 'e.rel.150', 'e.rel.150.sd', 'e.rel.150.n')] 
