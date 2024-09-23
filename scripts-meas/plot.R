# dividing dataframe into treat and prop and adding trial ID's

idat.treat <- idat[is.element(idat$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), ]
idat.prop <- idat[is.element(idat$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), ]

fsumm$treat1 <- fsumm$treat
fsumm$treat1 <- gsub('A acid', 'A Acid', fsumm$treat1)
fsumm$treat1 <- gsub('A dec', 'A Sep-D', fsumm$treat1)
fsumm$treat1 <- gsub('A dec acid', 'A Sep-D + acid', fsumm$treat1)
fsumm$treat1 <- gsub('A dis', 'A Dis', fsumm$treat1)
fsumm$treat1 <- gsub('A dis acid', 'A Dis + acid', fsumm$treat1)
fsumm$treat1 <- gsub('A screw', 'A Sep-S', fsumm$treat1)
fsumm$treat1 <- gsub('B acid', 'B Acid', fsumm$treat1)
fsumm$treat1 <- gsub('B screw', 'B Sep-S', fsumm$treat1)
fsumm$treat1 <- gsub('B screw acid', 'B Sep-S + acid', fsumm$treat1)
fsumm$treat1 <- gsub('C dec', 'C Sep-D', fsumm$treat1)
fsumm$treat1 <- gsub('TH-12', 'TH', fsumm$treat1)
fsumm$treat1 <- gsub('TS-TSB-12', 'TS1', fsumm$treat1)
fsumm$treat1 <- gsub('TS-Bo', 'TS2', fsumm$treat1)
fsumm$treat1 <- gsub('TS-TSB\\+', 'TS3', fsumm$treat1)
fsumm$treat1 <- gsub('TS-TSB', 'TS1', fsumm$treat1)

fsumm.treat <- fsumm[is.element(fsumm$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), ]

fsumm.treat02 <- fsumm.treat[fsumm.treat$new.ID == '5' | fsumm.treat$new.ID == '6' | fsumm.treat$new.ID == '7' | fsumm.treat$new.ID == '8', ]
ggplot(fsumm.treat02, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01.treat02', height = 4, width = 8)






# flux over time
# all:
ggplot(idat, aes(cta, j.NH3, group = pmid, color = treat)) + 
  geom_point() + 
  facet_wrap(~ new.ID) +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) + 
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01', height = 10, width = 10)

fsumm.treat01 <- fsumm.treat[fsumm.treat$new.ID == '1' | fsumm.treat$new.ID == '2' | fsumm.treat$new.ID == '3' | fsumm.treat$new.ID == '4', ]
ggplot(fsumm.treat01, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.treat01', height = 4, width = 8)



fsumm.treat03 <- fsumm.treat[fsumm.treat$new.ID == '9' | fsumm.treat$new.ID == '10' | fsumm.treat$new.ID == '11' | fsumm.treat$new.ID == '12', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TH-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS-TSB-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS-TSBacid', ]
ggplot(fsumm.treat03, aes(cta, j.rel.mn, color = treat, fill = treat)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.treat03', height = 4, width = 8)


ggplot(fsumm[fsumm$new.ID == '15', ], aes(cta, j.rel.mn, color = treat, fill = treat)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.DFCmov', height = 3, width = 4)

fsumm$treat2 <- fsumm$treat
fsumm$treat2 <- gsub('TS-TSB-12', 'TS-12', fsumm$treat2)
fsumm$treat2 <- gsub('TS-TSB-4', 'TS-4', fsumm$treat2)
fsumm$new.ID.f <- factor(fsumm$new.ID, levels = c('9', '10'))
ggplot(fsumm[fsumm$new.ID == '9' | fsumm$new.ID == '10', ], 
       aes(cta, j.rel.mn, color = treat2, fill = treat2)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID.f) + 
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.speed', height = 3, width = 7)


fsumm.prop <- fsumm[is.element(fsumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), ]
ggplot(fsumm.prop, aes(cta, j.rel.mn, color = treat, fill = treat)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 5) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.prop', height = 4, width = 8)


# cumulative emission 
ggplot(isumm, aes(treat, e.rel.150, color = treat)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (% of TAN) h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esumm, aes(x = treat, y = e.rel.150, color = treat), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis01', height = 10, width = 10)


# temperature
ggplot(idat[idat$treat == 'A' & idat$rep == '1' | idat$treat == '2-pos' & idat$rep == '1' | idat$treat == 'TS-TSB-4' & idat$rep == '1' | idat$treat == 'TH' & idat$rep == '1' | idat$treat == 'Un12' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp', height = 10, width = 10)

idat.treat$new.ID.f <- factor(idat.treat$new.ID, levels = c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'))
ggplot(idat.treat[idat.treat$treat == 'A' & idat.treat$rep == '1' | idat.treat$treat == '2-pos' & idat.treat$rep == '1' | idat.treat$treat == 'TS-TSB-4' & idat.treat$rep == '1' | idat.treat$treat == 'TH' & idat.treat$rep == '1' | idat.treat$treat == 'Un12' & idat.treat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID.f, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat', height = 10, width = 8)

ggplot(idat[idat$new.ID == '13' & idat$treat == 'Un12' & idat$rep == '1' | idat$new.ID == '14' & idat$treat == 'Un12' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat.speed', height = 3, width = 4)

ggplot(idat[idat$new.ID == '15' & idat$treat == '2-pos' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat.DFCmov', height = 3, width = 2.5)

ggplot(idat.prop[idat.prop$treat == 'A' & idat.prop$rep == '1' | idat.prop$treat == '2-pos' & idat.prop$rep == '1' | idat.prop$treat == 'TS-TSB-4' & idat.prop$rep == '1' | idat.prop$treat == 'TH' & idat.prop$rep == '1' | idat.prop$treat == 'Un12' & idat.prop$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.prop', height = 7, width = 8)

