x <- "Hello World"
class(x)

# Listas y Vectores
x <- list(age=c(10,21,33), weight=c(30,66,80))
names(x)
length(x)


x <- c("This", "is", "a", "character", "vector")
x


y <- c(1,2,3,5,7)
y

class(x)
class(y)


# => Initialization of logical vector with lenght of 5
x <- vector(mode="logical", length = 5)
x

x[1] <- TRUE
x

x <- c("Hello World!", 1, TRUE)
x

y <- c(TRUE, FALSE, 1)
y

as.logical(y)

x <- list("Hello World!", 2015, TRUE, 3.14)
x

class(x[[2]])

## =>> MATRIZ

mat <- c(1,3,2,4)
dim(mat) <- c(2,2)
mat

temp <- c(1,2,3,7,8,9)
mat <- matrix(temp, nrow=2, ncol = 3, byrow=TRUE)
mat

# Default byrow=FALSE
mat <- matrix(temp, nrow=2, ncol=3)
mat

# Creando Matrix, Uniendo dos vector
t1 <- c(1,2,3)
t2 <- c(7,6,9)

#By rows
rbind(t1,t2)

#By Columns
cbind(t1,t2)


## =>> FACOTRES & NOMINAL DATA
factor(c("Yes", "No", "No", "Yes"))
f <- factor(c("Yes", "No", "No", "Yes"))
levels = c("Yes")


## =>> MISSING VALUES
x <- NA
is.na(x)

y <- 0/0
y
is.nan(y)


## =>> DATA FRAMES
x <- c("mary", "bob", "george")
y <- c(15,16,20)
z <- c(FALSE, FALSE, TRUE)
dfr <- data.frame(usename=x, age=y, adult=z)
dfr

# first row
dfr[1,]

# first column
dfr[,1]

# Age Column
dfr$age

## =>> READING DATA FROM FILE
data <- read.csv("C:/Users/ISND89/Downloads/divorce/divorce.csv", stringsAsFactors = FALSE, sep = ";")
data

divorce <- read.csv("C:/Users/ISND89/Downloads/divorce/divorce.csv", sep=";")
divorce

class(divorce)

divorce[,1]

# Usando secuencia/rango para leer datos
# [fila, columna]
divorce[1:5,1:6]

divorce[,1] <- as.factor(divorce[,1])

# Haciendo resumen de las primeras 5 columnas
summary(divorce[,1:5])

## =>> CREACIÓN DE SECUENCIAS
sec <- 1:10
sec

sec2 <- -5:5
sec2

# Creación de secuencias con la funcion SEQ
y <- seq(from=2, to=10, length=4)
y

# from = 2, to = 10, length = 4
# (to = 10 - from = 2)/(length - 1 = 3) = 2.666667
# va sumando de 2.666667 en 2.666667

# Creacion de secuencias con la funcion REP
x <- rep(1:4,4)
x

x <- rep("hello", 5)
x

x <- rep(1:4, c(2,1,2,1))
x


## =>> REFERENCIA A LOS SUBCONJUNTOS

# Con operador [
x <- seq(1, 15, 2)
x

x[1:3]

x[2:5]

class(x)

class(x[2:5])

y <- list("Hello", "Planet", "Earth!")
y[c(1:3)]

class(y[c(1,3)])

y <- list("Hello", "Planet", "Earth!")
pos <- c(1,2)

y[pos]

# Con operador [[
y <- list("Hello", "Planet", "Earth!")
y[[1]]

class(y[[1]])

y[[c(1,3)]]

y <- list(age=c(18, 20, 28), height=c(1.60, 1.72, 1.79))
y

class(y)

y$age

class(y$age)

x <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
x

class(x[1,1])

class(x[1,1, drop = FALSE])

y <- list(age=c(15, 19, 20), height=c(1.60, 1.68, 1.76))
y[["age"]]

y[["a", exact=FALSE]]

# Extraer NA
y <- c(15, 22, 45, NA, NA, 51)
y

# Localizar los NA en un vector
i <- is.na(y)
i

# Quitar los elementos NA de un Vector
y[!i]


## =>> VECTORIZACIÓN
x <- rnorm(10000000)
y <- rnorm(10000000)
z <- vector(mode = "numeric", length = 10000000)

library(stats)
# Iteración
start <- proc.time()
for (i in 1:10000000){
  z[i] <- x[i]+y[i]
}
proc.time() - start


## =>> Condiciones: IF-ELSE
x <- 20
if(x < 0) {
  print("Negativo")
} else if(x < 10) { 
  print("Positivo, numero menor a 10")
} else {
  print("Numero mayor que 10")
}

## =>> Bucles: For, Repeat, While
for (i in 1:10) {
  cat(i)
  cat(" ")
}


letters

for (x in letters) {
  cat(x)
  cat(" ")
  
}

x <- -1
while (x < 5) {
  print(x)
  x <- x + 1
}

x <- 1
repeat {
  print(x)
  
  if(x > 5) {
    break
  }
  
  x <- x + 1
}

## =>> Sentencias NEXT & BREAK

for (i in 1:100) {
  # Imprime los primeros 20 números
  if(i <= 20){
    print(i)
    next
  }
}

## =>> Funciones (function())

myPrinter <- function(x){
  for (i in seq_len(x)) {
    cat(i, "Hello World!")
  }
}

myPrinter(3)


volume <- function(x=3, y=3, z=3){
  print(x*y*z)
}

volume(y=3, z=5, x=11)

volume()


myPrinter <- function(..., mes){
  print(sum(...))
  print(mes)
}

myPrinter(3,5,11, mes="Hi!")

## =>> 2.6.1 LAPPLY
str(lapply)

x <- list(a = rnorm(10), b = rnorm(20), c = rnorm(30))
lapply(x, mean)

# rnorm(n) => Números random
# mean => Calcula el promedio

