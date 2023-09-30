# Author: Alfredo Sánchez Alberca (asalber@ceu.es)

setwd("/media/alf/datos/drive/CEU/DOCENCIA/materiales/estadistica/presentaciones/manual_estadistica")
library(tikzDevice)

# Colors
blueceu <- rgb(5,161,230,255,maxColorValue = 255) #0099CC
blueceulight <- rgb(137,211,243,255,maxColorValue = 255) #89D3F3
redceu <- rgb(238,50,36,255,maxColorValue = 255) #FF3333
redceulight <- rgb(238,50,36,100,maxColorValue = 255) #FF3333
green <- rgb(0,205,0,255, maxColorValue = 255) #00CD00
greenlight <- rgb(0,205,0,100, maxColorValue = 255) #00CD00
greenceu <- rgb(194,205,255,255,maxColorValue = 255) #CCCC33
orangeceu <- rgb(248,131,121,255,maxColorValue = 255)#F88379
purpleceu <- rgb(169,78,145,255,maxColorValue = 255) #996699
greyceu <- rgb(117,117,97,255,maxColorValue = 255) #666666
grey <- gray(0.2)

options(tikzDefaultEngine = "pdftex")

# Global parameters
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))

#Distribución de probabilidad del número de hijos en una familia
tikz(file="img/estimacion/diagrama_barras_distribucion_poblacion.tex", width=5, height=4)
x = 0:2
y = c(0.25,0.5,0.25)
plot(x, y, ylim=c(0,0.55), xlab="Nº de hijos", ylab="Probabilidad", main="Distribución del número de hijos", type="h", lwd=10, col=blueceu, yaxs="i")
dev.off()


#Distribución de probabilidad de la media del número de hijos (muestras de tamaño 2)
tikz(file="img/estimacion/diagrama_barras_distribucion_media.tex", width=5, height=4)
x = 0:4*0.5
y = c(0.0625,0.25,0.375,0.25,0.0625)
plot(x, y, ylim=c(0,0.55), xlab=expression(bar(x)), ylab="Probabilidad", main="Distribución de $\\bar x$", type="h", lwd=10, col=blueceu, yaxs="i")
dev.off()


#Teorema central del límite
tikz(file="img/estimacion/teorema_central_limite.tex", width=4, height=3.5)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
x = seq(1, 3, length=150)
plot(x, dnorm(x, mean=2, sd=1/sqrt(100)), xlim=c(1,3), ylim=c(0,4.2), xlab="$\\bar x$", ylab="Densidad $f(x)$", main="Distribuciones de la media del nº de hijos", type="l", col=blueceu, yaxs="i")
lines(x, dnorm(x, mean=2, sd=1/sqrt(30)), type="l", col=redceu)
legend("topright", col=c(blueceu,redceu), legend=c("n=100","n=30"), lty="solid", bty="n") 
dev.off()


#Distribuciones de estimadores sesgados e insesgados
tikz(file="img/estimacion/estimadores_sesgados_insesgados.tex", width=4.5, height=3.3)
x = seq(-3.291, 3.291, length=100)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(x, dnorm(x, mean=0, sd=1), xlim=c(-4,4), ylim=c(0,0.42), xlab="Valores de los estimadores", ylab="Densidad $f(x)$", main="Distribuciones de estimadores sesgados e insesgados", type="l", col=blueceu, xaxt="n", yaxs="i")
lines(x-1, dnorm(x, mean=0, sd=1), type="l", lty="dashed", col=green)
lines(x+1, dnorm(x, mean=0, sd=1), type="l", lty="dashed", col=redceu)
abline(v=0,col="gray")
abline(v=-1,col="gray")
abline(v=1,col="gray")
axis(side=1,c(0),labels="$\\theta$")
legend("topright", col=c(blueceu, green, redceu), legend=c("Insesgado","Sesgo -","Sesgo +"), lty=c("solid","dashed","dashed"), bty="n") 
dev.off()


#Distribuciones de estimadores consistentes
tikz(file="img/estimacion/estimadores_consistentes.tex", width=4.5, height=3.3)
x = seq(-8, 8, length=150)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(x, dnorm(x, mean=0, sd=10/sqrt(10)), xlim=c(-8,8), ylim=c(0,0.42), xlab="Valores de los estimadores", ylab="Densidad $f(x)$", main="Distribuciones de estimadores consistentes", type="l", col=blueceu, xaxt="n", yaxs="i")
lines(x, dnorm(x, mean=0, sd=10/sqrt(50)), type="l", col=green)
lines(x, dnorm(x, mean=0, sd=10/sqrt(100)), type="l", col=redceu)
axis(side=1,c(0),labels="$\\theta$")
legend("topright", col=c(blueceu, green, redceu), legend=c("n=10","n=50","n=100"), lty="solid", bty="n") 
dev.off()


#Distribuciones de estimadores consistentes sesgados
tikz(file="img/estimacion/estimadores_consistentes_sesgados.tex", width=4.5, height=3.3)
x = seq(-8, 8, length=150)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(x, dnorm(x, mean=1, sd=10/sqrt(10)), xlim=c(-8,8), ylim=c(0,0.42), xlab="Valores de los estimadores", ylab="Densidad $f(x)$", main="Distribuciones de estimadores consistentes sesgados", type="l", col=blueceu, xaxt="n", yaxs="i")
lines(x, dnorm(x, mean=0.5, sd=10/sqrt(50)), type="l", col=green)
lines(x, dnorm(x, mean=0.1, sd=10/sqrt(100)), type="l", col=redceu)
axis(side=1,c(0),labels="$\\theta$")
legend("topright", col=c(blueceu, green, redceu), legend=c("n=10","n=50","n=100"), lty="solid", bty="n") 
dev.off()


#Distribuciones de estimador sesgado eficiente
tikz(file="img/estimacion/estimador_eficiente_sesgado.tex", width=4.5, height=3.3)
x = seq(-8, 8, length=150)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(x, dnorm(x, mean=0, sd=10/sqrt(10)), xlim=c(-8,8), ylim=c(0,0.42), xlab="Valores de los estimadores", ylab="Densidad $f(x)$", main="Distribuciones de estimadores insesgado y eficiente sesgado", type="l", col=blueceu, xaxt="n", yaxs="i")
lines(x, dnorm(x, mean=1, sd=10/sqrt(100)), type="l", col=redceu)
axis(side=1,c(0),labels="$\\theta$")
legend("topright", col=c(blueceu, redceu), legend=c("Insesgado","Eficiente"), lty="solid", bty="n") 
dev.off()


#Distribuciones de estimadores asintóticamente normales
tikz(file="img/estimacion/estimador_asintoticamente_normal.tex", width=4.5, height=3.3)
x = seq(0, 50, length=100)
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(x, dchisq(x, df=10), xlim=c(0,50), xlab="Valores de los estimadores", ylab="Densidad $f(x)$", main="Distribuciones de estimadores asintóticamente normales", type="l", col=blueceu, xaxt="n", yaxs="i")
lines(x, dchisq(x, df=20), col=green, type="l", lty=1)
lines(x, dnorm(x, mean=25, sd=sqrt(50)), col=redceu, type="l", lty=1)
legend("topright", col=c(blueceu, green, redceu), legend=c("n=10","n=50","n=100"), lty="solid", bty="n") 
axis(side=1,c(25), labels="$\\theta$")
dev.off()


#Cálculo de 100 intervalos de confianza del 95%
tikz(file="img/estimacion/100_intervalos_confianza.tex", width=4.5, height=3.3)
set.seed(1)
N <- 100
n <- 5
v <- matrix(c(0,0),nrow=2)
for (i in 1:N) {
  x <- rnorm(n)
  v <- cbind(v, t.test(x)$conf.int)
}
v <- v[,2:(N+1)]
par(cex.lab=1, mar=c(3,3,3,1),mgp=c(2,0.5,0))
plot(apply(v,2,mean), ylim=c(min(v),max(v)), ylab='Intervalo de confianza', xlab='Nº de muestra', pch=20, col=blueceu, yaxt="n")
abline(0,0)
c <- apply(v,2,min)>0 | apply(v,2,max)<0
segments(1:N,v[1,],1:N,v[2,], col=c("gray",'red')[c+1], lwd=2)
title(main=expression(paste("50 intervalos de confianza del 95% para ",theta)))
axis(side=2,0,labels="$\\theta$")
dev.off()


#Determinación de los extremos de un intervalo de confianza
x = seq(-3.48, 3.49, by=0.05)
y = dnorm(x,mean=0,sd=1)
tikz(file="img/estimacion/extremos_intervalos.tex", width=4.5, height=3.3)
par(cex.lab=1.2)
plot(x, y, xlab=expression(italic(X)), ylab=expression(paste("Densidad ",italic(f(x)))), main="Distribución del estimador de referencia", type="l", xaxt="n")
abline(h=0, col="gray")
polygon(c(x[1],x[1:33],x[33]), c(0,y[1:33],0), col="coral", lty=0)
lines (x, y, type="l")
text(-2.15,0.02,expression(alpha/2))
axis(side=1,x[33],labels=(expression(italic(l[i]))))
polygon(c(x[108],x[108:139],x[139]), c(0,y[108:139],0), col="coral", lty=0)
lines (x, y, type="l")
text(2.15,0.02,expression(alpha/2))
axis(side=1,x[108],labels=(expression(italic(l[s]))))
text(0,0.2,expression(1-alpha))
dev.copy2eps(file="img/estimacion/extremos_intervalos.eps", width=5, height=5, pointsize=10)
dev.off()


#Extremos del intervalo de confianza para la varianza
tikz(file="img/estimacion/extremos_intervalo_varianza_normal.tex", width=4.5, height=3.3)
x=seq(0,30,length=100) 
y=dchisq(x,df=9)
par(cex.lab=1.2)
plot(x, y, xlim=c(0,30), type="l", xlab=expression(chi^2), ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución de ",chi^2,(n-1))), xaxt="n", yaxt="n") 
abline(h=0,col="gray")
axis(side=1,c(0))
axis(side=2,c(0))
polygon(c(x[1],x[1:10],x[10]), c(0,y[1:10],0), col="coral", lty=0) 
lines (x, y, type="l")
text(2,0.003,expression(alpha/2))
axis(side=1,x[10],labels=(expression(italic(chi[alpha/2]^paste(n-1)))))
polygon(c(x[64],x[64:100],x[100]), c(0,y2[64:100],0), col="coral", lty=0) 
lines (x, y, type="l")
text(20,0.003,expression(alpha/2))
axis(side=1,x[64],labels=(expression(italic(chi[1-alpha/2]))))
text(9,0.03,expression(1-alpha))
dev.copy2eps(file="img/estimacion/extremos_intervalo_varianza_normal.eps", width=5, height=5, pointsize=10)
dev.off()


#Extremos del intervalo de confianza para la comparación de varianzas
tikz(file="img/estimacion/extremos_intervalo_comparacion_varianzas_normal.tex", width=4.5, height=3.3)
x=seq(0,5,length=150) 
y= df(x, df1=12, df2=10)
par(cex.lab=1.2)
plot(x, y, type="l", xlab=expression(F), ylab=expression(paste("Densidad ",italic(f(x)))), main=expression(paste("Distribución ",F,group("(",paste(n[1]-1,",",n[2]-1),")"))), xaxt="n", yaxt="n") 
abline(h=0,col="gray")
axis(side=1,c(0))
axis(side=2,c(0))
polygon(c(x[1],x[1:10],x[10]), c(0,y[1:10],0), col="coral", lty=0) 
lines (x, y, type="l")
text(0.2,0.015,expression(alpha/2))
axis(side=1,x[10],labels=(expression(italic(f[alpha/2]^paste(n[1]-1,",",n[2]-1)))))
polygon(c(x[109],x[109:150],x[150]), c(0,y[109:150],0), col="coral", lty=0) 
lines (x, y, type="l")
text(3.8,0.015,expression(alpha/2))
axis(side=1,x[109],labels=(expression(italic(f[1-alpha/2]^paste(n[1]-1,",",n[2]-1)))))
text(1.5,0.1,expression(1-alpha))
dev.copy2eps(file="img/estimacion/extremos_intervalo_comparacion_varianzas_normal.eps", width=5, height=5, pointsize=10)
dev.off()
