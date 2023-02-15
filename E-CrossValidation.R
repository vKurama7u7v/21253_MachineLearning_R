# =-=-=-=-= OTRO MODO NORMALIZACION =-=-=-=-=
crx <- read.csv(file.choose(), header=FALSE, na.strings="?")

colNumericas <- c(2, 3, 8, 11, 14, 15)

for (i in colNumericas) {
  posV<-which(is.na(crx[,i]))
  mediaV<-mean(!is.na(crx[,i]))
  crx[posV,i] <- mediaV
}

summary(crx)

#funci?n para normalizar
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

crxNormal <- crx

#apply Min-Max normalization 
crxNormal[,colNumericas] <- as.data.frame(lapply(crxNormal[,colNumericas], min_max_norm))

# Vaciar los datos a un archivo
# write.table(crxNormal, file = "C:/Users/ISND89/Documents/normalizarNA.txt", sep = "\t", eol= "\n", dec = ".")

standarizacion<-function(x) {
  (x - mean(x))/sd(x)
}

crxEstandar <- crx
#estandardiza todas las columnas num?ricas
crxEstandar[,colNumericas] <- as.data.frame(lapply(crxEstandar[,colNumericas], standarizacion))

#estandardiza solo una columna
#crx[,2] <- (crx[,2] - mean(crx[,2])) / sd(crx[,2])

# Vaciar los datos a un archivo
# write.table(crxEstandar, file = "C:/Users/ISND89/Documents/estandarNA.txt", sep = "\t", eol= "\n", dec = ".")

summary(crx)
summary(crxNormal)
summary(crxEstandar)

install.packages(lattice)
library(lattice)
library(caret)

#create data frame
df <- data.frame(y=c(6, 8, 12, 14, 14, 15, 17, 22, 24, 23),
                 x1=c(2, 5, 4, 3, 4, 6, 7, 5, 8, 9),
                 x2=c(14, 12, 12, 13, 7, 8, 7, 4, 6, 5))

#view data frame
df

#specify the cross-validation method
ctrl <- trainControl(method = "cv", number = 5)

#fit a regression model and use k-fold CV to evaluate performance
# y ~ x1 + x2 => son las columnas de que son si
# Caracteristicas o columnas del datafraME
# trControl => Controles
model <- train(y ~ x1 + x2, data = df, method = "lm", trControl = ctrl)

#view summary of k-fold CV               
print(model)

ctrl
model


train
