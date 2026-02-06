
p1 <- ggplot(ds, aes(TS.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = TS.mn + 0.1, xend = TS.mn + 0.1, yend = mm_a3.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = TS.mn + 0.0, xend = TS.mn + 0.0, yend = mm_d2.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = TS.mn - 0.1, xend = TS.mn - 0.1, yend = mm_f1.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5, show.legend = FALSE) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = TS.mn + 0.1, y = mm_a3.pred), shape = 17, show.legend = FALSE) +
  geom_point(aes(x = TS.mn + 0.0, y = mm_d2.pred), shape = 18, show.legend = FALSE) +
  geom_point(aes(x = TS.mn - 0.1, y = mm_f1.pred), shape = 20, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  # Invisble layers just for legend
  geom_point(aes(shape = 'DM & pH'), size = 4.5, alpha = 0) +
  geom_point(aes(shape = 'Visc.'), size = 4.5, alpha = 0) +
  geom_point(aes(shape = 'Slurry type'), size = 4.5, alpha = 0) +
  scale_shape_manual(name = '',  breaks = c("DM & pH", 'Visc.', "Slurry type"), values = c('DM & pH' = 17, 'Visc.' = 18, 'Slurry type' = 20)) +
  guides(shape = guide_legend( override.aes = list(size = c(1, 1, 1), alpha = 1)), colour = 'none') +
  labs(x = 'Slurry DM (%)', y = 'Relative emission (% TAN)', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')

p1

p2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = pH.lab.mn + 0.04, xend = pH.lab.mn + 0.04, yend = mm_a3.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = pH.lab.mn + 0.00, xend = pH.lab.mn + 0.00, yend = mm_d2.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = pH.lab.mn - 0.04, xend = pH.lab.mn - 0.04, yend = mm_f1.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn + 0.04, y = mm_a3.pred), shape = 17, show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn + 0.00, y = mm_d2.pred), shape = 18, show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn - 0.04, y = mm_f1.pred), shape = 20, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  labs(x = 'Slurry pH', y = '', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')

p2

p1 | p2
ggsave2x('../plots-simp-mods/mod_plot', height = 4, width = 6.5)
