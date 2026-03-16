# Test for data distribution Normality in R.

# Quantile-quantile (QQ) plot for testing distribution Normality

- In a quantile-quantile (QQ) plot, if the distribution is Normal, the data points should follow a straight line.

- Use the following .csv file for the example coding

[skink.csv](Test%20for%20data%20distribution%20Normality%20in%20R/skink.csv)

```r
## The .csv file contain scatter points that may be used to generate a regression model. The residuals of the model can be tested for Normality.

# Import the data to R and check the structure:
skink <- read.table('skink.csv',header=T,sep=',')
str(skink)

# In R, the scatterplot is a default plot, and its command is simply 'plot'
attach(skink) # so you do not need to type 'skink$column' each time
plot(MASS.g~SVL.mm, 
     pch = 16,
     cex = 1.3,
     col = "black",
     main = "RESIDUALS OF SKINK MASS AND SVL",
     xlab = "SVL (mm)",
     ylab = "MASS(g)") # do the scatterplot

#Add a line of best fit using the linear model(lm) function
model <- lm(MASS.g~SVL.mm)
abline(model)

# Generate a set of points equal to the number of observations
npoints <- length(SVL.mm) 

# Create a regression model using the predict function
fit.reg <- predict(model) 

## Check residuals Normality with QQ plot
qqnorm(resid(model))
qqline(resid(model),lty=2)
plot(model)

```

![image.png](Test%20for%20data%20distribution%20Normality%20in%20R/image.png)