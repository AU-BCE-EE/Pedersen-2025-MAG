# Summarizes measurements

# Mean and sd of pH emission
dsumm <- dat[ , list(
                      pH.mn = mean(pH), pH.sd = sd(pH)
                       ), by = list(exp, slurry, elapsed.time)]
