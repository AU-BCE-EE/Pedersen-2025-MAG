
# Add trial keys and names for plots
# tk <- c(`23C` = 'A', `23D` = 'B', `23G` = 'C', `23H` = 'D', `23I` = 'E')
# pdat$trial <- tk[pdat$exper]

pdat$trial <- pdat$exper

# Merge in plot level variables
idat <- merge(pdat, idat, by = c('pid', 'pmid'))

# Giving new ID's for publication purpose. 
idat$new.ID <- idat$trial

# New ID's for treatment publication
idat$new.ID <- gsub('23C', '1', idat$new.ID)
idat$new.ID <- gsub('23D', '2', idat$new.ID)
idat$new.ID <- gsub('23G', '3', idat$new.ID)
idat$new.ID <- gsub('24M', '4', idat$new.ID)
idat$new.ID <- gsub('24C', '5', idat$new.ID)
idat$new.ID <- gsub('24D', '6', idat$new.ID)
idat$new.ID <- gsub('24J', '7', idat$new.ID)
idat$new.ID <- gsub('24L', '8', idat$new.ID)
idat$new.ID <- gsub('24B', '9', idat$new.ID)
idat$new.ID <- gsub('24H', '10', idat$new.ID)
idat$new.ID <- gsub('24N', '11', idat$new.ID)
idat$new.ID <- gsub('24O', '12', idat$new.ID)
idat$new.ID <- gsub('24A', '13', idat$new.ID)
idat$new.ID <- gsub('24I', '14', idat$new.ID)
idat$new.ID <- gsub('24K', '15', idat$new.ID)

# New ID's for properties publication
idat$new.ID <- gsub('23H', '1', idat$new.ID)
idat$new.ID <- gsub('23I', '2', idat$new.ID)
idat$new.ID <- gsub('24E', '3', idat$new.ID)
idat$new.ID <- gsub('24F', '4', idat$new.ID)
idat$new.ID <- gsub('24G', '5', idat$new.ID)