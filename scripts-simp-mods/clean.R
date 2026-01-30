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

# Subsets
# Digestate
dsd <- ds[slurry.type == 'Digestate', ]
# Raw slurry
dsr <- ds[slurry.type != 'Digestate', ]


