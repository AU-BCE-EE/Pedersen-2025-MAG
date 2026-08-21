# Sort out factor levels, take subsets

# Fill in general slurry type
ds[, slurry.type := 'Digestate']
ds[grepl('Cattle', slurry.ID), slurry.type := 'Cattle']
ds[grepl('Pig', slurry.ID), slurry.type := 'Pig']

# Make factors
ds[, slurry.ID := factor(slurry.ID)]
ds[, slurry.type := factor(slurry.type)]
ds[, slurry.type := relevel(slurry.type, ref = 'Cattle')]

ds[, trial.ID := substr(new.ID.x, 2, 2)]

# Add some colors
cols <- c("#1B9E77", "#D95F02", "#7570B3")
ds[, col := cols[as.integer(slurry.type)]]

# Log transform
ds[, logK := log10(K.mn)]

# Repeat for plot level data

# Fill in general slurry type
ds.plot[, slurry.type := 'Digestate']
ds.plot[grepl('Cattle', slurry.ID), slurry.type := 'Cattle']
ds.plot[grepl('Pig', slurry.ID), slurry.type := 'Pig']

# Make factors
ds.plot[, slurry.ID := factor(slurry.ID)]
ds.plot[, slurry.type := factor(slurry.type)]
ds.plot[, slurry.type := relevel(slurry.type, ref = 'Cattle')]

ds.plot[, trial.ID := substr(new.ID.x, 2, 2)]

# Add some colors
ds.plot[, col := cols[as.integer(slurry.type)]]

# Log transform
ds.plot[, logK := log10(K.mn)]


# Subsets
# Digestate
dsd <- ds[slurry.type == 'Digestate', ]
# Raw slurry
dsr <- ds[slurry.type != 'Digestate', ]


