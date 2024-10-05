# 
# all data vs time
ggplot(d1, aes(t.start, temp, color = pos)) + geom_line(aes(group = pos)) 


# temperatures agains each other
ggplot(d2, aes(O.temp, I.temp)) + geom_point() + 
  geom_abline(color = 'red')

ggplot(d2, aes(O.temp, temp)) + geom_point() + 
  geom_abline(color = 'red')

ggplot(d2, aes(I.temp, temp)) + geom_point() + 
  geom_abline(color = 'red')
