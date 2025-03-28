# fixing times for trial D3
# valve 1-7 has same cta and valve 8-15 has same cta. 
# a shift in the times for one of the groups, fixing them all to be the same to make averageing possible in 
# 'summary.R'

for(i in 2:15) {
idat[idat$new.ID == 'D3' & idat$plot == i]$cta <- idat[idat$new.ID == "D3" & idat$plot == 1]$cta
}
