# this command will install seewave as well as its deps,
# tuneR and signal :)
#install.packages("seewave")
# this is needed to deal with big files.
# this won't do anything if you're using RStudio:
# instead, see these instructions:
# https://stackoverflow.com/a/52612921
#Sys.setenv('R_MAX_VSIZE'=32000000000)

# IMPORTS
library(tuneR)
library(seewave)

# OPTIONS
setwd("~/OWL/Data/SWIFT/SWIFT1/SWIFT1_2019-04-21")
freq = 48000
minHZ = 100
maxHZ = 800

# FILENAMES TO PROCESS
filenames <- list.files(pattern = "\\.wav$", ignore.case=TRUE)
cat("Scanning files:", filenames)

# PROCESS FILES
for (fn in filenames) {
  cat("Input:", fn, "\n")
  outfn <- paste('filtered', fn, sep = '_')
  wave <- readWave(fn)
  fwave <- ffilter(wave, f = freq, from = minHZ, to = maxHZ, bandpass = TRUE)
  savewav(fwave, f = freq, filename = outfn)
  cat("Output:", outfn, "\n")
}