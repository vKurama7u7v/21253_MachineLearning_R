# Leer archivos con read
crx <- read.csv("C:/Users/ISND89/Downloads/crx.data", header=FALSE)
crx

# Columnas que tienen datos NA (� ?): 1, 2, 4, 5, 6, 7, 14
# Las columnas: 1, 4, 5, 6, 7, 9, 10, 12 y 13 son categoricas
# por lo tanto, solo en la columna 2 se trataran los valores faltantes
# Las columnas num�ricas(continuas) son: 2, 3, 8, 11, 14 y 15 se normalizan/estandarizan con la media

# Imputar datos cuando los valores faltantes son ?

colNumericas <- c(2, 3, 8, 11, 14, 15)
#HACER este proceso para todas las columnas que son numericas y existen missing values
#  -------------------------------------#

for (ncol in colNumericas) {
  # Imputar datos cuando los valores son ? #
  # 1. Localizar las posiciones de las filas que tienen los missing values
  posNO <- which(crx[,ncol] == "?")
  
  # 2. Debido a que la columna es tipo factor, convertir a numerico aquellas
  #    filas que son diferentes a NA�s o ?�s
  vecNumeric <- as.numeric(as.character(crx[which(crx[,ncol] != "?"),ncol]))
  
  # 3. Obtener la media solo de los datos que no son missing values
  mediaV <- mean(vecNumeric)
  
  # 4. Convertir a num�rico toda la columna deseada
  crx[,ncol] <- as.numeric(as.character(crx[,ncol]))
  
  # 5. Asignar la media de la columna deseada a las filas donde existen missing values
  crx[posNO,ncol] <- mediaV
}

# --------------------------------- #

#funci�n para normalizar
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

crxNormal <- crx
#apply Min-Max normalization 
crxNormal[,colNumericas] <- as.data.frame(lapply(crxNormal[,colNumericas], min_max_norm))

summary(crxNormal)

# Vaciar los datos a un archivo
write.table(crxNormal, file = "C:/Users/ISND89/Documents/normalizar?.txt", sep = "\t", eol= "\n", dec = ".")

standarizacion <- function(x) {
  (x - mean(x))/sd(x)
}

crxEstandar <- crx
#estandardiza todas las columnas num�ricas
crxEstandar[,colNumericas] <- as.data.frame(lapply(crxEstandar[,colNumericas], standarizacion))

# Vaciar los datos a un archivo
write.table(crxEstandar, file = "C:/Users/ISND89/Documents/estandar?.txt", sep = "\t", eol= "\n", dec = ".")

#estandardiza solo una columna
#crx[,2] <- (crx[,2] - mean(crx[,2])) / sd(crx[,2])

summary(crx)
summary(crxNormal)
summary(crxEstandar)
