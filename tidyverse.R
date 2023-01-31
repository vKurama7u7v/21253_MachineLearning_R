install.packages("tidyverse")
library(tidyverse)

dia <- diamonds
summary(dia)
dia

class(dia$clarity)
dia$clarity

# %>% Operador que sirve para pasar datos,
# En este caso de derecha a izquierda

diamonds %>% count(dia$clarity)
summary(dia$clarity)

x <- c(0.25, "Good", "H", "SI1" , 62.3, 50, 777, 7.5, 5, 2.5)

?rbind

diamonds = rbind(dia, x)

summary(diamonds$clarity)

dia

class(diamonds$clarity)

head(dia)
tail(dia)

class(dia)

unlist(dia$carat)
unlist(dia[,1])



