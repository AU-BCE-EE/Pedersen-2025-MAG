# dividing dataframe into treat and prop and adding trial ID's

idat.treat <- idat[is.element(idat$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), ]
idat.prop <- idat[is.element(idat$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), ]


fsumm.treat <- fsumm[is.element(fsumm$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), ]


# flux over time
# all:
ggplot(idat, aes(cta, j.NH3, group = pmid, color = treat1)) +
  geom_point() +
  facet_wrap(~ new.ID) +
  theme_bw() +
  labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux01', height = 10, width = 10)

fsumm.treat01 <- fsumm.treat[fsumm.treat$new.ID == '1' | fsumm.treat$new.ID == '2' | fsumm.treat$new.ID == '3' | fsumm.treat$new.ID == '4', ]
fsumm.treat01 <- fsumm.treat01[! c(fsumm.treat01$new.ID == '3' & fsumm.treat01$treat1 == 'B Sep-S'), ]
f1 <- ggplot(fsumm.treat01, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(colour = guide_legend(nrow = 2,byrow = TRUE)) + 
  xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.treat01', height = 4, width = 8)

f11 <- ggplot(fsumm.treat01, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(colour = guide_legend(nrow = 2,byrow = TRUE)) + 
  xlim(NA, 50)

fsumm.treat02 <- fsumm.treat[fsumm.treat$new.ID == '5' | fsumm.treat$new.ID == '6' | fsumm.treat$new.ID == '7' | fsumm.treat$new.ID == '8', ]
f2 <- ggplot(fsumm.treat02, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  ylim(NA, 0.025) + 
  xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.treat02', height = 3.5, width = 8)

f22 <- ggplot(fsumm.treat02, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  ylim(NA, 0.025) + 
  xlim(NA, 50)

fsumm.treat03 <- fsumm.treat[fsumm.treat$new.ID == '9' | fsumm.treat$new.ID == '10' | fsumm.treat$new.ID == '11' | fsumm.treat$new.ID == '12', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TH-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS1-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS1 + acid', ]
f3 <- ggplot(fsumm.treat03, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  ylim(NA, 0.075) +
  xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.treat03', height = 3.5, width = 8)

f33 <- ggplot(fsumm.treat03, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  ylim(NA, 0.075) +
  xlim(NA, 50)

mat <- matrix(c(1, 
                2,
                3),
              ncol = 1)

pff <- grid.arrange(f1, f2, f3, layout_matrix = mat)
ggsave2x('../plots-meas/NH3.flux.comm.150', plot = pff, height = 11, width = 8)

mat <- matrix(c(1, 
                2,
                3),
              ncol = 1)

pfff <- grid.arrange(f11, f22, f33, layout_matrix = mat)
ggsave2x('../plots-meas/NH3.flux.comm.50', plot = pfff, height = 11, width = 8)

ggplot(fsumm[fsumm$new.ID == '15', ], aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.DFCmov', height = 3, width = 4)


fsumm$new.ID.f <- factor(fsumm$new.ID, levels = c('9', '10'))
ggplot(fsumm[fsumm$new.ID == '9' | fsumm$new.ID == '10', ], 
       aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID.f) + 
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.speed', height = 3, width = 7)


fsumm.prop <- fsumm[is.element(fsumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), ]
ggplot(fsumm.prop, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 5) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.prop', height = 4, width = 8)


# cumulative loss for trial 11 + 12
idat11.12 <- idat[idat$new.ID == '11' | idat$new.ID == '12', ]
idat11.12 <- idat11.12[!idat11.12$treat1 == 'TS1 + acid', ]
ggplot(idat11.12, aes(cta, e.cum, group = pmid, color = treat1)) +
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID) +
  theme_bw() +
  labs(x = 'Time after application (h)', y = 'Loss (%TAN)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 85)
ggsave2x('../plots-meas/NH3.flux.trial12', height = 3, width = 7)



# cumulative emission 
ggplot(isumm, aes(treat1, e.rel.150, color = treat1)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (% of TAN) h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esumm, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis01', height = 10, width = 10)

isummMac <- isumm[isumm$new.ID == '5' | isumm$new.ID == '6', ]
esummMac <- esumm[esumm$new.ID == '5' | esumm$new.ID == '6', ]
ggplot(isummMac, aes(treat1, e.rel.150, color = treat1)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (% of TAN) h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esummMac, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis.Machine', height = 5, width = 5)

isummMan <- isumm[isumm$new.ID == '1' | isumm$new.ID == '2', ]
esummMan <- esumm[esumm$new.ID == '1' | esumm$new.ID == '2', ]
ggplot(isummMan, aes(treat1, e.rel.150, color = treat1)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (% of TAN) h') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esummMan, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis.Manual', height = 5, width = 5)


# temperature
ggplot(idat[idat$treat1 == 'A' & idat$rep == '1' | idat$treat1 == '2-Pos' & idat$rep == '1' | idat$treat1 == 'TS1-4' & idat$rep == '1' | idat$treat1 == 'TH' & idat$rep == '1' | idat$treat1 == 'Un12' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp', height = 10, width = 10)

idat.treat$new.ID.f <- factor(idat.treat$new.ID, levels = c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'))
ggplot(idat.treat[idat.treat$treat1 == 'A' & idat.treat$rep == '1' | idat.treat$treat1 == '2-Pos' & idat.treat$rep == '1' | idat.treat$treat1 == 'TS1-4' & idat.treat$rep == '1' | idat.treat$treat1 == 'TH' & idat.treat$rep == '1' | idat.treat$treat1 == 'Un12' & idat.treat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID.f, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat', height = 10, width = 8)

ggplot(idat[idat$new.ID == '13' & idat$treat1 == 'Un12' & idat$rep == '1' | idat$new.ID == '14' & idat$treat1 == 'Un12' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat.speed', height = 3, width = 4)

ggplot(idat[idat$new.ID == '15' & idat$treat1 == '2-Pos' & idat$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.treat.DFCmov', height = 3, width = 2.5)

ggplot(idat.prop[idat.prop$treat1 == 'A' & idat.prop$rep == '1' | idat.prop$treat1 == '2-Pos' & idat.prop$rep == '1' | idat.prop$treat1 == 'TS1-4' & idat.prop$rep == '1' | idat.prop$treat1 == 'TH' & idat.prop$rep == '1' | idat.prop$treat1 == 'Un12' & idat.prop$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.prop', height = 7, width = 8)

