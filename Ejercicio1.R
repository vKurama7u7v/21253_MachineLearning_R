## => Ejercicio 1
# Importando CSV
file <- read.csv("C:/Users/ISND89/Downloads/divorce/divorce.csv", stringsAsFactors = FALSE, sep = ";")
file

# Sumatoria de la primera columna
suma <- sum(file[,1])
suma

# Sumatoria de la quinta columna
promedio <- mean(file[,5])
promedio

# Sumar la columna 1 pero solo de las filas pares
suma <- sum(file[seq(from=2, to=170, by=2),1])
suma

# Las primeras 5 columnas extraer y guardarlas en una lista
y <- list(file[5,])
y
