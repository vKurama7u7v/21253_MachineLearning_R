# TEMA 7 *===== OUTLIER DETECTION =====*
set.seed(3147)
x <- rnorm(100)
summary(x)

# Outliers
# Realiza un Boxplot => Diagrama de Cajas
boxplot.stats(x)$out

# Gráfica el Diagrama de cajas
boxplot(x)
boxplot(y)

# Media
media <- mean(x)
media

# Desviación Estandar
desvEst <- sd(x)
desvEst

# Valor con el que se compara y detectar
# Outliers
desv_3 <- 3 * desvEst - media
desv_3

desv_2 <- 2 * desvEst - media
desv_2

y <- rnorm(100)
df <- data.frame(x, y)
rm(x, y)

# Obteniendo los primeros valores
head(df)

# Obteniendo los ultimos valores
tail(df)


# 7.1 Univariate Outlier Detection
# Permite de alguna manera que tenga 
# los datos para acceder sin necesidad
# de tener el dataframe
attach(df)

# buscar en la variable x de los valores
# del bloxpot
(a <- which(x %in% boxplot.stats(x)$out))

(b <- which(y %in% boxplot.stats(y)$out))
detach(df)

# outliers in both x and y
# con la funcion intersect,
# determina cual de los 2 se intersecta
(outlier.list1 <- intersect(a,b))
plot(df)
points(df[outlier.list1,], col="red", pch="+", cex=2.5)

# outliers in either x or y
(outlier.list2 <- union(a,b))

plot(df)
points(df[outlier.list2,], col="blue", pch="x", cex=2)


# 7.2 Outlier Detection With LOF
install.packages("DMwR2")
library(DMwR2)

iris2 <- iris[,1:4]
iris2

# Graficando
outlier.scores <- lofactor(iris2, k=5)
plot(density(outlier.scores))

# 
outliers <- order(outlier.scores, decreasing = T)[1:5]
print(outliers)

print(iris2[outliers,])

n <- nrow(iris2)
labels <- 1:n
labels[-outliers] <- "."
biplot(prcomp(iris2), cex=.8, xlabs=labels)


pch <- rep(".", n)
pch[outliers] <- "+"
col <- rep("black", n)
col[outliers] <- "red"
pairs(iris2, pch=pch, col=col)


install.packages("Rlof")
library(Rlof)
outlier.scores <- lof(iris2, k=5)
# try with different number of neighbors (k = 5,6,7,8,9 and 10)
outlier.scores <- lof(iris2, k=c(5:10))

# 7.3 Outlier Detection by Clustering
# remove species from the data to cluster
iris2 <- iris[,1:4]
kmeans.result <- kmeans(iris2, centers=3)
# cluster centers
kmeans.result$centers

#