
write.csv(pdat, '../output/pdat.csv', row.names = FALSE)
write.csv(idat, '../output/idat.csv', row.names = FALSE)
write.csv(wsumm, '../output/temp.csv', row.names = FALSE)

# tables with cumulative emission 
write.csv(esumm.treat, '../output/cum.emis.treat.csv', row.names = FALSE)
write.csv(esumm.treat.sup, '../output/cum.emis.treat.sup.csv', row.names = FALSE)
write.csv(esumm.prop, '../output/cum.emis.prop.csv', row.names = FALSE)
