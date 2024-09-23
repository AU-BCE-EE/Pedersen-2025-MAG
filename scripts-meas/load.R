
idat <- fread('../data-emission/data/MAG_interval.csv')
pdat <- fread('../data-emission/data/MAG_plot.csv')

# New IDs for publication purpose, publication with application technique
IDs <- c(`23C` =  '1',
         `23D` =  '2',
         `23G` =  '3',
         `24M` =  '4',
         `24C` =  '5',
         `24D` =  '6',
         `24J` =  '7',
         `24L` =  '8',
         `24B` =  '9',
         `24H` =  '10', 
         `24N` =  '11',
         `24O` =  '12',
         `24A` =  '13',
         `24I` =  '14',
         `24K` =  '15',
         `23H` =  'D1',
         `23I` =  'D2',
         `24E` =  'D3',
         `24F` =  'D4',
         `24G` =  'D5')

pdat[, new.ID := IDs[exper]]
