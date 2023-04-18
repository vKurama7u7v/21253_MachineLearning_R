# Cargar librerias
library(randomForest)

# Dataset
data <- iris
set.seed(1234)

# ===== SEGMENTACIÓN =====
# Segmentacion 80% - 20%
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.8, 0.2))
random.train <- data[ind == 1,]
random.test <- data[ind == 2,]

# ===== Random Forest =====
rf <- randomForest(Species ~ ., data=random.train, ntree=100, proximity=TRUE)

table(predict(rf), random.train$Species)
print(rf)
plot(rf)

irisPred <- predict(rf, newdata=random.test)

table(irisPred, random.test$Species)
plot(margin(rf, random.test$Species))