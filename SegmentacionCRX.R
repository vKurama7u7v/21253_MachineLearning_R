install.packages(caret)
library(caret)


# =-=-=-=-= OTRO MODO NORMALIZACION =-=-=-=-=
crx <- read.csv("C:/Users/ISND89/Downloads/crx.data", header=FALSE, na.strings="?")

colNumericas <- c(2, 3, 8, 11, 14, 15)

for (i in colNumericas) {
  posV<-which(is.na(crx[,i]))
  mediaV<-mean(!is.na(crx[,i]))
  crx[posV,i] <- mediaV
}

summary(crx)

#función para normalizar
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

crxNormal <- crx

#apply Min-Max normalization 
crxNormal[,colNumericas] <- as.data.frame(lapply(crxNormal[,colNumericas], min_max_norm))

# Vaciar los datos a un archivo
write.table(crxNormal, file = "C:/Users/ISND89/Documents/normalizarNA.txt", sep = "\t", eol= "\n", dec = ".")

standarizacion<-function(x) {
  (x - mean(x))/sd(x)
}

crxEstandar <- crx
#estandardiza todas las columnas numéricas
crxEstandar[,colNumericas] <- as.data.frame(lapply(crxEstandar[,colNumericas], standarizacion))

#estandardiza solo una columna
#crx[,2] <- (crx[,2] - mean(crx[,2])) / sd(crx[,2])

# Vaciar los datos a un archivo
write.table(crxEstandar, file = "C:/Users/ISND89/Documents/estandarNA.txt", sep = "\t", eol= "\n", dec = ".")

summary(crx)
summary(crxNormal)
summary(crxEstandar)


# => SEGMENTACION
df <- crxNormal
set.seed(1234)

# OPCION 1
ind <- sample(2, nrow(df), replace = TRUE, prob = c(0.8, 0.2))
random.train <- df[ind == 1,]
random.test <- df[ind == 2,]

# OPCION 2
trainTestSplit <- floor(nrow(df)*0.7)

# Asignacion de los datos de entrenamiento
train <- df[1:trainTestSplit,]

# Datos de prueba
test <- df[-(1:trainTestSplit),]