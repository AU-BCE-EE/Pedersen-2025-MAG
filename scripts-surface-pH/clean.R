
# making elapsed time from time stamp 

# adding leading zero to times where only 3 digits
dat$time <- sprintf("%04d", dat$time)
dat$date.time <- paste(dat$date, dat$time)
dat$date.time<-ymd_hm(dat$date.time)

dat$Vexp <- 0
dat$Vexp[1:6] <- c('V1', 'V2', 'V3', 'V4', 'V5', 'V6')

splitdat <- split(dat, f = dat$exp)
new.names <- dat$Vexp[1:6]

for (i in 1:6){
  assign(new.names[i], splitdat[[i]])
}

z = list(V1, V2, V3, V4, V5, V6)
new.dat = NULL
for(i in z){
  i$elapsed.time <- difftime(i$date.time, min(i$date.time), units='hour')
  new.dat <- rbind(new.dat,i)
}

dat <- new.dat
