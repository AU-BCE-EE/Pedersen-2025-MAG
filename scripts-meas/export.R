
write.csv(pdat, '../output/pdat.csv', row.names = FALSE)
write.csv(idat, '../output/idat.csv', row.names = FALSE)
write.csv(wsumm, '../output/temp.csv', row.names = FALSE)


esumm$cum.emis.mn <- paste(esumm$e.rel.150, ' ± ', esumm$e.rel.150.sd)

# Select some cols from esumm to export
esumm.all <- esumm[ , c('new.ID', 'treat1', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.treat <- esumm[is.element(esumm$new.ID, c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12')), c('new.ID', 'treat1', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.treat.sup <- esumm[is.element(esumm$new.ID, c('9', '10', '13', '14', '15')), c('new.ID', 'treat1', 'cum.emis.mn', 'e.rel.150.n')] 
esumm.prop <- esumm[is.element(esumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), c('new.ID', 'treat1', 'cum.emis.mn', 'e.rel.150.n')] 

# tables with cumulative emission 
write.csv(esumm.all, '../output/cum.emis.csv', row.names = FALSE)
write.csv(esumm.treat, '../output/cum.emis.treat.csv', row.names = FALSE)
write.csv(esumm.treat.sup, '../output/cum.emis.treat.sup.csv', row.names = FALSE)
write.csv(esumm.prop, '../output/cum.emis.prop.csv', row.names = FALSE)


# table with cumulative emission at chamber level for digestate property stats
isumm3 <- isumm[is.element(isumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), c('new.ID', 'treat1', 'e.rel.150')]
write.csv(isumm3, '../output/cum.emis.ID.prop.csv', row.names = FALSE)

# Marginal means by analysis
write.csv(mmeans1_4, '../output/mmeans1_4.csv', row.names = FALSE)
write.csv(mmeans5_10, '../output/mmeans5_10.csv', row.names = FALSE)


# table with cumulative emission for sup mat plot
esumm.prop.supMat <- esumm[is.element(esumm$new.ID, c('D1', 'D2', 'D3', 'D4', 'D5')), c('new.ID', 'treat1', 'e.rel.150')] 
write.csv(esumm.prop.supMat, '../output/esumm.prop.supMat.csv', row.names = FALSE)


