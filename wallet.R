####################################################################################
#####                          Calculadora de Markowitz
#####     Projeto de  calculadora em R para realizar a otimizacao de portfolio 
##### seguindo o modelo de proposto por Markowitz em 1952, para isso usamos os 
##### dados de Petrobras(PETR4), e o indice bovespa (BOVA11).
##### Os dados foram importados em formato .csv do yahoo financas, e correspondem 
##### ao periodo de 26/09/2018 até 26/09/2019(diario).
#####     A modelagem se baseia em três pilares (MARKOWITZ, 1952): 
##### 1) retorno esperado para a carteira; 
##### 2) a proporção com que os ativos comporão a carteira; 
##### 3) a variância da carteira que representará o risco incorrido para a mesma
#####     para esse calculo a funcao
#####  deve calcular:
#####     1- o rendimento diario de cada ativo;
#####     2- A media do rendimento de cada ativo;
#####     3- A variancia deste rendimento;
#####     4- A covariancia dos ativos;
#####     5- A correlação entre eles.
####################################################################################

#importa arquivos de dados Petrobras
PETR4.SA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/PETR4.SA.csv")
View(PETR4.SA)
#importa arquivos Bovespa
BVSPA <- read.csv("C:/Users/pedro/RStudioProjects/Markowitz/Markowitz_wallet/^BVSP.csv")
View(BVSPA)
