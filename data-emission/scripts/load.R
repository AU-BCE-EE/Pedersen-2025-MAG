
# Alternative below to get particular commit (if not yet in release)
ghpath <- 'https://github.com/sashahafner/ALFAM2-data/raw/91bb37fb91867dd62434aafc681f5f8f71b5b73/'
rtag <- ''

p <- paste0(ghpath, rtag)
idat <- fread(paste0(p, '/data-output/03/ALFAM2_interval.csv.gz'))
pdat <- fread(paste0(p, '/data-output/03/ALFAM2_plot.csv.gz'))



