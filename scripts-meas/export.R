
write.csv(pdat, '../output/pdat.csv', row.names = FALSE)
write.csv(idat, '../output/idat.csv', row.names = FALSE)
write.csv(wsumm, '../output/temp.csv', row.names = FALSE)


esumm$cum.emis.mn <- paste(esumm$e.rel.150, ' ± ', esumm$e.rel.150.sd)

# Select some cols from esumm to export
esumm.treat <- esumm[is.element(esumm$trial, c('23C', '23D', '23G', '24M', '24B', '24C', '24D', '24H', '24J', '24L', '24N', '24O')), c('trial', 'new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.treat.sup <- esumm[is.element(esumm$trial, c('24B', '24H', '24A', '24I', '24K')), c('trial', 'new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.prop <- esumm[is.element(esumm$trial, c('23H', '23I', '24E', '24F', '24G')), c('trial', 'new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 

# tables with cumulative emission 
write.csv(esumm.treat, '../output/cum.emis.treat.csv', row.names = FALSE)
write.csv(esumm.treat.sup, '../output/cum.emis.treat.sup.csv', row.names = FALSE)
write.csv(esumm.prop, '../output/cum.emis.prop.csv', row.names = FALSE)
