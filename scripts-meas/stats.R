

isumm1$treat <- as.factor(isumm1$treat)

########## stats for trial 13 and 14 (hose distance)
##### trial 13: 
# data check
qqnorm(isumm1[isumm1$new.ID == '13', ]$e.rel.150)
qqline(isumm1[isumm1$new.ID == '13', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm1[isumm1$new.ID == '13', ])

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat = 'Tukey'))

summary(tuk)
cld(tuk)

##### trial 14: 
# data check
qqnorm(isumm1[isumm1$new.ID == '14', ]$e.rel.150)
qqline(isumm1[isumm1$new.ID == '14', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm1[isumm1$new.ID == '14', ])

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat = 'Tukey'))

summary(tuk)
cld(tuk)


########## stats for trial 15 (movement of chambers)
# data check
qqnorm(isumm1[isumm1$new.ID == '15', ]$e.rel.150)
qqline(isumm1[isumm1$new.ID == '15', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm1[isumm1$new.ID == '15', ])

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat = 'Tukey'))

summary(tuk)
cld(tuk)

