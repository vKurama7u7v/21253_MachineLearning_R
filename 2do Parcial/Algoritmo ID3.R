# Instalando librerias
install.packages('titanic')
install.packages('rpart')
install.packages('rattle')
install.packages('rpart.plot')
install.packages("readxl");

# Cargar librarias de analisis
library(tidyverse)

# Cargar librerias de datos
library(titanic)
# data("titanic_train")
# head(titanic_train)

# Cargar librerias para clasificacion
library(rpart)
library(rattle)
library(rpart.plot)

# Mandando a llamar las librerías
library(readxl)     # Leer archivo de excel 

# Importamos archivo Excel
data <- read_excel(file.choose(), sheet = 1)
as.data.frame(data)


# Modelando con arboles de decision
arbol <- rpart(
  formula = Survived ~ Sex + Age,
  data = titanic_train,
  method = 'class'
)

# Graficando el arbol
fancyRpartPlot(arbol)
