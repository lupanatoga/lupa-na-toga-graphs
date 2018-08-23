library("tidyverse")
library("lubridate")
library("readr")

data = read_csv("data/remuneracao_magistrados.csv")
data[is.na(data)] = 0
data$mes_ano_referencia <- paste0("01/",data$mes_ano_referencia )

data$mes_ano_referencia <- dmy(data$mes_ano_referencia)