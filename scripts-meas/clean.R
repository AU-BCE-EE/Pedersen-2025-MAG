
# Add trial keys and names for plots
tk <- c(`23C` = 'A', `23D` = 'B', `23G` = 'C', `23H` = 'D', `23I` = 'E')
pdat$trial <- tk[pdat$exper]
idat$trial <- tk[idat$exper]

