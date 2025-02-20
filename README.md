# Pedersen-2025-MAG
Data from the project: Methods for reducing Ammonia loss and increased methane yield from bioGas slurry (MAG). 

Repository contains data and data treatment related to NH3 emissions after field application of digestates, and associated data such as slurry surface pH and infiltration. 

The data is presented in two manuscripts: 

A: Pedersen, J., Hafner, S. D., Romio, C., Pacholski, A. S. Evaluation of application and treatment options for reducing ammonia emissions after field-applied slurry digestate. In preparation, February 2025.

B: Pedersen, J., Labouriau, R., Romio, C., Pacholski, A. S., Hafner, S. D. Effect of digestate and untreated slurry properties on ammonia emission after field application. In preparation, February 2025. 

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
See `scripts` for R scripts. 
`main.R` calls the other to do the complete data loading, subsetting, calculations, plotting, saving of data (in `output` subdirectory) and plots (in `plots` subdirectory). 

# Directory structure
## `data-dig-prop-stats`
Data file used for the statistical analysis in 'Manuscript B'. 

## `data-emission`
Measurement data in `data` subdirectory.
These are downloaded from a specific release (based on tag) from ALFAM2-data repo on GitHub (<github.com/sashahafner/ALFAM2-data/>).
(Version is given in `data-emission/scripts/load.R` and `data-emission/logs/data_version.txt`, which was downloaded from the ALFAM2-data repo.)
See `data-emission/scripts` for R scripts for downloading data.
`main.R` calls the others to do the complete dataload, subsetting, and save.

## `data-soil-temp`
Measurement data of temperature at soil surface (HOBO_X...) and climatic data (clim_dat). 

## `functions`
R functions used by various scripts. 

## `logs`
Logs of R package versions, parameter values, and more to try to ensure reproducibility.

## `output`
Output summaries and similar files.

## `plots-meas`
Plots produced by scripts in `scripts-meas` of NH3 emission after field application of digestates. 

## `plots-surface-pH`
Plots of surface pH, produced by scripts in `scripts-pH`.

## `plots-temp-loggers`
Plots of soil surface temperature, produced by scripts in `scripts-temp-loggers`. 

## `scripts-DFC`
R scripts for processing dynamic flux chamber (DFC) data to calculate measured ammonia emission. 
Data files are too large to include but scripts are still included here for partial reproducibility.
The script `main.R` calls all others. 

## `scripts-ESA`
Matlab scripts for processing exposed surface area (ESA) data. 
Data files (pictures) are too large to include but scripts are still included here for partial reproducibility. 

## `scripts-meas`
R scripts for working with emission measurements and producing plots.
The script `main.R` calls all others.
Plots can be found in `plots-meas` and table with cumulative emission can be found in `output`. 
Statistics can be found in `stats-meas`.

## `scripts-pub-tables`
R scripts for working with auxiliary data, ordering, summarizing, and producing tables for publications. 
The scripts `main.R` calls all others. 
The tables can be found in `output`.

## `scripts-surface-pH`
R scripts for working and plotting slurry surface pH data. 
The script `main.R` calls all others. 
Plots can be found in `plots-surface-pH`.

## `scripts-temp-loggers`
R scripts for working and plotting soil temperature data data. 
The script `main.R` calls all others. 
Plots can be found in `plots-temp-loggers`.
Statistics can be found in `stats-temp`.

## `stats-meas`
Documentation of statistical analysis performed for NH3 data. 
RMD file can be found in `scripts-meas`.

## `stats-temp`
Documentation of statistical analysis performed for soil temperature data. 
RMD file can be found in `scripts-temp-loggers`.

## `sup-data`
Auxiliary/supporting data to the emission measurements. 
Digestate properties, exposed surface area (ESA) data, soil properties, and slurry surface pH. 

# Links to manuscript A
This section give the sources of tables, figures, and some statistical results presented in the paper.

| Paper component          |  Repo source                             |  Repo scripts             |
|-----------------         |-----------------                         |---------------            |
|    Table 1             | `plots-field-trials/flux_weather1.pdf`       | `scripts-field-trials/plot.R` |


|  Table 2   | `output/soil.table.treat.csv` | `scripts-pub-tables/export.R` |
|  Table 3  | `output/digestate.table.treat1.csv` | `` |
|  Fig. 1    | `plots-meas/NH3.flux.comm.50.pdf` | `scripts-meas/plot.R` |
|  Table 4   | `output/cum.emis.treat.csv` | `scripts-meas/export.R` |
|  Table 5  | `output/mmeans1_4` and `output/mmeans5-10` | `scripts-meas/export.R` |
|   Table S2 | `output/cum.emis.treat.sup.csv` | `scripts-meas/export.R` |
|  Fig. S4 | `plots-meas/NH3.flux.speed.pdf` | `scripts-meas/plot.R` |
|  Table S3 | `output/cum.emis.treat.sup.csv` | `scripts-meas/export.R` |
|  Table S4  | `output/cum.emis.treat.sup.csv` | `scripts-meas/export.R` |
|  Fig. S5  | `plots-meas/NH3.flux.DFCmov.pdf` | `scripts-meas/plot.R` |
| Fig. S10 | `plots-temp-loggers/temp_elevation.pdf` | `scripts-temp-loggers/plot.R` |
|  Fig. S11  | `plots-meas/temp.treat.R` | `scripts-meas/plot.R` |
|  Table S5  | `output/digestate.table.treat2.csv` | `scripts-pub-tables/export.R` |
|  Fig. S11 | `plots-meas/NH3.flux.comm.150.pdf` | `scripts-meas/plot.R` |
|  Fig. S12 | `plots-meas/NH3.flux.trial12.pdf` | `scripts-meas/plot.R` |


# Links to manuscript B
This section give the sources of tables, figures, and some statistical results presented in the paper.

| Paper component          |  Repo source                             |  Repo scripts             |
|-----------------         |-----------------                         |---------------            |
|      |      ||
