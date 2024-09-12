
# Data not yet released, reading from the following commit: 
ghpath <- 'https://github.com/sashahafner/ALFAM2-data/raw/f131ad66f5879aece135278f6fdc3edfd97b35e2/'
rtag <- ''

p <- paste0(ghpath, rtag)
idat <- fread(paste0(p, '/data-output/03/ALFAM2_interval.csv.gz'))
pdat <- fread(paste0(p, '/data-output/03/ALFAM2_plot.csv.gz'))



