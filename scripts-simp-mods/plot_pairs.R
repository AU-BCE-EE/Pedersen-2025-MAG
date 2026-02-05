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
ds[, `:=` (pH = pH.lab.mn, `DM (%)` = TS.mn, `ESA (%)` = area.perc.mn, `log(K)` = logK, m = n.mn, mm1 = mm1.mn, mm2 = mm2.mn, emis = e.rel.150)]


pdf('../plots-simp-mods/pairs_all.pdf', height = 6, width = 6)
pairs(
  #ds[, .(pH.lab.mn, TS.mn, area.perc.mn, logK, n.mn, mm1.mn, mm2.mn, e.rel.150)], 
  ds[, .(pH, `DM (%)`, `ESA (%)`, `log(K)`, m, mm1, mm2, emis)], 
  upper.panel = panel.cor,
  col = ds$col, 
  pch = 19
)
dev.off()

