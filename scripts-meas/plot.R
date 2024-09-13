# dividing dataframe into treat and prop

idat.treat <- idat[]


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
  labs(y = 'Loss (% of TAN) h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esumm, aes(x = treat, y = e.rel.150, color = treat), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis01.png', height = 10, width = 10)

# temperature
ggplot(idat[idat$treat == 'A' & idat$rep == '1' | idat$treat == '2-pos' & idat$rep == '1' | idat$treat == 'TS-TSB-4' & idat$rep == '1' | idat$treat == 'TH' & idat$rep == '1' | idat$treat == 'Un12' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ trial, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('Air temperature', '')) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.png', height = 10, width = 10)

