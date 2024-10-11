
# average of the two 'out' and the two 'in' temp loggers for DFC 

tsumm <- tdat[, list(
  temp = mean(temp)
), by = list(pos, t.start)]
  

# dataframe for plotting ambient vs in vs out temperatures 
tsummO <- tsumm[tsumm$pos == 'out', ]
colnames(tsummO)[3] <- 'Otemp'
tsummI <- tsumm[tsumm$pos == 'in', ]
colnames(tsummI)[3] <- 'Itemp'
