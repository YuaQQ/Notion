------------------------------------------------
------------------------------------------------
#DEFINITIONS####
------------------------------------------------
------------------------------------------------
factor = anything not a number
numeric = number with decimal
integer = whole number
nominal data = categorical or discrete by category
continuous = number derived from measurement, number with decimal
ordinal = ranked data, discrete, relationships among category
covariate = continuous data in general linear model with factors (found in ANCOVA). explains variation without being of interest
count data = counts cant be 0 or decimal
test of variance = are the means different given the noise? P<0.05 YES
t distribtion = similar to normal, but shape changes with n
anova - analysis of variance, tests null that all means are same

------------------------------------------------
------------------------------------------------
#PLACEHOLDERS IN CODE####
------------------------------------------------
------------------------------------------------
var1 = first variable, usually predictor (eg. tail length)
var2 = second variable, usually response (eg. bodymass)
var3 = third variable, usually grouping (eg. site or sex)
cvar1 = covariate, for ancova
data = the dataset in use




------------------------------------------------
------------------------------------------------
#BASIC CODE####
------------------------------------------------
------------------------------------------------
#setting working directory
setwd("disk:/directory") #the folder containing your datafile
#check working directory
getwd()
#importing data
data<-read.table('dataset.csv',header=T,sep=',')
#subset data
datasubset<-subset(data,subset=data$var=='X')
#installing packages
install.packages("exact_package_name")
library(exact_package_name)




------------------------------------------------
------------------------------------------------
#BASIC FUNCTIONS, GRAPHS AND MATH####
------------------------------------------------
------------------------------------------------
str(data)
summary(data)
head(data)
tail(data)
mean(data) #mean
var(data) #variance
sd(data) #standard deviation
sd(data$var)/sqrt(length(data$var)) #standard error
---
#bootstrap vv
median.boot=apply(matrix(sample(data$var1,rep=TRUE,10^4*length(data$var1)),nrow=10^4),1,median)
quantile(median.boot,c(0.25,0.975)) #for 95% CI
---
#boxplots
boxplot(var1~var2,data=data)
boxplot(var1~var2, data=data,col=(c("col1","col2")),main="titlestuff",xlab="xlabel", ylab="ylabel")
boxplot(var1~var2*var3,data=data) #
boxplot(var1~var2*var3,notch=true,data=data) #notch dont overlap = diff in medians
---
#histograms - frequence of value in range
hist(data$var1)
---
#scatterplot - between two numerical values
attach(data)
plot(var1~var2)
abline(lm(var1~var2))
title("titlestuff")
detach(data)
---
#strucplot - for count data, uses vcd
install.packages("vcd")
library(vcd)
data.xtab<-xtabs(var1~var2+var3)
data.xtab
str(data.xtab)
summary(data.xtab)
plot(data.xtab)
#vcd options
strucplot(data.xtab,shade=T,main_gp=gpar(fontsize=5),sub_gp=gpar(fontsize=5))#main_gp,gpar,sub_gp do not change
#pink = fewer, blue = more
---
#bargraph - for something important maybe
install.packages("sciplot")
library(sciplot)
bargraph.CI(var1,var2,groupvar,legend=F,ylim=c(0,35),ylab="ylab",xlab="xlab")
---
#residuals
fit<-lm(var1~var2,data=data)
resid(fit)
hist(resid(fit), breaks=seq(-40,40,5))#sequence of numbers from -40 to 40 at 5 unit intervals
shapiro.test(resid(fit))
xv<-seq(-40,40,5)
hist.ht <- length(resid(fit))*5 # number of observations times bar width
yv <- dnorm(xv,mean=0.0,sd=sqrt(var(resid(fit))))*hist.ht#create normal distribution
lines(xv,yv)
plot(fit)
bartlett.test(var1~var2,data=data) # OK if P > 0.05
fligner.test(var1~var2,data=data) # OK if P > 0.05
#residual plot
attach(data)
plot(var1~var2, pch = 16, cex = 1.3, col = "black", main = "titlestuff", xlab = "xlab", ylab = "ylab")
abline(lm(var1~var2))
npoints<-length(var2)
npoints
fit.reg<-predict(lm(var1~var2))
for(k in 1: npoints) lines(c(var2[k],var2[k]),c(var1[k], fit.reg[k]))
---
#confidence interval
qnorm(c(0.025,0.975)) #Gives multiplier for 95% CIs
qnorm(c(0.005,0.995)) #Gives multiplier for 99% CIs





------------------------------------------------
------------------------------------------------
#TRANSFORMATIONS####
------------------------------------------------
------------------------------------------------

x<-data$var2 #data$response
 #basic
 #just search for'dummy variable' in prac manual
 #faster than listing them here

#advanced
---
#boxcox
install.packages("MASS")
libary(MASS)
fit<-lm(var1~var2,data=data)
bc<-boxcox(fit)
lambda<-with(bc, x[which.max(y)])
data$bc <- ((x^lambda)-1)/lambda
boxplot(bc ~ var1, data = data) #bc ~ treatment
---
#rank normal transformation
install.packages("GenABEL")
library(GenABEL)
data$RANK.NORMAL<-rntransform(data$var2) #data$response





------------------------------------------------
------------------------------------------------
#TESTING ASSUMPTIONS####
------------------------------------------------
------------------------------------------------
  
#normality
boxplot(var~var2,data=data) #look for normal dist and variance
shapiro.test(data) #shapiro wilkes, OK if P > 0.05
---
#variance
bartlett.test(var1~var2,data=data) #bartlett, OK if P > 0.05
fligner.test(var1~var2,data=data) #fligner, OK if P > 0.05
---
#assumptions for normality, linearity, etc. via plots
par(mfrow=c(2,2))
plot(data.test) 
#residuals vs fitted=random cloud
  #normal QQ=looks normal
    #scale-location=too far from line = outliers
      #residuals vs leverage=less than 0.5 cook distance



------------------------------------------------
------------------------------------------------
#EFFECT SIZES####
------------------------------------------------
------------------------------------------------

#effect sizes for t-tests
#= cohen's d, diff between 2 groups mean
install.packages("lsr")
library(lsr)
cohensD(var1~var2,data=data)

#effect sizes for ANOVAs
#= eta squared (??^2), variation by each factor
install.packages("lsr")
library(lsr)
data.aov<-aov(var1~var2*var3,data=data)
etaSquared(data.aov,type=1) #type = sum of squares, 1, 2 or 3



------------------------------------------------
------------------------------------------------
#BASIC STATISTICAL TESTS####
------------------------------------------------
------------------------------------------------
  
#CORRELATION
 #response and predictor are continuous
data<-read.table('data.csv',header=T,sep=',')
head(data)
str(data)
plot(data$var, data$var2, pch=16)
#calc variance
attach(data)
var(var1)
var(var2)
var(var,var2)
---
#testing normality via correlation. check n, see which is stronger
 #pearsons r for normal data
attach(data)
cor(var1,var2, method="pearson")
#or
cor.test(var1,var2,method="pearson")
#spearman for small (<30), non-normal data
cor.test(var1,var2,method="spearman")
#kendall for large (>30), non normal data
cor.test(var1,var2,method="kendall")



------------------------------------------------
#REGRESSION
 #basic y=a+bx, magnitude of one variable to another
 #diagnostic plots to test normality
par(mfrow=c(2,2))
plot(lm(formula = var1~var2, data=data))
#QQ plot that diverges from line = non-normal
#cooks distance >.05 = many outliers
regression.lm<-lm(var1~var2,data=data)
summary(regression.lm)



------------------------------------------------
------------------------------------------------
#ONE SAMPLE T-TEST
 #normal, independent
data<-read.table('data.csv',header=T,sep=',')
head(data)
str(data)
t.test(data$var1)

---
#TWO SAMPLE T-TEST
 #normal, independent, equal variance.
data<-read.table('data.csv',header=T,sep=',')
head(data)
str(data) #check if is factor, if not
data$var<-as.factor(data$var)
str(data) #check if is factor
#NOW CHECK FOR ASSUMPTIONS
shapiro.test(data) #shapiro wilkes, OK if P > 0.05
bartlett.test(var1~var2,data=data) #bartlett, OK if P > 0.05
fligner.test(var1~var2,data=data) #fligner, OK if P > 0.05

t.test(var1~var2, data=data, var.equal=T) #classic equal variance
t.test(var1~var2, data=data) #welch t test for unequal variance

---
#PAIRED T-TEST
 #normal, equal variance
t.test(data$var1,data$var2,paired=T)

------------------------------------------------
------------------------------------------------

#ANOVA
 #residuals are normal, resid are independent, resid equal variance
 #problems if correlate, overparameterised, covariates not normal/bounded
 #for formulas, search lab manual for 'wang'

#ONE WAY ANOVA
data.aov<-aov(var1~var2,data=data)
summary(data.aov)

#ONE WAY ANCOVA | 1 COVARIATE
data.aov<-aov(var1~var2+cvar1,data=data)
summary(data.aov)

#TWO WAY ANOVA
data.aov<-aov(var1~var2*var3,data=data)
summary(data)


------------------------------------------------
  
#Tukeys honest significant difference
 #req. equal variance, independent, testing effect of factor on response,
  #factor is significant, factor has 3 or more levels
data<-read.table('data.csv',header=T,sep=',')
boxplot(var~var2+var3,data=data) #assumptions
install.packages("car")
library(car)
qqPlot(lm(var1~var2*var3,data=data),simulate=TRUE)
bartlett.test(var1~var2*var3,data=data)
data.aov<-aov(var1~var2*var3,data=data)
outlierTest(data.aov) #car outliertest, P>0.05 = okay, NA=P=1
summary(data.aov)

TukeyHSD(data.aov, "var1/2/3")#var1 or var 2 or var3, analyze separately
plot(TukeyHSD(data.aov)) #data.aov can be var.aov or subset.aov


------------------------------------------------

#MANOVA (multivariate analysis)
 #multiple response against single treatment
 #assumptions = 
data<-read.table('data.csv',header=T,sep=',')
data$var1<-as.factor(data$var1)
str(data)
attach(data)
y<-cbind(var2,var3,var4,etc.)
aggregate(y,by=list(var1), FUN=mean)
cov(y)
#now for MANOVA
data.mlm<-manova(y~var1)
summary(data.mlm) #manova results
summary.aov(data.mlm) #univariate results


------------------------------------------------
------------------------------------------------
  #NON-PARAMETRIC TESTS####
------------------------------------------------
------------------------------------------------

#MANN-WHITNEY U TEST
 #non-parametric equivalent of t-test, tests medians are diff
 #assumptions = responses are ordinal (ie. can say what is larger)
            # = observations are independent
data<-read.table('data.csv',header=T,sep=',')
head(data)
str(data)
is.factor(data$var1) #is it a factor? if no...
data$var1<-as.factor(data$var1) #it is now
is.factor(data$var1) #double check

#actual test
wilcox.test(var1~var2, data=data)
---------------------------------
  
#WILCOXON SIGNED RANK TEST
 #non-parametric equivalent of paired t-test
 #assumptions = responses on the same scale (comparable)
 #            = must be independent
 #            = observations are paired
#import paired data
data<-read.table('paired.data.csv',header=T,sep=',')
str(data)

wilcox.test(data$var1, data$var2, paired=TRUE)
---------------------------------
  
#KRUSKAL-WALLIS TEST
  #non-parametric equivalent of ANOVA
  #assumptions = must be independnet
  #            = one predictor factor (but can have many levels)
data<-read.table('data.csv',header=T,sep=',')
str(data)

kruskal.test(var1~var2,data=data)
#cannot be var1+var2 or var1*var2, only allows one predictor variable

------------------------------------------------
------------------------------------------------
  #FREQUENCY ANALYSES (eg. chisq)####
------------------------------------------------
------------------------------------------------

#CHI SQUARED
  #for count data; =sum((observed/expected)^2/expected)
  #goodness of fit test
  #assumptions = categories are independent
  #            = less than 20% values <5
  
#NEVER use percentages or ratios, use actual data  
chisq.test(c(observed1,observed2))
#can also test observed comp to expected proportion
chisq.test(c(observed1,observed2), p=c(expected1,expected2))
#use ratios for p, must sum to 1.0 | eg. 0.3,0.7

#CHI SQUARED MATRIX
data.matrix<-matrix(c(count1a,count1b,count2a,count2b), nrow=2)
chisq.test(data.matrix) #uses yate's contingency
#or without correction (BETTER)
chisq.test(matrix(c(count1a,count1b,count2a,count2b),nrow=2),correct=F)
#eg          MALE      FEMALE
#PINK         23         45
#WHITE        34         67
#code would be    #flowers<-matrix(c(23,34,45,67))

#can test assumptions with $exp after code

-------------------------------------------------

#FISHER EXACT TEST
  #for count data, when chisq.test throws error for too low
  #assumptions = more than 20% values <5
  
data.matrix<-matrix(c(count1a,count1b,count2a,count2b), nrow=2)
fisher.test(data.matrix)

#if a balanced design, can make a contingency table
data.xtab<-xtabs(var1~var2,data=data)
data.xtab
chisq.test(data.xtab,correct=F)$exp  #check expected values
chisq.test(data.xtab,correct=F)
chisq.test(data.xtab,correct=F)$res  #checking residuals

#now you can strucplot
install.packages("vcd")
library(vcd)
strucplot(data.xtab,shade=T)
#if throws error due to 1 predictor, create residuals
RES<-chisq.test(data.xtab,correct=F)$res
strucplot(data.xtab,shade=T,residuals=RES)



#Let me know if I've stuffed up/missed anything important,
#I'm pretty confident that this is accurate, but I can't be 100% sure
#Good luck with the exam! Hope this helps