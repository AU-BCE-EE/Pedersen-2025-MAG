

ggplot(tdat, aes(number, log.temp, color = log.ID)) + geom_line()


# ggplot(fsumm[fsumm$new.ID == '9' | fsumm$new.ID == '10', ], 
#        aes(cta, j.rel.mn, color = treat2, fill = treat2)) + 
#   geom_point(shape = 1, size = 0.5) + geom_line() + 
#   facet_wrap(~ new.ID.f) + 
#   theme_bw() + 
#   geom_ribbon(aes (ymax = j.rel.mn + j.rel.sd, ymin = j.rel.mn - j.rel.sd, group = treat), alpha = 0.3, color = NA) + 
#   ylab(expression(paste('Flux (% TAN  ', h^-1,')'))) + xlab('Time from application (h)') +
#   theme(legend.position = 'bottom', legend.title = element_blank()) +
#   xlim(NA, 150)
# ggsave2x('../plots-meas/NH3.flux.speed', height = 3, width = 7)
# 
# 
# # cumulative emission 
# ggplot(isumm, aes(treat, e.rel.150, color = treat)) + 
#   geom_point() + 
#   facet_wrap(~ trial, scales = 'free_x') + 
#   theme_bw() + 
#   labs(y = 'Loss (% of TAN) h') + 
#   theme(legend.title = element_blank()) + 
#   geom_boxplot(data = esumm, aes(x = treat, y = e.rel.150, color = treat), show.legend = FALSE)
# ggsave2x('../plots-meas/cum.emis01', height = 10, width = 10)
# 
# 
# # temperature
# ggplot(idat[idat$treat == 'A' & idat$rep == '1' | idat$treat == '2-pos' & idat$rep == '1' | idat$treat == 'TS-TSB-4' & idat$rep == '1' | idat$treat == 'TH' & idat$rep == '1' | idat$treat == 'Un12' & idat$rep == '1', ], 
#        aes(cta, air.temp, group = pmid)) + 
#   geom_line() + 
#   facet_wrap(~ trial, scales = 'free_x') +
#   theme_bw() + 
#   labs(x = 'Time after application (h)', y = 'Air temperature (°C)') + 
#   theme(legend.position = 'bottom', legend.title = element_blank()) + 
#   xlim(NA, 150)
# ggsave2x('../plots-meas/temp', height = 10, width = 10)

