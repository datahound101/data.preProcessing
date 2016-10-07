rm(list=ls(all=TRUE))

#load data into R
data = read.csv("", header = T)
data = mtcars

#variable importance/ feature selection
#random forest method
library(randomForest)

mtcars.rf <- randomForest(mpg ~ ., data = mtcars, ntree = 1000,
                          keep.forest = FALSE, importance = TRUE)

#importance using random forest
importance(mtcars.rf, type=1)

#Correlation method
library(clusterGeneration)
library(mnormt)
library(corrplot)

#set the number of data points you want
n = 500

#create data to plot correlation
S = genPositiveDefMat("eigen", dim = 15)
S = genPositiveDefMat("unifcorrmat", dim = 15)
X = rmnorm(n, varcov = S$Sigma)

#plot correlation plot to visualize
corrplot(cor(X), order = "hclust")

#create our own data
data = data.frame(x = rnorm(10, 30, .2), y = runif(10, 3, 5))

#Normalized Data
data$x = (data$x - min(data$x))/(max(data$x) - min(data$x))

#another method
library(clusterSim)

#Normalization
norm_data <- data.Normalization(data, type = "n4", normalization = "column")

#standardization/Z-score
stand_data <- data.Normalization(data, type = "n1", normalization = "column")

#another method for standardization
scale_d <- data.frame(scale(data))

data$x_standard <- (data$x - mean(data$x))/sd(data$x)