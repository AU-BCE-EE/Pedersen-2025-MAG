

isumm$treat1 <- as.factor(isumm$treat1)

########## stats for trial 13 and 14 (hose distance)
##### trial 13: 

isumm1 <- isumm[isumm$new.ID == '13' | isumm$new.ID == '14', ]
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

# making a column with digestate (untreated or separated) and distance (30, 25 or 12)
isumm1$dig <- substr(isumm1$treat1, 1, 2)
isumm1$dig <- gsub('UN', 'Un', isumm1$dig)
isumm1$dis <- substr(isumm1$treat1, nchar(as.character(isumm1$treat1))-1, nchar(as.character(isumm1$treat1)))

isumm1$dig <- as.factor(isumm1$dig)
isumm1$dis <- as.factor(isumm1$dis)

# fit a regression model
m1 <- lmer(e.rel.150 ~ dig * dis + (1|new.ID), data = isumm1)

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(dis = 'Tukey'))

summary(tuk)
cld(tuk)

# 
# # data check
# qqnorm(isumm[isumm$new.ID == '13', ]$e.rel.150)
# qqline(isumm[isumm$new.ID == '13', ]$e.rel.150)
# 
# #fit a regression model
# m1 <- aov(e.rel.150 ~ treat1, data = isumm[isumm$new.ID == '13', ])
# 
# # do this: lmer? 
# m1 <- aov(e.rel.150 ~ digestate * hoseDistance, data = isumm[isumm$new.ID == '13', ])
# 
# # residuals 
# res <- resid(m1)
# plot(fitted(m1), res)
# abline(0,0)
# 
# # reults 
# summary(m1)
# 
# # tuckey's 
# tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))
# 
# summary(tuk)
# cld(tuk)
# 
# ##### trial 14: 
# # data check
# qqnorm(isumm[isumm$new.ID == '14', ]$e.rel.150)
# qqline(isumm[isumm$new.ID == '14', ]$e.rel.150)
# 
# #fit a regression model
# m1 <- aov(e.rel.150 ~ treat1, data = isumm[isumm$new.ID == '14', ])
# 
# # residuals 
# res <- resid(m1)
# plot(fitted(m1), res)
# abline(0,0)
# 
# # reults 
# summary(m1)
# 
# # tuckey's 
# tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))
# 
# summary(tuk)
cld(tuk)


########## stats for trial 15 (movement of chambers)
# data check
qqnorm(isumm[isumm$new.ID == '15', ]$e.rel.150)
qqline(isumm[isumm$new.ID == '15', ]$e.rel.150)

#fit a regression model
m1 <- aov(e.rel.150 ~ treat1, data = isumm[isumm$new.ID == '15', ])

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))

summary(tuk)
cld(tuk)


########## stats for trials 5-10 (app tech on winter wheat)

isumm1 <- isumm[isumm$new.ID == '5' | isumm$new.ID == '6' | isumm$new.ID == '7' | isumm$new.ID == '8' | isumm$new.ID == '9' | 
                   isumm$new.ID == '10', ]
isumm1 <- isumm1[! isumm1$treat1 == 'TH-4', ]
isumm1 <- isumm1[! isumm1$treat1 == 'TS1-4', ]

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat1 + (1|new.ID), data = isumm1)

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))

summary(tuk)
cld(tuk)

########## stats for trials 11-12 (app tech on grass)

isumm1 <- isumm[isumm$new.ID == '11' | isumm$new.ID == '12' , ]
isumm1 <- isumm1[! isumm1$treat1 == 'TS1 + acid', ]

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat1 + (1|new.ID), data = isumm1)

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))

summary(tuk)
cld(tuk)

########## stats for trials 1-4 (treatment effect) 
isumm1 <- isumm[isumm$new.ID == '1' | isumm$new.ID == '2' | isumm$new.ID == '3' | isumm$new.ID == '4' , ]

# data check
qqnorm(isumm1$e.rel.150)
qqline(isumm1$e.rel.150)

#fit a regression model
m1 <- lmer(e.rel.150 ~ treat1 + (1|new.ID), data = isumm1)

# residuals 
res <- resid(m1)
plot(fitted(m1), res)
abline(0,0)

# reults 
summary(m1)

# tuckey's 
tuk <- glht(m1, linfct = mcp(treat1 = 'Tukey'))

summary(tuk)
cld(tuk)
