# Documentaci?n:
# https://koalatea.io/r-svm-regression/

# Cargando contenido de conjunto de datos
library(MASS)
data(Boston)
str(Boston)

# Paquete e1071 que hace uso de SVM
# install.packages("e1071")
library(e1071)

# Se crea un modelo svm para el conjunto de datos
# NOTA: No tiene parametros el kernel
model = svm(medv ~ ., data = Boston)
print(model)

# Si se le quiere agregar parametros al kernel,
# usamos las sig. librerias
set.seed(1)
library(caret)
library(kernlab)

# usamos la funcion train, estableciendo el modelo "svmRadial"
# C -> Costo que se puede sintonizar
# RMSE -> Es un error 
# Rsquared -> Error cuadrado
# MAE -> Mid Absolute Error (Error absoluto promedio)
model <- train(
  medv ~ .,
  data = Boston,
  method = 'svmRadial'
)
model

# Preprocesando con caret
set.seed(1)
# Aqui los datos se van a escalar
# (Algo similar a la normalizaci?n)
model2 <- train(
  medv ~ .,
  data = Boston,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model2

# Segmentar el conjunto de datos (80%, 20%)
set.seed(1)
inTraining <- createDataPartition(Boston$medv, p = .80, list = FALSE)
training <- Boston[inTraining,]
testing  <- Boston[-inTraining,]

# Usando el conjunto training
set.seed(1)
model3 <- train(
  medv ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model3


# => PREDICCI?N
# quedarse con el 13 primeras columnas, 
# menos medv que es nuestra variable objetivo (target)
test.features = subset(testing, select=-c(medv))
test.target = subset(testing, select=medv)[,1]
dftest <- data.frame(test.target)

# Metodo predict, pasamos las caracteristicas del conjunto de prueb
# Predice el target
predictions = predict(model3, newdata = test.features)
View(predictions)
df <- data.frame(predictions)

# RMSE
sqrt(mean((test.target - predictions)^2))

# R2
cor(test.target, predictions) ^ 2

### CROSS-VALIDATION

set.seed(1)
ctrl <- trainControl(
  method = "cv",
  number = 10,
)

set.seed(1)
model4 <- train(
  medv ~ .,
  data = testing,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trCtrl = ctrl
)
model4

test.features = subset(testing, select=-c(medv))
test.target = subset(testing, select=medv)[,1]

predictions = predict(model4, newdata = test.features)

# RMSE
sqrt(mean((test.target - predictions)^2))

# R2
cor(test.target, predictions) ^ 2

# => GRID -> Maya
# Se establece un costo
set.seed(1)
tuneGrid <- expand.grid(
  C = c(0.25, .5, 1),
  sigma = 0.1
)

model5 <- train(
  medv ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trControl = ctrl,
  tuneGrid = tuneGrid
)
model5

plot(model5)


