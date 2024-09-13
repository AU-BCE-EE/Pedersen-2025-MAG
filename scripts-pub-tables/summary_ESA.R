# Summarizes data

# Mean and sd of ESA data
Esumm <- ESA.dat[ , list(
  area.perc.mn = mean(area.perc), area.perc.sd = sd(area.perc), n.area.perc = length(area.perc)
), by = list(experiment, treat)]

Esumm <- rounddf(as.data.frame(Esumm), 2, func = signif)
