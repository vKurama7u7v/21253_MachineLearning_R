ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
trainData <- iris[ind == 1,]
testData <- iris[ind == 2,]

# Instalando libreria
install.packages("randomForest")
library(randomForest)

# 
rf <- randomForest(Species ~ ., data = trainData, ntree = 100, proximity = TRUE)
rf

table(predict(rf), trainData$Species)
