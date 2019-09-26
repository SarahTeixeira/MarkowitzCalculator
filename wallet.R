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

#importa arquivos de dados Petrobras
PETR4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/PETR4.SA.csv")
View(PETR4)
#importa arquivos Bovespa
BVSPA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/^BVSP.csv")
View(BVSPA)
#Importa arquivos de ITSA4
ITSA4 <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/Projeto/ITSA4.SA.csv")
View(ITSA4)
#funcao para calcular o rendimento diario
Rendimento= function(Abertura,Fechamento){
  rendimento_dia<-Fechamento-Abertura
  rendimento_medio=mean(rendimento_dia)
  return(rendimento_medio)
}
length(BVSPA[,2])
#calcula os rendimentos
rendimento_BOV<-Rendimento(BVSPA[,2],BVSPA[,5])
rendimento_PETR4<- Rendimento(PETR4[,2],PETR4[,5])
rendimento_ITSA <- Rendimento(ISTA4[,2],ITSA4[,5])



