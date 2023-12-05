
dig.dat <- fread('../sup-data/dig.data.csv')
colnames(dig.dat) <- as.character(dig.dat[1, ])
dig.dat <- dig.dat[-1, ]

ESA.dat <- fread('../sup-data/ESA.data.csv')

soil.dat <- fread('../sup-data/soil.data.csv')
colnames(soil.dat) <- as.character(soil.dat[1, ])
soil.dat <- soil.dat[-1, ]


cum.dat <- fread('../output/cum.emis.csv')
temp.dat <- fread('../output/temp.csv')
