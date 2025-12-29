
# combine cum NH3 data with dig properties 

df.emis$trial <- df.emis$new.ID
df.emis$dig <- df.emis$treat1
df.prop$trial <- df.prop$Trial_B

ds <- merge(df.emis, df.prop, by = c('trial', 'dig'))
