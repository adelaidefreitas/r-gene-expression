#****************************************************************************
# Workshop "Exploração gráfica de dados de expressão genética usando R:
#           uma introdução" 
#
####### Adelaide Freitas  (adelaide@ua.pt)          
#
#  XVIII ENEEB - Encontro Nacional de Estudantes de Engenharia Biomédica, 
#   23-26/fevereiro/2023
#   Universidade de Aveiro
#******************************************************************************


###############################################################################
# EXERCICIO 1
# ------------------------------------------
# Comandos R:
# ------------------------------------------
par(mfrow=c(1,3))
set.seed(1234);x1=rnorm(400,30,10)
mean(x1);sd(x1); max(x1)-min(x1)
set.seed(1234);x2.1=rnorm(150, 10, 5)
set.seed(1234);x2.2=rnorm(250,10,15)
x2=c(x2.1,x2.2)
dados1=cbind(sort(x1),x2)
plot(dados1, col="navy", pch=19, main="Amostra de valores x1,x2",xlab="x1",ylab="x2",cex.lab=1.5)
abline(v=26,col="red")
mean(x2);sd(x2);max(x2)-min(x2)
d1=dados1[1:150,2]
mean(d1);sd(d1);max(d1)-min(d1)
d2=dados1[151:400,2]
mean(d2);sd(d2);max(d2)-min(d2)

set.seed(1234);x4=rnorm(400,2,1)
set.seed(1234);x2=3*sort(x4) + rnorm(400,5,2)
dados2=cbind(sort(x1),x2)
plot(dados2, col="blue", pch=19, main="Amostra de valores x1,x3",xlab="x1",ylab="x3",cex.lab=1.5);abline(v=26,col="red")
mean(x2);sd(x2);max(x2)-min(x2)
d1=dados2[1:150,2]
mean(d1);sd(d1);max(d1)-min(d1)
d2=dados2[151:400,2]
mean(d2);sd(d2);max(d2)-min(d2)

set.seed(1234);x2= rnorm(400,10,10)
dados3=cbind(sort(x1),x2)
plot(dados3, col="cadetblue", pch=19, main="Amostra de valores x1,x4",xlab="x1",ylab="x4",cex.lab=1.5);abline(v=26,col="red")
mean(x2);sd(x2);max(x2)-min(x2)
d1=dados3[1:150,2]
mean(d1);sd(d1);max(d1)-min(d1)
d2=dados3[151:400,2]
mean(d2);sd(d2);max(d2)-min(d2)


###############################################################################
# EXERCICIO 2
# ------------------------------------------
# Comandos R:
# ------------------------------------------

#Leitura dos dados :
#Várias formas...
#Usando o import
#
#Usando o read.table
#setwd("D:\\Aulas\\...")
dadosA=read.table("Aveiro.txt", sep="\t", header=TRUE)
   #Ver a estrutura dos dados
str(dadosA) 	# A primeira coluna é um identificador da amostra e não uma vari?vel!

# EXERCÍCIO 2.1
# Interpretar o resultado da seguinte sequência de comandos
dadosA= data.frame(t(dadosA))
Min.m=sapply (dadosA[2:5,], min)
Min.f=sapply (dadosA[c(6,7),], min)
plot(Min.m,Min.f, pch=19, col="blue", xlab="min (male)", ylab="min (female)")
#RESPOSTA: 
# 

# EXERCÍCIO 2.2
#RESPOSTA: 	

# NOTA: comandos usados para a construção do gráfico que aparece no enunciado:
      which.max(Min.m)
      which.max(Min.m[-1])
      # Retirar as variaveis X1 e X2 e repetir o grafico anterior
			mm=sapply (dadosA[2:5,-c(1,2)], min)
			mf=sapply (dadosA[c(6,7),-c(1,2)], min)
			plot(mm,mf, pch=19, col="blue", xlab="min (male)", ylab="min (female)")

# EXERCÍCIO 2.3
# RESPOSTA:
# Conjetura ...
			#comandos usados para construir o gráfico apresentado
			dadosA=dadosA[,-c(1,2)]
			mm=sapply (dadosA[2:5,], mean)
			mf=sapply (dadosA[c(6,7),], mean)
			plot(mm,mf, pch=19, col="blue", xlab="mean (male)", ylab="mean (female)")
			abline(0,1, col="red", lwd=2, lty=2)


###############################################################################
# EXERCICIO 3
# ------------------------------------------
# Comandos R:  
# ------------------------------------------

   	# Instalar a biblioteca "plsgenomics" e chamá-la seguidamente:
		library(plsgenomics)

#Leitura dos dados:
data(leukemia)
#Ver a estrutura dos dados
?leukemia
str(leukemia)  

# EXERCÍCIO 3.1
table(leukemia$Y)
#RESPOSTA: 

# EXERCÍCIO 3.2
# comando sugerido no enunciado: 
heatmap(leukemia$X,Rowv=NA, Colv=NA, main="leukemia data")
#RESPOSTA: 
