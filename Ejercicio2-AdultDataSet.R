file <- read.csv("C:/Users/ISND89/Downloads/arrhythmia.csv", stringsAsFactors = FALSE, sep = ",")
file

summary(file)
is.na(file)

sum(is.na(adult))

which(adult=='?')

pos <- which(adult$X2=='?')
length(pos)



# Libreria para calcular la moda
install.packages("modeest")
library(modeest)
mfv(adult$X2)

# Inputar datos en la columna 2
adult[pos,2] = "Private"
