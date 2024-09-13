# dividing dataframe into treat and prop and adding trial ID's

idat.treat <- idat[is.element(idat$exper, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')), ]
idat.prop <- idat[is.element(idat$exper, c('23H', '23I', '24E', '24F', '24G')), ]

# flux over time
ggplot(idat, aes(cta, j.NH3, group = pmid, color = treat)) + 
  geom_point() + 
  facet_wrap(~ trial) +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01.png', height = 10, width = 10)

ggplot(idat.treat, aes(cta, j.NH3, group = pmid, color = treat)) + 
  geom_point() + 
  facet_wrap(~ new.ID) +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01.treat.png', height = 10, width = 10)

ggplot(idat.prop, aes(cta, j.NH3, group = pmid, color = treat)) + 
  geom_point() + 
  facet_wrap(~ new.ID) +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01.prop.png', height = 10, width = 10)

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
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.png', height = 10, width = 10)

ggplot(idat.treat[idat.treat$treat == 'A' & idat.treat$rep == '1' | idat.treat$treat == '2-pos' & idat.treat$rep == '1' | idat.treat$treat == 'TS-TSB-4' & idat.treat$rep == '1' | idat.treat$treat == 'TH' & idat.treat$rep == '1' | idat.treat$treat == 'Un12' & idat.treat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat.png', height = 10, width = 10)

ggplot(idat.prop[idat.prop$treat == 'A' & idat.prop$rep == '1' | idat.prop$treat == '2-pos' & idat.prop$rep == '1' | idat.prop$treat == 'TS-TSB-4' & idat.prop$rep == '1' | idat.prop$treat == 'TH' & idat.prop$rep == '1' | idat.prop$treat == 'Un12' & idat.prop$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.prop.png', height = 10, width = 10)

