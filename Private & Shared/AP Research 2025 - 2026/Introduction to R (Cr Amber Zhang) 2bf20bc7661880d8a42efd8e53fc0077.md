# Introduction to R (Cr. Amber Zhang)

# What is R?

---

- A programming language like Python, JavaScript, C++, etc.
- An interpreted language, not a compiled one
- Typically used for **statistical analysis** and **graphing** of these statistics, making it especially useful for biology and bioinformatics.
    - E.g.
        - Genomic data analysis (DNA RNA sequences…)
        - Microbe analysis (microbiota diversity…)
        - Ecology (population dynamics…)
        - Clinical Trials
- Also applicable for economics, chemistry, machine learning, and anything using statistics.

# When do we choose R?

- Choose **R** when there is large amount of statistical analysis and data visualization (faster)
- Choose **Python** for modelling and more complex and creative algorithms (general-purpose language)

# How to install [R](https://cloud.r-project.org/) on your computer

---

## Software Download

1. [Download **R**](https://cloud.r-project.org/) (the language). 
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image.png)
    
    ![1764820942173.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/1764820942173.png)
    

1. [Download **RStudio**](https://posit.co/download/rstudio-desktop/) (the integrated development environment for computation). This is the software to be run each time you type R commands.
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%201.png)
    
    ![1764821192528.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/1764821192528.png)
    

# Programming with [RStudio](https://posit.co/download/rstudio-desktop/)

---

- Below is the interface of RStudio.
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%202.png)
    

### Basic Concepts

1. Types of data (Mode) in R 
- **Numeric**: Numbers. Double and Integer types in other languages can all be expressed turned into numeric
- **Character**: Like String. Words, numbers, or other characters in `“ ”`
- **Complex**: `a + bi` Imaginary numbers
- Logical: Like Boolean. `True` or `False`

1. Simple data types
    
    
    | Object | Several possible modes in the same object |
    | --- | --- |
    | vector | no |
    | factor | no |
    | array | no |
    | matrix | no |
    | data frame | yes |
    | ts | no |
    | list | yes |

### Step 1: Set working directory

1. Use `getwd()` to get the current working directory.
2. If you want to change the working directory, use `setwd()` . The working directory containing your dataset is always recommended.
    
    E.g. `setwd("C:/Users/Documents")` 
    

### Step 2: Installing packages to execute certain commands

- Download packages related to the processing of your data. Commands are shown below.
    - Installing packages: `install.packages("exact_package_name")`
    - Loading the downloaded package for use: `library(exact_package_name)`
    - E.g.
        - The most commonly used umbrella package: **`tidyverse`**
            - Includes `dplyr` for data manipulation, `ggplot2` for plotting graphs, and `readr` for data import.
            - Code for installation:
            - 
            
            ```r
            install.packages("tidyverse") # Run only when the package is not installed yet
            library(tidyverse) # Run each time when using its functions
            ```
            

### Step 3: Importing data from working directory

1. Import data from files. 
2. A new object of the imported file will be created.
3. Use `read.table()` function. For example: `read.table (“Documents/data.csv”, header = True, sep = ',')` → variables are created
    - Note: data file in R is usually saved in the .csv format. You may Open an Excel file and use the **Save As…** function to save it as a comma delineated .csv file.

### Step 4: Checking your data

After assigning the values from the imported dataset into an object called x: 

`x <- read.table('data.csv',header = T, sep = ',')`

![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%203.png)

- Look at the first or last six rows of the dataset: `head(x)`; `tail(x)`
- Look at all the data in the dataset: `x`
- Look at just one column (e.g. SITE) of the dataset: `x$SITE`
- Look at another column (e.g. MASS.g) of the dataset: `x$MASS.g`
- Get a summary of the dataset: `summary(x)`
- Check whether data in a column (e.g. MASS.g) is numeric: `is.numeric(x$MASS.g)`
- Check the compact structure of the dataset: `str(x)`
- We can also extract a subset containing data under variable AAA column from the data table by: `datasubset<-subset(x,subset=a$var=='AAA')`

### Step 5: Assigning a value to an object

- **Objects** carry data. Declare and assign value to an object with this arrow sign: `<-`  (a less than sign and a hyphen). `x <- 1` and `1 -> x` are both fine. You can as well do `z <- x`.
- Show things in the console using this command: `print()`
    - If you put the object name in the parenthesis, the value of the object will be printed
    - If you put a string in the parenthesis like this: `print(“x”)`, then `x` will be printed.
        
        ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%204.png)
        
- All objects you created will be shown here.
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%205.png)
    
- The `ls()` command prints out the name of the objects. Here, `ls` will print `x` `y` `z`
- `ls()` can also select objects with certain names using the pat (pattern) command: `ls(pat = “x”)` prints only `x`.
- Objects can also be removed using the `rm()` function. `rm(x, y)` removes the objects `x` and `y` .
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%206.png)
    

### Step 6: Computing functions for data analysis

- Check the “[Which statistical test to use for data analysis?](Which%20statistical%20test%20to%20use%20for%20data%20analysis%202be20bc7661880508271f36e5b23f2f6.md)” page for the commonly used statistical tests that may be applicable to your data. The commands for the functions are provided below in the annotated R script.
    
    [pracexam.R](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/pracexam.r)
    

### 

# Getting help when using R

- `Help()` function
    - Put any command you want to know about into the parenthesis
    - The “Help” window would show information about what parameters to use and what the function does
    
    ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%207.png)
    
- If you don’t know how to do something with R and also don’t know the name of the command:
    - [Quick-R](https://www.statmethods.net/about/learningcurve.html) (By data camp)
        
        ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%208.png)
        
        ![image.png](Introduction%20to%20R%20(Cr%20Amber%20Zhang)/image%209.png)
        
    - [Stack Exchange](https://stackexchange.com/)