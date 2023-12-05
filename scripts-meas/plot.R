
# flux over time
ggplot(idat, aes(cta, j.NH3, group = pmid, color = treat)) + 
  geom_point() + 
  facet_wrap(~ trial) +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01.png', height = 10, width = 10)

# cumulative emission 
ggplot(isumm, aes(treat, e.rel.150, color = treat)) + 
  geom_point() + 
  facet_wrap(~ trial, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (% of TAN) after 150 h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esumm, aes(x = treat, y = e.rel.150, color = treat), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis01.png', height = 10, width = 10)
