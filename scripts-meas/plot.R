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

# # plot for ramiran poster - not used
# ggplot(idat.treat, aes(cta, j.NH3, group = pmid)) +
#   geom_line(size = 0.2) + 
#   theme_bw() +
#   labs(x = 'Time after application (h)', y = expression('NH'[3]~'flux'~('kg N h'^'-1'~ha^'-1'))) +
#   theme(legend.position = 'bottom', legend.title = element_blank()) +
#   xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.ramiran', height = 3, width = 6)


fsumm.treat01 <- fsumm.treat[fsumm.treat$new.ID == '1' | fsumm.treat$new.ID == '2' | fsumm.treat$new.ID == '3' | fsumm.treat$new.ID == '4', ]
fsumm.treat01 <- fsumm.treat01[! c(fsumm.treat01$new.ID == '3' & fsumm.treat01$treat1 == 'B Sep-S' & fsumm.treat01$cta == '0'), ]

# Create and sort factor for plot labels
setorder(fsumm.treat01, new.ID, treat1)
ll <- unique(fsumm.treat01[, treat1])
labs <- data.table(treat1 = ll, i = as.integer(factor(ll, levels = ll)))
labs[, leg.lab := paste0(i, '. ', treat1)]
fsumm.treat01[, tfact := factor(treat1, levels = ll)]
fsumm.treat01[, leg.lab := factor(paste0(as.integer(tfact), '. ', tfact), levels = labs$leg.lab)]

# Manual adjustments to avoid overplotting
adj <- data.table(i      = c(4,           6,      9,     1,      4,     7, 11, 10),
                  new.ID = c(1,           2,      2,     3,      4,     3, 3, 3),
                  yshift = c(-0.002, -0.003, -0.002, 0.003, -0.001, 0.001, -0.003, -0.002))
adj[, new.ID := as.character(new.ID)]

# Get integer codes and initial emission
d0 <- fsumm.treat01[, .(y = j.rel.mn[cta == min(cta)]), by = .(new.ID, leg.lab)]
labs <- merge(labs, d0)
labs <- merge(labs, adj, all = TRUE, by = c('i', 'new.ID'))
labs[is.na(yshift), yshift := 0]
labs[, y := y + yshift]

f1 <- ggplot(fsumm.treat01, aes(cta, j.rel.mn, color = leg.lab, fill = leg.lab)) + 
  geom_point(shape = 1, size = 0.5) + 
  geom_line() + 
  geom_text(data = labs, x = 2, aes(y = y, label = i), hjust = 1, size = 3.2, show.legend = FALSE) +
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(colour = guide_legend(nrow = 3, byrow = TRUE)) + 
  xlim(-2, 150)

f11 <- ggplot(fsumm.treat01, aes(cta, j.rel.mn, color = leg.lab, fill = leg.lab)) + 
  geom_point(shape = 1, size = 0.5) + 
  geom_line() + 
  geom_text(data = labs, x = 2, aes(y = y, label = i), hjust = 1, size = 3.2, show.legend = FALSE) +
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(colour = guide_legend(nrow = 3, byrow = TRUE)) + 
  xlim(-0.2, 50)

fsumm.treat02 <- fsumm.treat[fsumm.treat$new.ID == '5' | fsumm.treat$new.ID == '6' | fsumm.treat$new.ID == '7' | fsumm.treat$new.ID == '8', ]
f2 <- ggplot(fsumm.treat02, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  ylim(NA, 0.025) + 
  xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.treat02', height = 3.5, width = 8)

f22 <- ggplot(fsumm.treat02, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  ylim(NA, 0.025) + 
  xlim(NA, 50)

fsumm.treat03 <- fsumm.treat[fsumm.treat$new.ID == '9' | fsumm.treat$new.ID == '10' | fsumm.treat$new.ID == '11' | fsumm.treat$new.ID == '12', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TH-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS1-4', ]
fsumm.treat03 <- fsumm.treat03[! fsumm.treat03$treat == 'TS1 + acid', ]
fsumm.treat03$new.ID.f <- factor(fsumm.treat03$new.ID, levels = c('9', '10', '11', '12'))

f3 <- ggplot(fsumm.treat03, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID.f, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  ylim(NA, 0.075) +
  xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.treat03', height = 3.5, width = 8)

f33 <- ggplot(fsumm.treat03, aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  facet_wrap(~ new.ID.f, ncol = 4) +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  ylim(NA, 0.075) +
  xlim(NA, 50)

mat <- matrix(c(1, 1, 1, 1,
                2, 2, 2,
                3, 3, 3),
              ncol = 1)

pff <- grid.arrange(f1, f2, f3, layout_matrix = mat)
ggsave2x('../plots-meas/NH3.flux.comm.150', plot = pff, height = 10, width = 8)

mat <- matrix(c(1, 1, 1, 1,
                2, 2, 2,
                3, 3, 3),
              ncol = 1)

pfff <- grid.arrange(f11, f22, f33, layout_matrix = mat)
ggsave2x('../plots-meas/NH3.flux.comm.50', plot = pfff, height = 10, width = 8)


# ####################################
# # plots for ramiran poster
# 
# 
# treat2 <- c(`A` =  'Dig. A',
#          `B` =  'Dig. B',
#          `C` =  'Dig. C',
#          `B Sep-S` =  'Dig. B liquid',
#          `C Sep-D` =  'Dig. C liquid')
# 
# fsumm.treat01[, treat2 := treat2[treat1]]
# 
# 
# treat2 <- c(`TH` =  'Trailing hose',
#          `TS1` =  'Trailing shoe 1',
#          `TS2` =  'Trailing shoe 2',
#          `TS3` =  'Trailing shoe + harrowing tine')
# 
# fsumm.treat02[, treat2 := treat2[treat1]]
# 
# 
# ggplot(fsumm.treat01[fsumm.treat01$new.ID == '3', ], aes(cta, j.rel.mn, color = treat2, fill = treat2)) + 
#   geom_point(shape = 1, size = 0.5) + 
#   geom_line() + 
#   facet_wrap(~ new.ID, labeller = as_labeller(c('3' = 'Trial 3'))) +
#   theme_bw() +
#   geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat2), alpha = 0.3, color = NA) +
#   ylab(expression(paste(NH[3], '  flux'))) + xlab('Time from application (h)') +
#   theme(axis.text.y = element_blank()) + 
#   theme(legend.position = 'bottom', ncol = 1, legend.title = element_blank()) +
#   xlim(-0.2, 50) + 
#   scale_color_brewer(palette = "Set1") +
#   scale_fill_brewer(palette = "Set1")
# ggsave2x('../plots-meas/NH3.flux3.Ramiran', height = 3, width = 5.5)
# 
# ggplot(fsumm.treat02[fsumm.treat02$new.ID == '7', ], aes(cta, j.rel.mn, color = treat2, fill = treat2)) + 
#   geom_point(shape = 1, size = 0.5) + 
#   geom_line() + 
#   facet_wrap(~ new.ID, labeller = as_labeller(c('7' = 'Trial 7'))) +
#   theme_bw() +
#   geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat2), alpha = 0.3, color = NA) +
#   ylab(expression(paste(NH[3], '  flux'))) + xlab('Time from application (h)') +
#   theme(axis.text.y = element_blank()) + 
#   theme(legend.position = 'bottom', legend.title = element_blank()) +
#   guides(color = guide_legend(nrow = 1)) + 
#   xlim(-0.2, 50) + 
#   scale_color_brewer(palette = "Set1") +
#   scale_fill_brewer(palette = "Set1")
# ggsave2x('../plots-meas/NH3.flux7.Ramiran', height = 3, width = 5.5)

####################################

ggplot(fsumm[fsumm$new.ID == '15', ], aes(cta, j.rel.mn, color = treat1, fill = treat1)) + 
  geom_point(shape = 1, size = 0.5) + geom_line() + 
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
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
  ylab(expression(paste('Flux (frac TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  xlim(NA, 150)
ggsave2x('../plots-meas/NH3.flux.speed', height = 3, width = 7)

# # Flux plot for 'Oversigt over landsforsøg', send to Torben Frandsen in november 2024
# dfTF <- fsumm[fsumm$new.ID == '11' | fsumm$new.ID == '12', ]
# dfTF$new.IDv2 <- dfTF$new.ID
# dfTF$new.IDv2 <- gsub('11', 'Fs 001', dfTF$new.IDv2)
# dfTF$new.IDv2 <- gsub('12', 'Fs 002', dfTF$new.IDv2)
# 
# IDs <- c(`TH` =  'Slæbeslange',
#          `TS1` =  'Slæbesko',
#          `TS1 + acid` =  'Slæbesko + syre',
#          `OSI` =  'Nedfældning')
# dfTF[, new.treat1 := IDs[treat1]]
# 
# dfTF <- dfTF[! c(dfTF$new.ID == '11' & dfTF$treat1 == 'TS1 + acid'), ]
# 
# dfTF$j.rel.mn1 <- dfTF$j.rel.mn * 100
# dfTF$j.rel.sd1 <- dfTF$j.rel.sd * 100
# 
# dfTF$new.ID.f <- factor(dfTF$new.IDv2, levels = c('Fs 001', 'Fs 002'))
# ggplot(dfTF, aes(cta, j.rel.mn1, color = new.treat1, fill = new.treat1)) + 
#   geom_point(shape = 1, size = 0.5) + geom_line() + 
#   facet_wrap(~ new.ID.f) + 
#   theme_bw() + 
#   geom_ribbon(aes (ymax = j.rel.mn1 + j.rel.sd1, ymin = j.rel.mn1 - j.rel.sd1, group = treat1), alpha = 0.3, color = NA) + 
#   ylab(expression(paste('Flux (% TAN  ', time^-1,')'))) + xlab('Tid efter udbringing (timer)') +
#   theme(legend.position = 'bottom', legend.title = element_blank()) +
#   xlim(NA, 40)
# ggsave2x('../plots-meas/NH3.flux.11and12', height = 4, width = 6)



fsumm.prop <- fsumm[is.element(fsumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), ]

# Create and sort factor for plot labels
setorder(fsumm.prop, new.ID, treat1)
ll <- unique(fsumm.prop[, treat1])
labs <- data.table(treat1 = ll, i = as.integer(factor(ll, levels = ll)))
labs[, leg.lab := paste0(i, '. ', treat1)]
fsumm.prop[, tfact := factor(treat1, levels = ll)]
fsumm.prop[, leg.lab := factor(paste0(as.integer(tfact), '. ', tfact), levels = labs$leg.lab)]

# Manual adjustments to avoid overplotting
adj <- data.table(i      = c(1, 2, 3, 4, 5, 1, 6, 7, 8, 9, 1, 3, 8, 10, 11, 1, 6, 7, 12, 13, 1, 2, 4, 14, 15),
                  new.ID = c('D1', 'D1', 'D1', 'D1', 'D1', 'D2', 'D2', 'D2', 'D2', 'D2', 
                             'D3', 'D3', 'D3', 'D3', 'D3', 'D4', 'D4', 'D4', 'D4', 'D4', 
                             'D5', 'D5', 'D5', 'D5', 'D5'),
                  yshift = c(-0.003, -0.003, -0.003, 0.002, 0.003, -0.002, -0.005, 0.002, 0, 0, 
                             0.001, 0.001, 0.00, 0, 0, -0.0002, 0, 0, 0, 0, -0.001, -0.001, 0.003, 0, 0))
adj[, new.ID := as.character(new.ID)]

# Get integer codes and initial emission
d0 <- fsumm.prop[, .(y = j.rel.mn[cta == min(cta)]), by = .(new.ID, leg.lab)]
labs <- merge(labs, d0)
labs <- merge(labs, adj, all = TRUE, by = c('i', 'new.ID'))
labs[is.na(yshift), yshift := 0]
labs[, y := y + yshift]

# define new labels for each subplot (Tral X instead of DX)
custom_labels <- c(
  'D1' = 'Trial 1',
  'D2' = 'Trial 2',
  'D3' = 'Trial 3',
  'D4' = 'Trial 4',
  'D5' = 'Trial 5'
)

ggplot(fsumm.prop, aes(cta, j.rel.mn, color = leg.lab, fill = leg.lab)) + 
  geom_point(shape = 1, size = 0.5) + 
  geom_line() + 
  geom_text(data = labs, x = 2, aes(y = y, label = i), hjust = 1, size = 4.2, show.legend = FALSE) +
  facet_wrap(~ new.ID, labeller = labeller(new.ID = custom_labels), ncol = 1, scale = 'free_y') +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(color = guide_legend(nrow = 5)) + 
  xlim(-0.02, 52)
ggsave2x('../plots-meas/NH3.flux.prop50', height = 10, width = 3.4)


ggplot(fsumm.prop, aes(cta, j.rel.mn, color = leg.lab, fill = leg.lab)) + 
  geom_point(shape = 1, size = 0.5) + 
  geom_line() + 
  geom_text(data = labs, x = 2, aes(y = y, label = i), hjust = 1, size = 4.2, show.legend = FALSE) +
  facet_wrap(~ new.ID, labeller = labeller(new.ID = custom_labels), ncol = 1, scale = 'free_y') +
  theme_bw() + 
  geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat1), alpha = 0.3, color = NA) + 
  ylab(expression(paste('Flux (frac. TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
  theme(legend.position = 'bottom', legend.title = element_blank()) +
  guides(color = guide_legend(nrow = 3)) + 
  xlim(-0.02, 150)
ggsave2x('../plots-meas/NH3.flux.prop150', height = 9, width = 7)

######### CUMULATIVE EMISSION

# cumulative loss for trial 11 + 12
idat11.12 <- idat[idat$new.ID == '11' | idat$new.ID == '12', ]
idat11.12 <- idat11.12[!idat11.12$treat1 == 'TS1 + acid', ]

idat11.12dummy <- idat11.12[idat11.12$cta == idat11.12$cta[1], ]
idat11.12dummy$cta <- 0
idat11.12dummy$e.cum <- 0

idat11.12 <- rbind(idat11.12, idat11.12dummy)

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
  labs(y = 'Loss (frac. of TAN)') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esumm, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis01', height = 10, width = 10)

isummMac <- isumm[isumm$new.ID == '5' | isumm$new.ID == '6', ]
esummMac <- esumm[esumm$new.ID == '5' | esumm$new.ID == '6', ]
ggplot(isummMac, aes(treat1, e.rel.150, color = treat1)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Loss (frac. of TAN)') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esummMac, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis.Machine', height = 5, width = 8)

isummMan <- isumm[isumm$new.ID == '1' | isumm$new.ID == '2', ]
esummMan <- esumm[esumm$new.ID == '1' | esumm$new.ID == '2', ]
ggplot(isummMan, aes(treat1, e.rel.150, color = treat1)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'frac. (% of TAN)') + 
  theme(legend.title = element_blank()) + 
  geom_boxplot(data = esummMan, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE)
ggsave2x('../plots-meas/cum.emis.Manual', height = 5, width = 8)

isumm4 <- isumm[isumm$new.ID == '4', ]
esumm4 <- esumm[esumm$new.ID == '4', ]

isumm4$treat1 <- gsub('A MF liquid', 'Micro filter\nliquid', isumm4$treat1); esumm4$treat1 <- gsub('A MF liquid', 'Micro filter\nliquid', esumm4$treat1)
isumm4$treat1 <- gsub('A MF slurry', 'Micro filter\nslurry', isumm4$treat1); esumm4$treat1 <- gsub('A MF slurry', 'Micro filter\nslurry', esumm4$treat1)
isumm4$treat1 <- gsub('A Sep-D', 'Decanter\nliquid', isumm4$treat1); esumm4$treat1 <- gsub('A Sep-D', 'Decanter\nliquid', esumm4$treat1)
isumm4$treat1 <- gsub('A Sep-S', 'Screw press\nliquid', isumm4$treat1); esumm4$treat1 <- gsub('A Sep-S', 'Screw press\nliquid', esumm4$treat1)
isumm4$treat1 <- gsub('A', 'Unseparated', isumm4$treat1); esumm4$treat1 <- gsub('A', 'Unseparated', esumm4$treat1)

isumm4$treat2 <- factor(isumm4$treat1, levels = c('Unseparated', 'Screw press\nliquid', 'Decanter\nliquid', 'Micro filter\nslurry', 'Micro filter\nliquid'))

ggplot(isumm4, aes(treat2, e.rel.150, color = treat2)) + 
  geom_point() + 
  facet_wrap(~ new.ID, scales = 'free_x') + 
  theme_bw() + 
  labs(y = 'Emission (frac. applied TAN)') + 
  theme(axis.title.x = element_blank()) + 
  theme(legend.title = element_blank()) + theme(legend.position = 'none') + 
  geom_boxplot(data = esumm4, aes(x = treat1, y = e.rel.150, color = treat1), show.legend = FALSE) 
 # theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 0.5))
ggsave2x('../plots-meas/cum.emis.4', height = 4, width = 4.5)

##################################################################
# Plots for ramiran presentation

isummR <- as.data.table(isumm[isumm$new.ID == 'D1' | isumm$new.ID == 'D2' | isumm$new.ID == 'D3' | isumm$new.ID == 'D4' | isumm$new.ID == 'D5', ])
esummR <- as.data.table(esumm[esumm$new.ID == 'D1' | esumm$new.ID == 'D2' | esumm$new.ID == 'D3' | esumm$new.ID == 'D4' | esumm$new.ID == 'D5', ])

# define new labels for each subplot (Tral X instead of DX)
custom_labels <- c(
  'D1' = 'Trial 1',
  'D2' = 'Trial 2',
  'D3' = 'Trial 3',
  'D4' = 'Trial 4',
  'D5' = 'Trial 5'
)

IDs <- c(`A` =  'D1',
         `B` =  'D2',
         `C` =  'D3',
         `D` =  'D4',
         `E` =  'D5',
         `F` =  'D6',
         `G` =  'D7',
         `H` =  'D8',
         `I` =  'D9',
         `Cattle A` =  'C1',
         `Cattle B` =  'C2',
         `Cattle C` =  'C3',
         `Pig A` =  'P1',
         `Pig B` =  'P2',
         `Pig C` =  'P3')
isummR[, new.treat1 := IDs[treat1]]
esummR[, new.treat1 := IDs[treat1]]

treat_colors <- c(
  'D1' = '#c6dbef',
  'D2' = '#6baed6',
  'D3' = '#2171b5',
  'D4' = '#08306b',
  'D5' = '#9ecae1',
  'D6' = '#4292c6',
  'D7' = '#08519c',
  'D8' = '#3182bd',
  'D9' = '#bdd7e7',
  'C1' = '#a1d99b',
  'C2' = '#31a354',
  'C3' = '#006d2c',
  'P1' = '#fc9272',
  'P2' = '#de2d26',
  'P3' = '#a50f15')

isummR$e.rel.150 <- isummR$e.rel.150 * 100
esummR$e.rel.150 <- esummR$e.rel.150 * 100

ggplot(isummR, aes(new.treat1, e.rel.150, color = new.treat1)) +
  geom_point() +
  facet_wrap(~ new.ID, labeller = labeller(new.ID = custom_labels), scales = 'free_x', ncol = 5) +
  theme_bw() +
  labs(y = 'Emission (frac. applied TAN)') +
  theme(axis.title.x = element_blank()) +
  theme(legend.title = element_blank()) + theme(legend.position = 'none') +
  geom_boxplot(data = esummR, aes(x = new.treat1, y = e.rel.150, color = new.treat1), show.legend = FALSE) +
  scale_color_manual(values = treat_colors)
ggsave2x('../plots-meas/cum.emis.Ramiran', height = 3, width = 7.5)

############################################################################

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

idat.treat$new.ID.f <- factor(idat.treat$new.ID, levels = c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'))
idat.treat.temp <- idat.treat[idat.treat$cta <= 150, ]
ggplot(idat.treat.temp[idat.treat.temp$treat1 == 'A' & idat.treat.temp$rep == '1' | idat.treat.temp$treat1 == '2-Pos' & idat.treat.temp$rep == '1' | idat.treat.temp$treat1 == 'TS1-4' & 
                         idat.treat.temp$rep == '1' | idat.treat.temp$treat1 == 'TH' & idat.treat.temp$rep == '1' | idat.treat.temp$treat1 == 'Un12' & idat.treat.temp$rep == '1', ], 
       aes(t.start, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID.f, scales = 'free_x') +
  theme_bw() + 
#  scale_x_datetime(labels = date_format("%H:%M:%S")) + 
  labs(x = 'Time', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank())
ggsave2x('../plots-meas/temp.treatA', height = 10, width = 8)


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


# define new labels for each subplot (Tral X instead of DX)
custom_labels <- c(
  'D1' = 'Trial 1',
  'D2' = 'Trial 2',
  'D3' = 'Trial 3',
  'D4' = 'Trial 4',
  'D5' = 'Trial 5'
)

ggplot(idat.prop[idat.prop$treat1 == 'A' & idat.prop$rep == '1', ], 
       aes(cta, air.temp, group = pmid)) + 
  geom_line() + 
  facet_wrap(~ new.ID, labeller = labeller(new.ID = custom_labels), scales = 'free_x') +
  theme_bw() + 
  labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
  theme(legend.position = 'bottom', legend.title = element_blank()) + 
  xlim(NA, 150)
ggsave2x('../plots-meas/temp.prop', height = 7, width = 8)

