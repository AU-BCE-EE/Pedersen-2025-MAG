
# Data not yet released, reading from the following commit: 
ghpath <- 'https://github.com/sashahafner/ALFAM2-data/raw/a910607f6efa6a930c39ece5d752f8cc9f2ce6c6/'
rtag <- ''

p <- paste0(ghpath, rtag)
idat <- fread(paste0(p, '/data-output/03/ALFAM2_interval.csv.gz'))
pdat <- fread(paste0(p, '/data-output/03/ALFAM2_plot.csv.gz'))



