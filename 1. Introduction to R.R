#remove all the objects stored
rm(list=ls())

#set current working directory
setwd("~/R Programming/Practice/2. Predictive Analytics/R Code/")

#Current working directory
getwd()

#instaling packages
install.packages("sqldf")

#Install multiple packages at a time
install.packages(c("dplyr","plyr","reshape","ggplot2","data.table"))

##Load data in R
#reading CSV
data = read.csv("MissingInfo-V2.csv", header = T) 

#reading Excel sheet
library(xlsx)
data_excel = read.xlsx("MissingInfo-V2.xlsx", sheetIndex = 1)

#reading .txt file as dataframe
data_text = read.delim("MissingInfo-V2.txt", sep = "\t", header = T) 

#We are considering mtcars dataset to understand R commands
data = mtcars
 
#Getting the column names of the dataset
names(data)

#Getting the structure of the dataset
str(data)

#Getting the number of variables and obervation in the datasets
dim(data)

#Getting first 10 rows of the dataset
head(data, 10)

#Getting the last 10 rows of the dataset
tail(data, 10)

#Getting first 10 rows of the dataset
data[1:5,1:5]

#Getting first 6 columns of the dataset
data[, 1:6]

#Getting first 10 rows and 4 colums
data[1:10, 1:4]

#variable type
class(data)

#Unique values in a column
unique(data$gear)

#Count of unique values in a column
length(unique(data$gear))

#Distribution of unique values in a column
table(data$gear)

#Summary of a varaible 
summary(data$mpg)

#Assignment operators
df = 2 #storing numeric value
df1 = "I love India" #storing characters


#Logical operations
df == 2

#Print object
print(df)

#Arithematic operations
#An addition
5 + 5 

#A subtraction
5 - 5 

#A multiplication
3 * 5

#A division
(14)/2 

#Exponentiation
5^2

#Modulo
7%%2

#Mean
mean(data$mpg)

#Median
median(data$mpg)

#Standard deviation
sd(data$mpg)

#Variance of the column
var(data$mpg)

#Add all the values of column
sum(data$mpg)

# Writing a csv
write.csv(data, "data_mtcars.csv", row.names = F)

# Writing a xlsx file
write.xlsx(data, "data.xlsx", row.names=F)

