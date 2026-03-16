# Structure plot

Function: Used to look at count data.
Select: Exploratory

# Structure plot requires the package “vcr”

- Load the the package before graphing.

# R code for scatterplot (example)

- Use the following .csv file for the example coding

[skink.csv](Structure%20plot/skink.csv)

```r
# Import the data to R and check the structure:
skink <- read.table('skink.csv',header=T,sep=',')
str(skink)

# Load the package 'vcr' for structure plot
install.packages("vcd") # Needed if you have not downloaded the package to your device yet
library(vcd) # Load the the downloaded package

# Change the data into a form that the structure plot can read
parasites.xtab<-xtabs(PARASITES~SEX+SITE,data=skink)

# Take a look at the new object 'parasites.xtab'
parasites.xtab
str(parasites.xtab) # Look at the structure
summary(parasites.xtab) # Get a summary of the object
plot(parasites.xtab) # default structure plot

# Create a structure plot usig the vcd plotting options
strucplot(parasites.xtab,
shade=T,
main_gp = gpar(fontsize = 5),
sub_gp = gpar(fontsize = 5))
```

# The Graph Generated

- Structure plots default to color. This is one of the few examples where a color graph would be acceptable in a report since the colors are essential for understanding the plot.
    - **PINK = Fewer than expected.**
    - **BLUE = More than expected.**

![image.png](Structure%20plot/cf204eac-7b5a-43ed-baff-2d3695e2df7d.png)