

ds$e.rel.150 <- ds$e.rel.150 * 100

dsd <- subset(ds, treat1 %in% c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'))

# grouping digestates, pig slurry and cattle slurry separately and repeating plot above
IDs <- c(`A` =  'Digestate',
         `B` =  'Digestate',
         `C` =  'Digestate',
         `D` =  'Digestate',
         `E` =  'Digestate',
         `F` =  'Digestate',
         `G` =  'Digestate',
         `H` =  'Digestate',
         `I` =  'Digestate',
         `Cattle A` =  'Cattle',
         `Cattle B` =  'Cattle', 
         `Cattle C` =  'Cattle',
         `Pig A` =  'Pig',
         `Pig B` =  'Pig',
         `Pig C` =  'Pig')

ds[, dig1 := IDs[dig]]
dsd[, dig1 := IDs[dig]]

IDs <- c(`D1` =  'Trial 1',
         `D2` =  'Trial 2',
         `D3` =  'Trial 3',
         `D4` =  'Trial 4',
         `D5` =  'Trial 5')

ds[, trial.ID := IDs[new.ID.x]]
dsd[, trial.ID := IDs[new.ID.x]]


f11 <- ggplot(dsd, aes(area.perc.mn, e.rel.150, color = dig1, shape = trial.ID)) + 
  geom_point(color = '#00BA38') + 
  theme_bw() + 
  ylab(expression(paste(NH[3],' (% of TAN)'))) + xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(shape = guide_legend(nrow = 2))

f22 <- ggplot(dsd, aes(area.perc.mn, TS.mn, color = dig1, shape = trial.ID)) + 
  geom_point(color = '#00BA38') +
  theme_bw() + 
  ylab('Dry matter (%)') + xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(shape = guide_legend(nrow = 2))

mat <- matrix(c(1, 2),
              nrow = 1)

pf <- grid.arrange(f11, f22, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat1', plot = pf, height = 3.5, width = 5.5)



f1 <- ggplot(ds, aes(TS.mn, e.rel.150, color = dig1, shape = trial.ID)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Dry matter (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, color = dig1, shape = trial.ID)) + 
  geom_point() + 
  theme_bw() + 
  xlab('pH') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f3 <- ggplot(ds, aes(area.perc.mn, e.rel.150, color = dig1, shape = trial.ID)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Exposed surface area (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f4 <- ggplot(ds, aes(n.mn, e.rel.150, color = dig1, shape = trial.ID)) + 
  geom_point() + 
  theme_bw() + 
  xlab('m') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

mat <- matrix(c(1, 2,
                3, 4),
              nrow = 2, byrow = TRUE)

pf <- grid.arrange(f1, f2, f3, f4, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat2', plot = pf, height = 8, width = 6)


f5 <- ggplot(ds, aes(TS.mn, area.perc.mn, color = dig1, shape = trial.ID)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f6 <- ggplot(ds, aes(TS.mn, n.mn, color = dig1, shape = trial.ID)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('m') +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f7 <- ggplot(ds, aes(TS.mn, K.mn, color = dig1, shape = trial.ID)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('K') +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

f8 <- ggplot(ds, aes(TS.mn, pH.lab.mn, color = dig1, shape = trial.ID)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('pH') +
  theme(legend.position = 'bottom', legend.title = element_blank(), legend.box = 'vertical') +
  guides(shape = guide_legend(nrow = 2, order = 1), color = guide_legend(nrow = 1, order = 2))

mat <- matrix(c(1, 2,
                3, 4),
              nrow = 2, byrow = TRUE)

pf <- grid.arrange(f5, f6, f7, f8, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat3', plot = pf, height = 8, width = 6)


# Plots for Ramiran presentation october 2025
# long format: 
ds.long <- melt(
  ds,
  id.vars = 'dig1',
  measure.vars = c('TS.mn', 'K.mn', 'n.mn', 'pH.lab.mn'),
  variable.name = 'parameter',
  value.name = 'value'
)

names <- c(`TS.mn` =  'DM (%)',
         `K.mn` =  'K (viscosity)',
         `n.mn` =  'm (viscosity)',
         `pH.lab.mn` =  'pH')
ds.long[, names := names[parameter]]

dig2 <- c(`Digestate` =  'Digestate',
           `Pig` =  'Pig slurry',
           `Cattle` = 'Cattle slurry')
ds.long[, dig2 := dig2[dig1]]

ggplot(ds.long, aes(names, value)) + 
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(aes(color = dig2), width = 0.2, size = 2, alpha = 0.5) + 
  facet_wrap(~ names, scales = 'free', ncol = 4) +
  theme_bw() + 
  labs(x = NULL, y = NULL, color = NULL) +
  theme(legend.position = "left") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
ggsave2x('../plots-meas/dig.prop.Ramiran', height = 2, width = 6)

