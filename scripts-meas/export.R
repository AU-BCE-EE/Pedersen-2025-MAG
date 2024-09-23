
write.csv(pdat, '../output/pdat.csv', row.names = FALSE)
write.csv(idat, '../output/idat.csv', row.names = FALSE)
write.csv(wsumm, '../output/temp.csv', row.names = FALSE)


esumm$cum.emis.mn <- paste(esumm$e.rel.150, ' ± ', esumm$e.rel.150.sd)

# Select some cols from esumm to export
esumm.treat <- esumm[is.element(esumm$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), c('new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.treat.sup <- esumm[is.element(esumm$new.ID, c('9', '10', '13', '14', '15')), c('new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.prop <- esumm[is.element(esumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), c('new.ID', 'treat', 'cum.emis.mn', 'e.rel.150.n')] 

# tables with cumulative emission 
write.csv(esumm.treat, '../output/cum.emis.treat.csv', row.names = FALSE)
write.csv(esumm.treat.sup, '../output/cum.emis.treat.sup.csv', row.names = FALSE)
write.csv(esumm.prop, '../output/cum.emis.prop.csv', row.names = FALSE)
