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
PETR4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/PETR4.SA.csv", stringsAsFactors=FALSE)
#View(PETR4)
#Importa arquivos de ITSA4
ITSA4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/ITSA4.SA.csv", stringsAsFactors=FALSE)
#View(ITSA4)
#importa dados magazineluiza
MGLU3 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/MGLU3.SA.csv", stringsAsFactors=FALSE)
#View(MGLU3)
#Importa o BOVA11, para mais tarde tratar as excecoes
BOVA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/BOVA11.SA.csv",stringsAsFactors = F)
#View(BOVA)
#Importa dados Bradesco
BBDC4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/BBDC4.SA.csv", stringsAsFactors=FALSE)
#Importa dados Fleury
FLRY3 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/FLRY3.SA.csv", stringsAsFactors=FALSE)
#Importa dados Banco do Brasil
BBSA4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/BBAS3.SA.csv", stringsAsFactors=FALSE)
#Importa dados Azul linhas aéreas
AZUL4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/AZUL4.SA.csv", stringsAsFactors=FALSE)
#Importa dados
MERV <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/MERV.csv", stringsAsFactors=FALSE)
#Importa dados Via Varejo (Vivara)
VVAR3 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/VVAR3.SA.csv", stringsAsFactors=FALSE)
#Importa dados MDIAS Branco
MDIA3 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/MDIA3.SA.csv", stringsAsFactors=FALSE)

#nomes para facilitar a leitura
nomes<-c("PETROBRAS","ITAU","MAGALU","BRADESCO","FLEURY","BB","AZUL","VIVARA","MDIAS")

#funcao para calcular o retorno diario
Retornos= function(Abertura,Fechamento){
  #Não é necessario o uso do for aqui
  rendimento_dia<-Fechamento-Abertura
  return(rendimento_dia)
}


##BOVA,PETR4,ITSA4 são dataframes por isso os dados de abertura e fechamento
## acabaram se tornando factors
## em BOVA11 temos duas ocorrencias de dias registradas como null
## vou trata-las
#retorno_BOV<-Retornos(as.numeric(BOVA$Open),as.numeric(BOVA$Close))
#retorno_BOV
retorno_PETR4<-Retornos(PETR4$Open,PETR4$Close)
retorno_ITSA4<-Retornos(ITSA4$Open,ITSA4$Close)
retorno_MGLU3<-Retornos(MGLU3$Open,MGLU3$Close)
retorno_BRAD4<-Retornos(BBDC4$Open,BBDC4$Close)
retorno_FLRY3<-Retornos(FLRY3$Open,FLRY3$Close)
retorno_BBSA4<-Retornos(BBSA4$Open,BBSA4$Close)
retorno_AZUL4<-Retornos(AZUL4$Open,AZUL4$Close)
retorno_VVAR3<-Retornos(VVAR3$Open,VVAR3$Close)
retorno_MDIA3<-Retornos(MDIA3$Open,MDIA3$Close)

retornos_total<-cbind(retorno_PETR4,retorno_ITSA4,retorno_MGLU3,retorno_BRAD4,
                      retorno_FLRY3,retorno_BBSA4,retorno_AZUL4,retorno_VVAR3,
                      retorno_MDIA3)
colnames(retornos_total)<-nomes 
retornos_total


#Matriz de Medias
rendimento_medio<-rbind(mean(retornos_total[,1]),mean(retornos_total[,2]),
                        mean(retornos_total[,3]),mean(retornos_total[,4]),mean(retornos_total[,5]),
                        mean(retornos_total[,6]),mean(retornos_total[,7]),mean(retornos_total[,8]),
                        mean(retornos_total[,9]))
rownames(rendimento_medio)<-nomes
rendimento_medio


#Matriz das variancias
Variancias<-rbind(var(retornos_total[,1]),var(retornos_total[,2]),
                  var(retornos_total[,3]),var(retornos_total[,4]),var(retornos_total[,5])
                  ,var(retornos_total[,6]),var(retornos_total[,7]),var(retornos_total[,8])
                  ,var(retornos_total[,9]))
rownames(Variancias)<-nomes
Variancias

#Matriz de Covariancias
CoVariancias<-cov(retornos_total)
CoVariancias
#Matriz de Correlações
Correlacao<-cor(CoVariancias)
Correlacao
#Graficos para visulizar a saídas

