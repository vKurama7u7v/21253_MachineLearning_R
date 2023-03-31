# · ===== Conjunto ForestFires ===== · #
# Importar Dataset ForestFires (Manual)
# https://archive.ics.uci.edu/ml/datasets/forest%20fires

# Import Required packages
set.seed(500)
library(neuralnet)
library(MASS)

# Eliminando Columnas que no se ocupan
remove = c("month", "day")
data = forestfires[, !(names(forestfires) %in% remove)]
names(data)

# Normalize the data
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)
scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))

# Split the data into training and testing set
index <- sample(1:nrow(data), round(0.75 * nrow(data)))
train_ <- scaled[index,]
test_ <- scaled[-index,]

# Build Neural Network
nn <- neuralnet(area ~ ., data = train_, hidden = c(5, 3), linear.output = TRUE)

# Predict on test data
pr.nn <- compute(nn, test_[,1:11])

# Compute mean squared error
pr.nn_ <- pr.nn$net.result * (max(data$area) - min(data$area)) + min(data$area)
test.r <- (test_$area) * (max(data$area) - min(data$area)) + min(data$area)

MSE.nn <- sum((test.r - pr.nn_)^2) / nrow(test_)

# Plot the neural network
plot(nn)

# Plot regression line
plot(test_$area, pr.nn_, col = "red",
     main = 'Real vs Predicted')
abline(0, 1, lwd = 2)

