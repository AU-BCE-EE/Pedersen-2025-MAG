
p1 <- ggplot(ds, aes(TS.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = TS.mn + 0.1, xend = TS.mn + 0.1, yend = mm_a2.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = TS.mn - 0.1, xend = TS.mn - 0.1, yend = mm_a8.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5, show.legend = FALSE) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = TS.mn + 0.1, y = mm_a2.pred), shape = 17, show.legend = FALSE) +
  geom_point(aes(x = TS.mn - 0.1, y = mm_a8.pred), shape = 20, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  # Invisble layers just for legend
  geom_point(aes(shape = 'Measured'), size = 4.5, alpha = 0) +
  geom_point(aes(shape = 'DM & pH model'), size = 4.5, alpha = 0) +
  geom_point(aes(shape = 'Slurry type model'), size = 4.5, alpha = 0) +
  scale_shape_manual(name = '',  breaks = c("Measured", "DM & pH model", "Slurry type model"), values = c( 'Measured' = 1, 'DM & pH model' = 17, 'Slurry type model' = 20)) +
  guides(shape = guide_legend( override.aes = list(size = c(4.5, 1, 1), alpha = 1)), colour = 'none') +
  labs(x = 'Slurry DM (%)', y = 'Relative emission (% TAN)', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')

p1
plot(10:25, 10:25, pch = 10:25, bg = 'red')

p2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = pH.lab.mn + 0.04, xend = pH.lab.mn + 0.04, yend = mm_a2.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = pH.lab.mn - 0.04, xend = pH.lab.mn - 0.04, yend = mm_a8.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn + 0.04, y = mm_a2.pred), shape = 17, show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn - 0.04, y = mm_a8.pred), shape = 20, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  labs(x = 'Slurry pH', y = '', colour = '') +
  theme_bw() +
  theme(legend.position = 'none')

p2

(p1 | p2) + theme(legend.position = 'top')
ggsave2x('../plots-simp-mods/mod_plot', height = 4, width = 6.5)
