
# Data not yet released, reading from the following commit: 
ghpath <- 'https://github.com/sashahafner/ALFAM2-data/raw/0098212e52b3a6b8569ac0a080213cf65ae72374/'
rtag <- ''

p <- paste0(ghpath, rtag)
idat <- fread(paste0(p, '/data-output/03/ALFAM2_interval.csv.gz'))
pdat <- fread(paste0(p, '/data-output/03/ALFAM2_plot.csv.gz'))



