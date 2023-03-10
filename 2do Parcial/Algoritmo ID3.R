# Instalando librerias
install.packages('titanic')
install.packages('rpart')
install.packages('rattle')
install.packages('rpart.plot')

# Cargar librarias de analisis
library(tidyverse)

# Cargar librerias de datos
library(titanic)
data("titanic_train")
head(titanic_train)

# Cargar librerias para clasificacion
library(rpart)
library(rattle)
library(rpart.plot)

# Modelando con arboles de decision
arbol <- rpart(
  formula = Survived ~ Sex + Age,
  data = titanic_train,
  method = 'class'
)

# Graficando el arbol
fancyRpartPlot(arbol)
