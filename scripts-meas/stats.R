

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

isumm1 <- isumm[isumm$trial == '24C' | isumm$trial == '24D' | isumm$trial == '24J' | isumm$trial == '24L' | isumm$trial == '24B' | 
                   isumm$trial == '24H', ]
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

isumm1 <- isumm[isumm$trial == '24N' | isumm$trial == '24O' , ]
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

isumm1 <- isumm[isumm$trial == '23C' | isumm$trial == '23D' | isumm$trial == '23G' | isumm$trial == '24M' , ]

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
