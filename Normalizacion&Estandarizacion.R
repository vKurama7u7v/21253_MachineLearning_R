# 2.Cargar en RStudio para su posterior manipulación.

class(crx)

min_max_norm <- function(x) {
  (x - min(x))/(max(x) - min(x))
}

normCRX <- as.data.frame(lapply(crx[1:16], min_max_norm))

head(normCRX)

write.table(normCRX, file = "C:\Users\ISND89\Documents\Norm.txt")

score