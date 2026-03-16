# Which statistical test to use for data analysis?

# Flow Diagram for Deciding which Test to Use 一图速查！

![image.png](Which%20statistical%20test%20to%20use%20for%20data%20analysis/image.png)

# Assumptions for statistical analyses

- An **assumption** is a requirement that the data must satisfy for the test to be valid.
- Assumptions vary among tests; but most frequently encountered assumptions are:
    - **Independence**
        - The samples must be independent of one another (What happens in one sample should not affect what happens in another sample). This needs to be considered during the design phase
    - **Normality**
        - The data and variances of the data should be (reasonably) Normally distributed.
        
        [Test for data distribution Normality in R.](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Test%20for%20data%20distribution%20Normality%20in%20R%202c320bc766188056935debc53cf4fa4c.md)
        
    - **Homogeneity** and **Homoscedasticity of variance**
        - Are the variances of groups (reasonably) similar?
        - In particular, there will be problems if the variance is larger in groups with larger means.
        - This can be tested in R.
    - **Linearity**
        - In analyses of **continuous** data, such as in a regression analysis, linearity of the continuous data is important (i.e. the response data should not plot a curve against the explanatory data).
        - This can be tested in R.
    - **No correlation of predictors**
        - Explanatory or predictor variables cannot correlate.
        - Multicolinearity is when predictors co-occur or co-correlate.
            - E.g. Most smokers carry cigarettes and a lighter. Using both 'cigarette carrying' and 'lighter carrying' as predictors is invalid because they are correlating and 'explain' the same thing: the behavior of smoking.
- What do we do if assumptions are not met:  Try to transform the response variable
    - If none of the transformed values seem to fit the assumptions of a statistical test, then possibly you are using the wrong test.
    
    ```r
    # 1st step: Create a dummy variable x,  paste the RESPONSE into it
    x <- yourdata$RESPONSE
    
    # 2nd step: apply the transformations
    yourdata$INVR <- 1/x # Reciprocal transformation
    yourdata$NEGINV <- -1/x # Negative reciprocal transformation
    yourdata$SQUARED <- x^2 # Power transformation
    yourdata$CUBERT <- x^(1/3) # Cube root transformation
    yourdata$SQRT <- sqrt(x) # Square root transformation
    yourdata$LOG <- log(x) # Log base e. Cannot be applied to zero
    yourdata$LOG10 <- log10(x) # Log base 10 Cannot be applied to zero
    yourdata$ASQRT <- asin(sqrt(x)) # Arcsine square root transformation.
    # Only useful for percentages (0.01-0.99)
    yourdata$LOGIT <- log(x/(1-x)) # Logit transformation.
    # Only useful for percentages (0.01-0.99)
    yourdata$FOLD1 <- sqrt(x)/sqrt(1-x) # Square root folded transformation.
    # Only useful for percentages (0.01-0.99)
    yourdata$FOLD2 <- log(x)/log(1-x) # Log folded transformation.
    # Only useful for percentages (0.01-0.99)
    messy$FT <- sqrt(x) + sqrt(x+1) # Freeman-Tukey transformation
    
    # 3rd step: Look at your dataset:
    head(yourdata)
    View(yourdata)
    str(youdata)
    ```
    

# Distribution of data

[Normal Distribution](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Normal%20Distribution%202c320bc76618800da82ae50e37f190a2.md)

[Binomial Distribution](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Binomial%20Distribution%202c320bc7661880dbb887e61e0c21d79c.md)

[Poisson Distribution](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Poisson%20Distribution%202c320bc766188048ab11c20a29408056.md)

# Types of variables

### Categorical variables

[Nominal variable](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Nominal%20variable%202c320bc7661880c5878becdc60d81b93.md)

[Ordinal variable](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Ordinal%20variable%202c320bc766188034978cfac9c649286a.md)

### Numerical variables

[Continuous variable](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Continuous%20variable%202c320bc7661880b9a90ff829067c71f3.md)

[Interval variable](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Interval%20variable%202c320bc7661880d7b575cb29395f26ee.md)

[Covariate](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Covariate%202c320bc766188013a0f8f04061c08d8f.md)

[Statistical Tests](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Statistical%20Tests%202c320bc7661880388226f465f9317ef7.csv)

[Graphics (and their R codes)](Which%20statistical%20test%20to%20use%20for%20data%20analysis/Graphics%20(and%20their%20R%20codes)%202c020bc7661880ebb57ad67dc8c6e085.csv)