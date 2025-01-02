# Analysis of temperature difference within and outside DFCs

rm(list = ls())

source('functions.R')
source('packages.R')
source('load.R')
source('datetime.R')
source('calc.R')
source('subset.R')
render('temp_stats.Rmd', output_dir = '../stats-temp')
source('plot.R')

