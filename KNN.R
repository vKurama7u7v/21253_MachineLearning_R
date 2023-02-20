#
df <- iris
set.seed(1234)

# OPCION 1
ind <- sample(2, nrow(df), replace = TRUE, prob = c(0.7, 0.3))

# Segmantación aleatoria del conjunto de datos
random.train <- df[ind == 1,]
random.test <- df[ind == 2,]

# Función para calcular la distancia
distanciaManhattan <- function(x, y) {
  result <- sum(abs(x-y))
}

# Inicializando vector dist (todas las columnas)
dist <- c()

# Ciclo for de 1 a 38
for (i in 1:38) {
  
  # Inicializando vector lista (cada columna)
  lista <- c()
  
  # Ciclo for de 1 a 112
  for (j in 1:112) {
    # Se asignan las instancias(primera) de cada 
    # subconjunto de datos(train y test)
    instTrain <- random.train[j, 1:4]
    instTest <- random.test[i, 1:4]
    
    # Se calcula la distancia que existe entre el train y test
    result <- distanciaManhattan(instTrain, instTest)
    
    # Se almacena en resultado a la lista
    lista <- c(lista, round(result,2))
  }
  
  # Se agrega la columna de resultados (list)
  dist <- cbind(dist, lista)
}

# Generando un data.frame
distancias <- data.frame(dist)

# Generando txt con las distancias
write.table(distancias, file = "/Volumes/Macintosh Expansion - Data/Macintosh Expansión/distancias.txt", sep = "\t", eol= "\n", dec = ".")

