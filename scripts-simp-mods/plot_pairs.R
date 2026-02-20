# Plots to go along with simple model analysis

panel.cor <- function(x, y, digits = 2, ...) {
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- cor(x, y, use = "complete.obs")
  col <- if (abs(r) > 0.7) "#D95F02" else "#1B9E77"
  text(0.5, 0.5, formatC(r, digits = digits),
       col = col, cex = 1.2)
}

# Give vars good plotting names
ds[, `:=` (pH = pH.lab.mn, `DM (%)` = TS.mn, `ESA (%)` = area.perc.mn, `log(K)` = logK, m = n.mn, `Par. < 1 mm` = mm1.mn, `Par. > 2 mm` = mm2.mn, Emis. = e.rel.150)]


pdf('../plots-simp-mods/pairs_all.pdf', height = 6, width = 6)
pairs(
  #ds[, .(pH.lab.mn, TS.mn, area.perc.mn, logK, n.mn, mm1.mn, mm2.mn, e.rel.150)], 
  ds[, .(pH, `DM (%)`, `ESA (%)`, `log(K)`, m, `Par. < 1 mm`, `Par. > 2 mm`, Emis.)], 
  upper.panel = panel.cor,
  col = ds$col, 
  pch = 19
)
dev.off()

png('../plots-simp-mods/pairs_all.png', height = 6, width = 6, units = 'in', res = 600)
pairs(
  #ds[, .(pH.lab.mn, TS.mn, area.perc.mn, logK, n.mn, mm1.mn, mm2.mn, e.rel.150)], 
  ds[, .(pH, `DM (%)`, `ESA (%)`, `log(K)`, m, `Par. < 1 mm`, `Par. > 2 mm`, Emis.)], 
  upper.panel = panel.cor,
  col = ds$col, 
  pch = 19
)
dev.off()

