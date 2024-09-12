
# surface pH over time mean + sd
ggplot(dsumm, aes(elapsed.time, pH.mn, color = slurry, fill = slurry)) + 
  geom_point() + 
  geom_line(size = 1) + 
  facet_wrap(~ exp, ncol = 3) +
  theme_bw() + 
  geom_ribbon(aes(ymax = pH.mn + pH.sd, ymin = pH.mn - pH.sd, group = slurry), alpha = 0.3, color = NA) + 
  labs(x = 'Time after application (h)', y = 'pH') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) 
ggsave2x('../plots-surface-pH/pH.mn.01.png', height = 6, width = 10)

ggplot(dsumm, aes(elapsed.time, pH.mn, color = slurry, fill = slurry)) + 
  geom_point() + 
  geom_line(size = 1) + 
  facet_wrap(~ exp, ncol = 3) +
  theme_bw() + 
  geom_ribbon(aes(ymax = pH.mn + pH.sd, ymin = pH.mn - pH.sd, group = slurry), alpha = 0.3, color = NA) + 
  labs(x = 'Time after application (h)', y = 'pH') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(0, 6) + ylim(7.5, 9)
ggsave2x('../plots-surface-pH/pH.mn.02.png', height = 6, width = 10)
