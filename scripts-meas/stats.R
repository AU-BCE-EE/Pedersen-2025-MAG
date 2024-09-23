

isumm$treat <- as.factor(isumm$treat)

########## stats for trial 13 and 14 (hose distance)
##### trial 13: 
# data check
qqnorm(isumm[isumm$new.ID == '13', ]$e.rel.150)
qqline(isumm[isumm$new.ID == '13', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm[isumm$new.ID == '13', ])

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
qqnorm(isumm[isumm$new.ID == '14', ]$e.rel.150)
qqline(isumm[isumm$new.ID == '14', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm[isumm$new.ID == '14', ])

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
qqnorm(isumm[isumm$new.ID == '15', ]$e.rel.150)
qqline(isumm[isumm$new.ID == '15', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat, data = isumm[isumm$new.ID == '15', ])

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


########## stats for trials 5-10 (app tech on winter wheat)

isumm1 <- isumm[isumm$new.ID == '5' | isumm$new.ID == '6' | isumm$new.ID == '7' | isumm$new.ID == '8' | isumm$new.ID == '9' | 
                   isumm$new.ID == '10', ]
isumm1 <- isumm1[! isumm1$treat == 'TH-4', ]
isumm1 <- isumm1[! isumm1$treat == 'TS-TSB-4', ]
isumm1$treat <- gsub('TH-12', 'TH', isumm1$treat)
isumm1$treat <- gsub('TS-TSB-12', 'TS-TSB', isumm1$treat)

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat + (1|new.ID), data = isumm1)

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

########## stats for trials 11-12 (app tech on grass)

isumm1 <- isumm[isumm$new.ID == '11' | isumm$new.ID == '12' , ]
isumm1 <- isumm1[! isumm1$treat == 'TS-TSBacid', ]

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat + (1|new.ID), data = isumm1)

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

########## stats for trials 1-4 (app tech on grass)
isumm1 <- isumm[isumm$new.ID == '1' | isumm$new.ID == '2' | isumm$new.ID == '3' | isumm$new.ID == '4' , ]

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat + (1|new.ID), data = isumm1)

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
