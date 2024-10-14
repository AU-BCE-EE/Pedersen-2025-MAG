rm(list = ls())

source('functions.R')
source('packages.R')
source('load.R')
source('datetime.R')
source('calc.R')
source('subset.R')
source('func.R')
source('plot.R')
render('temp_stats.Rmd', output_dir = '../stats-temp')

