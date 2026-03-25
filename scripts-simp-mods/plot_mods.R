
p1 <- ggplot(ds, aes(TS.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = TS.mn - 0.1, xend = TS.mn - 0.1, yend = mm_a1.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = TS.mn + 0.1, xend = TS.mn + 0.1, yend = mm_b3.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5, show.legend = FALSE) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = TS.mn - 0.1, y = mm_a1.pred), shape = 1, show.legend = FALSE) +
  geom_point(aes(x = TS.mn + 0.1, y = mm_b3.pred), shape = 17, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  # Invisble layers just for legend
  geom_point(aes(shape = 'Model A'), size = 4.5, alpha = 0) +
  geom_point(aes(shape = 'Model B'), size = 4.5, alpha = 0) +
  scale_shape_manual(name = '',  breaks = c("Model A", 'Model B'), values = c('Model A' = 1, 'Model B' = 17)) +
  guides(shape = guide_legend( override.aes = list(size = c(1, 1), alpha = 1)), colour = 'none') +
  labs(x = 'Slurry DM (%)', y = '', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')

p1

p2 <- ggplot(ds, aes(pH.lab.mn, e.rel.150, colour = slurry.type)) +
  geom_segment(aes(x = pH.lab.mn - 0.04, xend = pH.lab.mn - 0.04, yend = mm_a1.pred), alpha = 0.2, show.legend = FALSE) +
  geom_segment(aes(x = pH.lab.mn + 0.04, xend = pH.lab.mn + 0.04, yend = mm_b3.pred), alpha = 0.2, show.legend = FALSE) +
  geom_point(shape = 21, fill = 'white', size = 4.5) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn - 0.04, y = mm_a1.pred), shape = 1, show.legend = FALSE) +
  geom_point(aes(x = pH.lab.mn + 0.04, y = mm_b3.pred), shape = 17, show.legend = FALSE) +
  scale_colour_manual(values = cols) +
  labs(x = 'Slurry pH', y = 'Relative emission (frac. TAN)', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')

p2

p2 | p1
ggsave2x('../plots-simp-mods/mod_plot', height = 3.7, width = 6.5)

# Meas vs. predicted

ggplot(ds, aes(e.rel.150, mm_b3.pred, colour = slurry.type)) +
  geom_abline(intercept = 0, slope = 1, colour = 'gray45') +
  geom_point(shape = 21, fill = 'white', size = 4.5) +
  geom_text(aes(label = trial.ID), show.legend = FALSE) +
  coord_fixed(ratio = 1) +
  labs(x = 'Measured emission (frac. TAN)', y = 'Calculated emission (frac. TAN)', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')
ggsave2x('../plots-simp-mods/mod_v_meas_a', height = 3.4, width = 3.1)

# For all models
dpred[, mainmod := gsub('\\+', '', mod)]
ggplot(dpred, aes(e.rel.150, e.rel.pred, colour = slurry.type)) +
  geom_abline(intercept = 0, slope = 1, colour = 'gray45') +
  geom_point(data = dpred[!grepl('\\+', mod), ], shape = 21, fill = 'white', size = 4.5) +
  geom_text(data = dpred[!grepl('\\+', mod), ], aes(label = trial.ID), show.legend = FALSE) +
  geom_point(data = dpred[grepl('\\+', mod), ], shape = 21, fill = 'white', size = 2.5, alpha = 0.6) +
  coord_fixed(ratio = 1) +
  facet_wrap(~ toupper(mainmod)) +
  labs(x = 'Measured emission (frac. TAN)', y = 'Calculated emission (frac. TAN)', colour = '') +
  theme_bw() +
  theme(legend.position = 'top')
ggsave2x('../plots-simp-mods/mod_v_meas_all', height = 6, width = 6)


