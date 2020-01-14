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
setwd("~/OWL/Data/MANUAL_LABEL_DATA")
freq = 48000
minHZ = 100
maxHZ = 800

# FILENAMES TO PROCESS
filenames <- c(
  "SWIFT12_20190419_000000.wav",
  "SWIFT12_20190419_010000.wav",
  "SWIFT12_20190419_020001.wav",
  "SWIFT12_20190419_030001.wav",
  "SWIFT12_20190419_040002.wav",
  "SWIFT12_20190419_050003.wav",
  "SWIFT12_20190419_060003.wav",
  "SWIFT12_20190419_180000.wav",
  "SWIFT12_20190419_190000.wav",
  "SWIFT12_20190419_200001.wav",
  "SWIFT12_20190419_210001.wav",
  "SWIFT12_20190419_220002.wav",
  "SWIFT12_20190419_230002.wav"
)

# PROCESS FILES
for (fn in filenames) {
  cat("Input:", fn, "\n")
  outfn <- paste('filtered', fn, sep = '_')
  wave <- readWave(fn)
  fwave <- ffilter(wave, f = freq, from = minHZ, to = maxHZ, bandpass = TRUE)
  savewav(fwave, f = freq, filename = outfn)
  cat("Output:", outfn, "\n")
}