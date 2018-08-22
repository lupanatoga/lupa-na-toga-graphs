library("readr")
library("dplyr")
library("plotly")
library("tidyverse")
library("lubridate")
library("sunburstR")


data = read_csv("data/remuneracao_magistrados.csv")
data[is.na(data)] = 0

