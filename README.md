# Pedersen-2024-MAG
Data from the project: Methods for reducing Ammonia loss and increased methane yield from bioGas slurry (MAG). 

Repository contains data and data treatment related to NH3 emissions after field application of digestates, and associated data such as slurry surface pH and infiltration. 

# Maintainer
Johanna Pedersen. Contact information here: https://www.researchgate.net/profile/Johanna-Pedersen 

# Overview
This repo contains (nearly) all the data and data processing scripts for NH3 emission experiments conducted within the MAG project. 
The scripts run in R (<https://www.r-project.org/>) and require several add-on packages.
These packages are listed in multiple `packages.R` in `script-*` directories.
Versions of R and packages can be found in `logs/R-versions-*.txt` files.

Scripts for calculation of emission data from raw dynamic flux chamber measurements are included, but data files are too large and are not included. 
However all resulting emission measurements can be found in `data-emission`.
These data in `data-emission` are from the ALFAM2 database, and were used for all plots and analyses.

# Repo overview for folders with R scripts
See 'scripts' for R scripts. 
'main.R' calls the other to do the complete data loading, subsetting, calculations, plotting, saving of data (in 'output' subdirectory) and plots (in 'plots' subdirectory). 

# Directory structure
## 'data-emission'
Measurement data in `data` subdirectory.
These are downloaded from a specific release (based on tag) from ALFAM2-data repo on GitHub (<github.com/sashahafner/ALFAM2-data/>).
(Version is given in `data-emission/scripts/load.R` and `data-emission/logs/data_version.txt`, which was downloaded from the ALFAM2-data repo.)
See `data-emission/scripts` for R scripts for downloading data.
`main.R` calls the others to do the complete dataload, subsetting, and save.

## 'functions'
R functions used by various scripts. 

## 'logs' 
Logs of R package versions, parameter values, and more to try to ensure reproducibility.

## 'output'
Output summaries and similar files.

## 'plots-meas'
Plots produced by scripts in 'scripts-meas'of NH3 emission after field application of digestates. 

## 'plots-surface-pH'
Plots of surface pH, produced by scripts in `scripts-pH`.

## 'scripts-DFC'
R scripts for processing dynamic flux chamber (DFC) data to calculate measured ammonia emission. 
Data files are too large to include but scripts are still included here for partial reproducibility.
The script `main.R` calls all others. 

## 'scripts-ESA'
Matlab scripts for processing exposed surface area (ESA) data. 
Data files (pictures) are too large to include but scripts are still included here for partial reproducibility. 

## 'scripts-meas'
R scripts for working with emission measurements and producing plots.
The script `main.R` calls all others.
Plots can be found in 'plots-meas' and table with cumulative emission can be found in 'output'. 

## 'scripts-pub-tables'
R scripts for working with auxiliary data, ordering, summarizing, and producing tables for publications. 
The scripts 'main.R' calls all others. 
The tables can be found in 'output'.

## 'scripts-surface-pH'
R scripts for working and plotting slurry surface pH data. 
The script 'main.R' calls all others. 
Plots can be found in 'plots-surface-pH'.

## 'sup-data'
Auxiliary/supporting data to the emission measurements. 
Digestate properties, exposed surface area (ESA) data, soil properties, and slurry surface pH. 