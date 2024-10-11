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
