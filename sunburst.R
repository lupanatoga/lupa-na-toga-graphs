library("readr")
library("plotly")
library("sunburstR")


data = read_csv("data/remuneracao_magistrados.csv")
data[is.na(data)] = 0

custom.message = "function (d) {
root = d;
while (root.parent) {
root = root.parent
}
p = (100*d.value/root.value).toPrecision(3);
if(root.value >= 1000000000) {
y =   Math.round(root.value/1000000000) + 'B';
}
x = d.value
if(x  >= 1000000000) {
x =   Math.round(x/1000000000) + 'B';
}

if(x < 1000000000) {
x = Math.round(x/1000000) + 'M';
}


if(x < 1000000) {
x =  Math.round(x/1000) + 'K';
}
msg = p +' %<br/>'+x+' de '+ y;
return msg;
}"


render_sunburst = function(data) {
  d <- data.frame(group = c("Salarios","direitos_pessoais-abono_de_permanencia", "direitos_pessoais-subsidio_outra1", "indenizacoes-ajuda_de_custo","indenizacoes-indenizacoes_outros","direitos_eventuais-indenizacao_de_ferias","direitos_eventuais-abono_contitucional_de_1_3_de_ferias","direitos_eventuais-antecipacao_de_ferias","direitos_eventuais-gratificacao_natalina","direitos_eventuais-antecipacao_de_gratificacao_natalina","direitos_eventuais-substituicao","direitos_eventuais-gratificacao_por_exercicio_acumulativo","direitos_eventuais-gratificacao_por_encargo_curso_concurso","direitos_eventuais-pagamento_em_retroativos","direitos_eventuais-jeton", "indenizacoes-auxilio-auxilio_alimentacao", "indenizacoes-auxilio-auxilio_pre_escolar", "indenizacoes-auxilio-auxilio_saude", "indenizacoes-auxilio-auxilio_natalidade", "indenizacoes-auxilio-auxilio_moradia"),
                  value = c(sum(data$subsidio), sum(data$abono_de_permanencia), sum(data$subsidio_outra1),sum(data$ajuda_de_custo),sum(data$indenizacoes_outra1 + data$indenizacoes_outra2 + data$indenizacoes_outra3),sum(data$indenizacao_de_ferias),sum(data$abono_contitucional_de_1_3_de_ferias) ,sum(data$antecipacao_de_ferias) ,sum(data$gratificacao_natalina),sum(data$antecipacao_de_gratificacao_natalina),sum(data$substituicao),sum(data$gratificacao_por_exercicio_cumulativo),sum(data$gratificacao_por_encargo_curso_concurso),sum(data$pagamento_em_retroativos),sum(data$jeton),sum(data$auxilio_alimentacao),sum(data$auxilio_pre_escolar), sum(data$auxilio_saude), sum(data$auxilio_natalidade),sum(data$auxilio_moradia)))
  
  
  sunburst(d,count = TRUE,explanation = custom.message) 
}





render_sunburst(data)

