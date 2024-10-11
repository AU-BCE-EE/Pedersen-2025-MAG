
fit1 <- lm(d2$Itemp ~ poly(d2$glorad, 2))
fit11 <- predict(fit1, data.frame(x = d2$glorad)) 

ggplot(d2, aes(glorad, Itemp)) + geom_point() + 
  geom_point(aes(glorad, fit11), color = 'red')


fit2 <- lm(d2$Itemp ~ poly(d2$temp, 2))
fit22 <- predict(fit2, data.frame(x = d2$temp)) 

ggplot(d2, aes(temp, Itemp)) + geom_point() + 
  geom_point(aes(temp, fit22), color = 'red')


