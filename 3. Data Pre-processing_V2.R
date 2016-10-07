rm(list=ls(all=TRUE))

#set current working directory
setwd("")

#load data into R
data = read.csv("", header = T)
data = iris

#Missing Analysis
sum(is.na(data))

#Omit missing values
data = data[complete.cases(data),]

#Create missing value
data[5, 2] = NA #3.6

#Analyze missing values by varaible. You can omit variabl;e which have morethan 50% missing values
apply(data, 2, function(x)sum(is.na(x)))

#Store Values in data frame
MissingData = data.frame(varaibles = colnames(data), MissingInfo = apply(data,2,function(x)sum(is.na(x))))

#Let us start experiment
#Impute missing value with mean/median
data$Sepal.Width[is.na(data$Sepal.Width)] <- mean(data$Sepal.Width, na.rm = TRUE) #3.05
data$Sepal.Width[is.na(data$Sepal.Width)] <- median(data$Sepal.Width, na.rm = TRUE) #3

#KNN imputation
library(DMwR)
data <- knnImputation(data) #3.31  #actual value = 3.6

#Outlier Analysis
#let us use box plot to visualize outliers
df <- mtcars
boxplot(mpg ~ cyl, data = mtcars)

#use outlier package to detect outlier and remove
#only for numeric
library(outliers)
outlier(df$mpg, opposite=FALSE)

#Grubbs test for outliers
grubbs.test(df$mpg, type = 10) #type is for highest and lowest values, can use type = 10

#Identify the row and remove outlier
outlier_tf <- outlier(df$mpg, logical = T)
find_outlier <- which(outlier_tf == TRUE, arr.ind = TRUE)
data_new = df[-find_outlier,]

