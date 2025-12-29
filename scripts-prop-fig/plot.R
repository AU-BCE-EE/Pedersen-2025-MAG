

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

IDs <- c(`D1` =  '1',
         `D2` =  '2',
         `D3` =  '3',
         `D4` =  '4',
         `D5` =  '5')

ds[, trial.ID := IDs[new.ID.x]]
dsd[, trial.ID := IDs[new.ID.x]]


f11 <- ggplot(dsd, aes(area.perc.mn, e.rel.150)) + 
  geom_text(aes(label = trial.ID)) +
  theme_bw() +
  ylab(expression(paste(NH[3],' (% of TAN)'))) +
  xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

f112 <- ggplot(dsd, aes(TS.mn, e.rel.150)) + 
  geom_text(aes(label = trial.ID)) +
  theme_bw() +
  ylab(expression(paste(NH[3],' (% of TAN)'))) +
  xlab('Dry matter (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

f22 <- ggplot(dsd, aes(area.perc.mn, TS.mn)) + 
  geom_text(aes(label = trial.ID)) +
  theme_bw() + 
  ylab('Dry matter (%)') + 
  xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

mat <- matrix(c(1, 2, 3),
              nrow = 1)

pf <- grid.arrange(f11, f112, f22, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat1', plot = pf, height = 3, width = 8)


##########################################################
# # Plot for Ramiran presentation
# 
# treat_colors <- c(
#   'A' = '#c6dbef',
#   'B' = '#6baed6',
#   'C' = '#2171b5',
#   'D' = '#08306b',
#   'E' = '#9ecae1',
#   'F' = '#4292c6',
#   'G' = '#08519c',
#   'H' = '#3182bd',
#   'I' = '#bdd7e7')
# 
# IDs <- c(`A` =  'D1',
#          `B` =  'D2',
#          `C` =  'D3',
#          `D` =  'D4',
#          `E` =  'D5',
#          `F` =  'D6',
#          `G` =  'D7',
#          `H` =  'D8',
#          `I` =  'D9')
# dsd[, new.treat1 := IDs[treat1]]
# dsd[, new.treat1 := IDs[treat1]]
# 
# treat_colors <- c(
#   'D1' = '#c6dbef',
#   'D2' = '#6baed6',
#   'D3' = '#2171b5',
#   'D4' = '#08306b',
#   'D5' = '#9ecae1',
#   'D6' = '#4292c6',
#   'D7' = '#08519c',
#   'D8' = '#3182bd',
#   'D9' = '#bdd7e7')
# 
# 
# f11 <- ggplot(dsd, aes(area.perc.mn, e.rel.150, color = new.treat1, shape = trial.ID)) +
#   geom_point(size = 3) +
#   theme_bw() +
#   ylab(expression(paste(NH[3],' (% of TAN)'))) + xlab('Exposed surface area (%)') +
#   theme(legend.position = 'left', legend.title = element_blank()) +
#   scale_color_manual(values = treat_colors) + 
#   guides(color = 'none')
# 
# f22 <- ggplot(dsd, aes(area.perc.mn, TS.mn, color = new.treat1, shape = trial.ID)) +
#   geom_point(size = 3) +
#   theme_bw() +
#   ylab('Dry matter (%)') + xlab('Exposed surface area (%)') +
#   theme(legend.title = element_blank()) +
#   scale_color_manual(values = treat_colors) + 
#   guides(color = 'none')
# 
# mat <- matrix(c(1, 2),
#               nrow = 1)
# 
# pf <- grid.arrange(f11, f22, layout_matrix = mat)
# ggsave2x('../plots-meas/dig.prop.supMat1_Ramiran', plot = pf, height = 3.5, width = 8.5)

########################################################

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




f5 <- ggplot(ds, aes(TS.mn, area.perc.mn, color = dig1)) + 
  geom_text(aes(label = trial.ID)) +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('Exposed surface area (%)') +
  theme(legend.position = 'none')

f6 <- ggplot(ds, aes(TS.mn, n.mn, color = dig1)) + 
  geom_text(aes(label = trial.ID)) +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab(expression(italic(m))) +
  theme(legend.position = 'none',
    axis.title.y = element_text(family = "serif"))

mat <- matrix(c(1, 2),
              nrow = 1, byrow = TRUE)

pf <- grid.arrange(f5, f6, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.DMall', plot = pf, height = 3, width = 5.3)




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

mat <- matrix(c(1, 2),
              nrow = 1, byrow = TRUE)

pf <- grid.arrange(f7, f8, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat3', plot = pf, height = 4, width = 6)


# #####################################################################
# # Plots for Ramiran presentation october 2025
# # long format: 
# ds.long <- melt(
#   ds,
#   id.vars = 'dig',
#   measure.vars = c('TS.mn', 'K.mn', 'n.mn', 'pH.lab.mn'),
#   variable.name = 'parameter',
#   value.name = 'value'
# )
# 
# names <- c(`TS.mn` =  'DM (%)',
#          `K.mn` =  'K (viscosity)',
#          `n.mn` =  'm (viscosity)',
#          `pH.lab.mn` =  'pH')
# ds.long[, names := names[parameter]]
# 
# IDs <- c(`A` =  'D1',
#          `B` =  'D2',
#          `C` =  'D3',
#          `D` =  'D4',
#          `E` =  'D5',
#          `F` =  'D6',
#          `G` =  'D7',
#          `H` =  'D8',
#          `I` =  'D9',
#          `Cattle A` =  'C1',
#          `Cattle B` =  'C2',
#          `Cattle C` =  'C3',
#          `Pig A` =  'P1',
#          `Pig B` =  'P2',
#          `Pig C` =  'P3')
# ds.long[, dig1 := IDs[dig]]
# 
# IDs <- c(`A` =  'Digestate',
#          `B` =  'Digestate',
#          `C` =  'Digestate',
#          `D` =  'Digestate',
#          `E` =  'Digestate',
#          `F` =  'Digestate',
#          `G` =  'Digestate',
#          `H` =  'Digestate',
#          `I` =  'Digestate',
#          `Cattle A` =  'Cattle slurry',
#          `Cattle B` =  'Cattle slurry',
#          `Cattle C` =  'Cattle slurry',
#          `Pig A` =  'Pig slurry',
#          `Pig B` =  'Pig slurry',
#          `Pig C` =  'Pig slurry')
# ds.long[, dig2 := IDs[dig]]
# 
# treat_colors <- c(
#   'D1' = '#c6dbef',
#   'D2' = '#6baed6',
#   'D3' = '#2171b5',
#   'D4' = '#08306b',
#   'D5' = '#9ecae1',
#   'D6' = '#4292c6',
#   'D7' = '#08519c',
#   'D8' = '#3182bd',
#   'D9' = '#bdd7e7',
#   'C1' = '#a1d99b',
#   'C2' = '#31a354',
#   'C3' = '#006d2c',
#   'P1' = '#fc9272',
#   'P2' = '#de2d26',
#   'P3' = '#a50f15')
# 
# mean_colors <- c(
#   'Digestate' = '#4292c6', 
#   'Pig slurry' = '#de2d26', 
#   'Cattle slurry' = '#31a354')
# 
# ggplot(ds.long, aes(dig2, value)) + 
#   stat_summary(aes(color = dig2), fun = mean, geom = 'crossbar', width = 0.6, fatten = 2) + 
#   geom_jitter(aes(color = dig1), width = 0.2, size = 2, alpha = 0.5) + 
#   facet_wrap( ~ names, scales = 'free', nrow = 1) +
#   theme_bw() + 
#   labs(x = NULL, y = NULL, color = NULL) +
#   theme(legend.position = "none") + 
#   theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + 
#  scale_color_manual(values = c(treat_colors, mean_colors))
# ggsave2x('../plots-meas/dig.prop.Ramiran', height = 2.2, width = 6)

