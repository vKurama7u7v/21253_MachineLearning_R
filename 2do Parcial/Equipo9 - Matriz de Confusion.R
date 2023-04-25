# Cargar librerias
library(randomForest)

# Dataset
data <- iris

# · ===== SEGMENTACIÓN ===== · #
# Segmentacion 80% - 20%
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.8, 0.2))
random.train <- data[ind == 1,]
random.test <- data[ind == 2,]

# · ===== RANDOM FOREST ===== · #
rf <- randomForest(Species ~ ., data=random.train, ntree=100, proximity=TRUE)

# Se realiza la predicción con los datos de prueba
irisPredict <- predict(rf, newdata = random.test)

# Se obtiene la matriz de confusión
table(irisPredict, random.test$Species)
plot(margin(rf, random.test$Species))

# irisPredict  setosa versicolor virginica
#   setosa          6          0         0
#   versicolor      0         11         2
#   virginica       0          2        10