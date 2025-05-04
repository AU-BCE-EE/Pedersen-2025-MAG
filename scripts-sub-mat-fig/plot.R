

ds$e.rel.150 <- ds$e.rel.150 * 100

dsd <- subset(ds, treat1 %in% c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'))

f11 <- ggplot(dsd, aes(area.perc.mn, e.rel.150, color = dig)) + 
  geom_point() + 
  theme_bw() + 
  ylab(expression(paste(NH[3],' (% of TAN)'))) + xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

f22 <- ggplot(dsd, aes(area.perc.mn, TS.mn, color = dig)) + 
  geom_point() +
  theme_bw() + 
  ylab('Dry matter (%)') + xlab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

mat <- matrix(c(1, 2),
              nrow = 1)

pf <- grid.arrange(f11, f22, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat1', plot = pf, height = 4, width = 8)




f1 <- ggplot(ds, aes(TS.mn, e.rel.150, color = dig)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Dry matter (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank())

f2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, color = dig)) + 
  geom_point() + 
  theme_bw() + 
  xlab('pH') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f3 <- ggplot(ds, aes(area.perc.mn, e.rel.150, color = dig)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Exposed surface area (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f4 <- ggplot(ds, aes(n.mn, e.rel.150, color = dig)) + 
  geom_point() + 
  theme_bw() + 
  xlab('n') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f5 <- ggplot(ds, aes(TS.mn, area.perc.mn, color = dig)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

f6 <- ggplot(ds, aes(TS.mn, n.mn, color = dig)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('n') +
  theme(legend.position = 'bottom', legend.title = element_blank())

mat <- matrix(c(1, 2,
                3, 4, 
                5, 6),
              nrow = 3, byrow = TRUE)

pf <- grid.arrange(f1, f2, f3, f4, f5, f6, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat2', plot = pf, height = 13, width = 8)



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

f1 <- ggplot(ds, aes(TS.mn, e.rel.150, color = dig1)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Dry matter (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) +
  theme(legend.position = 'bottom', legend.title = element_blank())

f2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, color = dig1)) + 
  geom_point() + 
  theme_bw() + 
  xlab('pH') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f3 <- ggplot(ds, aes(area.perc.mn, e.rel.150, color = dig1)) + 
  geom_point() + 
  theme_bw() + 
  xlab('Exposed surface area (%)') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f4 <- ggplot(ds, aes(n.mn, e.rel.150, color = dig1)) + 
  geom_point() + 
  theme_bw() + 
  xlab('n') + ylab(expression(paste(NH[3],' (% of TAN)'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank())

f5 <- ggplot(ds, aes(TS.mn, area.perc.mn, color = dig1)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('Exposed surface area (%)') +
  theme(legend.position = 'bottom', legend.title = element_blank())

f6 <- ggplot(ds, aes(TS.mn, n.mn, color = dig1)) + 
  geom_point() +
  theme_bw() + 
  xlab('Dry matter (%)') + ylab('n') +
  theme(legend.position = 'bottom', legend.title = element_blank())

mat <- matrix(c(1, 2,
                3, 4, 
                5, 6),
              nrow = 3, byrow = TRUE)

pf <- grid.arrange(f1, f2, f3, f4, f5, f6, layout_matrix = mat)
ggsave2x('../plots-meas/dig.prop.supMat3', plot = pf, height = 13, width = 8)
