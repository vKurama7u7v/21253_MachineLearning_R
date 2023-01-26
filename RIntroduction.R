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
