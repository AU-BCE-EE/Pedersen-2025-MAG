# 
# all data vs time
ggplot(d1, aes(t.start, temp, color = pos)) + geom_line(aes(group = pos)) 


# temperatures agains each other
ggplot(d2, aes(Otemp, Itemp)) + geom_point() + 
  geom_abline(color = 'red') + 
  xlab('Ambient soil surface temperature (C)') + ylab('DFC soil surface temperature (C)')

ggplot(d2, aes(Otemp, temp)) + geom_point() + 
  geom_abline(color = 'red') + 
  xlab('Ambient soil surface temperature (C)') + ylab('Ambient 2 m temperature (C)')

ggplot(d2, aes(Itemp, temp)) + geom_point() + 
  geom_abline(color = 'red') + 
  xlab('DFC soil surface temperature (C)') + ylab('Ambient 2 m temperature (C)')

# Model
ggplot(d2, aes(Otemp, Itemp, colour = glorad)) +
  geom_line(aes(Otemp, Itemp.pred6), colour = 'skyblue', lwd = 0.2) +
  geom_line(aes(Otemp, Itemp.pred4), colour = 'red', lwd = 0.3) +
  geom_abline(intercept = 0, slope = 1, colour = 'gray55', lty = 2) +
  geom_point(alpha = 0.1) +
  #scale_color_viridis_c(option = 'magma') +
  scale_color_viridis_c() +
  coord_fixed() +
  theme_bw() +
  labs(x = expression('Ambient soil surface temperature'~(degree*C)),
       y = expression('DFC soil surface temperature'~(degree*C)),
       colour = 'Radiation')
ggsave2x('../plots-temp-loggers/temp_elevation', height = 4, width = 4)
