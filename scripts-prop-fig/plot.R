

ds$e.rel.150 <- ds$e.rel.150 * 100

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

IDs <- c(`D1` =  '1',
         `D2` =  '2',
         `D3` =  '3',
         `D4` =  '4',
         `D5` =  '5')

ds[, trial.ID := IDs[new.ID.x]]


ds$area.perc.mn <- as.numeric(ds$area.perc.mn)

ds$logK.mn <- log(ds$K.mn)

# reshaping to long format with the needed variables
ds_long <- melt(
  ds[, .(trial.ID, dig, dig1, e.rel.150,
         mm2.mn, mm1.mn, logK.mn, n.mn, area.perc.mn)],
  id.vars = c("trial.ID", "dig", "dig1", "e.rel.150"),
  variable.name = "variable",
  value.name = "value"
)


new.names <- c(`mm2.mn` =  'Particles > 2 mm (%)',
               `mm1.mn` =  'Particles < 1 mm (% total particles < 2 mm)',
               `logK.mn` =  'log(K)',
               `n.mn` =  'm',
               `area.perc.mn` =  'Exposed surface area (%)')

ds_long[, new.names := new.names[variable]]

cols <- c("#1B9E77", "#D95F02", "#7570B3")

ggplot(ds_long, aes(value, e.rel.150, colour = dig1)) +
  geom_point(shape = 21, fill = 'white', size = 4.5) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) + 
  facet_wrap(~ new.names, scales = 'free_x', ncol = 3) + 
  scale_colour_manual(values = cols) +
  labs(y = 'Relative emission (% TAN)', colour = '') +
  theme_bw() +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = 'top')
ggsave2x('../plots-meas/scatter', height = 5, width = 6.5)


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

