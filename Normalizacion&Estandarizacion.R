# 2.Cargar en RStudio para su posterior manipulaci?n.
# Cargando en file > import dataset > from text (readr)
crx

# => Obteniendo las columnas que ocupamos de los datos
data <- data.frame(
  "X1" = crx$X3, 
  "X2" = crx$X8,
  "X3" = crx$X15)
data

# ===== X1 =====
# Comprobando si hay "NAs"
# => Obteniendo los "NA" de la fila X1
pos <- which(data == '?')
pos

# => Reemplazando "?" por NA
data[posX1,1] = NA
data

# => Obteniendo promedio de la fila
prom <- mean(X1toFloat, na.rm = TRUE)
prom <- round(promX1, 2)              # Redondenado decimeles a 2

# => Reemplazando valores por el promedio de la columna
data[posX1,1] = promX1
data


# Normalizando Datos
class(data)

# => Funcion para min-max
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# Normalizando
normData <- as.data.frame(lapply(data[1:3], min_max_norm))
head(normData)

# Estandarizando
standData <- as.data.frame(scale(data[1:3]))
head(standData)

# Exportando data a .txt
write.table(normData, file = "/Volumes/Macintosh Expansion - Data/Macintosh Expansión/Norm.txt")
write.table(standData, file = "/Volumes/Macintosh Expansion - Data/Macintosh Expansión/Stand.txt")
