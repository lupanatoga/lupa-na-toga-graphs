library("readr")
library("dplyr")
library("plotly")
library("tidyverse")
library("lubridate")
library("sunburstR")


data = read_csv("data/salarios_tratados_com_mes.csv")
data[is.na(data)] = 0


auxiliost = data %>% group_by(nome,subsidio) %>% summarise(auxilio = sum(total))


render_plotly = function(data){
  plot_ly(data = data, 
          x = ~ auxilio, 
          y = 0,
          hoverinfo = 'text',
          source = "juiz",
          text = ~ paste("Nome:",nome,
                         "\nSalario:",subsidio,
                         "\nTotal Em Auxilio:", auxilio))
}



## Render plotly temporal gera um gráfico em linhas considerando o meses que recebeu os auxilios.
render_plotly_temporal = function(juiz){
  juiz  %>%
    arrange(mes_ano_referencia) %>%
    plot_ly(y = ~ total,
            x = ~ mes_ano_referencia,
            type = "scatter",
            mode = 'lines',
            source = "temporal",
            text = ~ paste("\nSalario:",subsidio,
                           "\nValor do Auxilio:", total))
  
}