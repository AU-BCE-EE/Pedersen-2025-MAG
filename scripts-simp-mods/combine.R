
# combine cum NH3 data with dig properties 

df.emis[, trial := new.ID]
df.emis[, slurry.ID := treat1]
df.prop[, trial := Trial_B]
df.prop[, slurry.ID := dig]

ds <- merge(df.emis, df.prop, by = c('trial', 'slurry.ID'))
