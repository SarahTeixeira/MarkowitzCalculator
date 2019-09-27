####################################################################################
#####                          Calculadora de Markowitz
#####     Projeto de  calculadora em R para realizar a otimizacao de portfolio 
##### seguindo o modelo de proposto por Markowitz em 1952, para isso usamos os 
##### dados de Petrobras(PETR4),ITAU (ITSA4) e o IBOVESPA (BOVA11).
##### Os dados foram importados em formato .csv do yahoo financas, e correspondem 
##### ao periodo de 26/09/2018 até 26/09/2019(diario).
#####     A modelagem se baseia em três pilares (MARKOWITZ, 1952): 
##### 1) retorno esperado para a carteira; 
##### 2) a proporção com que os ativos comporão a carteira; 
##### 3) a variância da carteira que representará o risco incorrido para a mesma.
#####
#####
#####     ~~Essa carteira hipotetica será criada usando-se 60% de PETR4 e 
##### 40% de ITSA4 e X% de BOVA11~~
#####     para esse calculo a funcao
#####  deve calcular:
#####     1- o rendimento diario de cada ativo;
#####     2- A media do rendimento de cada ativo;
#####     3- A variancia deste rendimento;
#####     4- A covariancia dos ativos;
#####     5- A correlação entre eles.
####################################################################################
library(IntroCompFinR)

#importa arquivos de dados Petrobras
PETR4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/PETR4.SA.csv",stringsAsFactors = F)
View(PETR4)
#importa arquivos Bovespa
IBOVESPA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/^BVSP.csv",stringsAsFactors = F)
View(IBOVESPA)
#Importa arquivos de ITSA4
ITSA4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/ITSA4.SA.csv",stringsAsFactors = F)
View(ITSA4)
#Importa o BOVA11
BOVA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/BOVA11.SA.csv",stringsAsFactors = F)
View(BOVA)
BOVA
#funcao para calcular o retorno diario
Retornos= function(Abertura,Fechamento){#nao precisei do for
  rendimento_dia<-Fechamento-Abertura
  return(rendimento_dia)
}

#calcula os rendimentos
##BOVA,PETR4,ITSA4 são dataframes por isso os dados de abertura e fechamento
## acabaram se tornando factors
## em BOVA11 temos duas ocorrencias de dias registradas como null
## vou trata-las
retorno_BOV<-Retornos(as.numeric(BOVA$Open),as.numeric(BOVA$Close))
retorno_BOV
retorno_PETR4<-Retornos(PETR4$Open,PETR4$Close)
retorno_ITSA4<-Retornos(ITSA4$Open,ITSA4$Close)
retornos_total<-cbind(retorno_BOV,retorno_PETR4,retorno_ITSA4)
retornos_total
#Matriz de Medias
rend_medio_BOV<-mean(retorno_BOV)
rend_medio_PETR4<-mean(retorno_PETR4)
rend_medio_ITSA<-mean(retorno_ITSA4)
rendimento_medio<-rbind(rend_medio_BOV,rend_medio_PETR4,rend_medio_ITSA)
rendimento_medio
#Matriz das variancias
Var_BOV<-var(retorno_BOV)
Var_PETR4<-var(retorno_PETR4)
Var_ITSA<-var(retorno_ITSA4)
Variancias<-rbind(Var_BOV,Var_PETR4,Var_ITSA)
Variancias
#Matriz de Covariancias
CoVariancias<-cov(retornos_total)
CoVariancias
#Matriz de Correlações
Correlacao<-cor(CoVariancias)
Correlacao
#Graficos para visulizar a saídas

