# · ===== DOCUMENTACIÓN ===== · #
# https://koalatea.io/r-svm-regression/


# · ===== Conjunto ForestFires ===== · #
# https://archive.ics.uci.edu/ml/datasets/forest%20fires


# · ===== LIBRERIAS ===== · #
# install.packages("e1071")
# install.packages("caret")
# install.packages("kernlab")
# Paquete e1071 que hace uso de SVM
library(e1071)
library(caret)
library(kernlab)


# · ===== SEGMENTACIÓN ===== · #
# Segmentación del conjunto de datos (80%, 20%)
set.seed(1)
inTraining <- createDataPartition(forestfires$area, p = .80, list = FALSE)
training <- forestfires[inTraining,]
testing  <- forestfires[-inTraining,]


# · ===== MODELO ===== · #
set.seed(1)
model <- train(
  area ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model


# · ===== PREDICCiÓN ===== · #
test.features = subset(testing, select=-c(area))
test.target = subset(testing, select=area)[,1]

predictions = predict(model, newdata = test.features)

View(as.data.frame(test.target))
View(as.data.frame(predictions))


# · ===== FORMULA ===== · #
# RMSE
sqrt(mean((test.target - predictions)^2))

# R2
cor(test.target, predictions) ^ 2

