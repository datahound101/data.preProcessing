#remove all the objects stored
rm(list=ls())

#set current working directory
setwd("~/R Programming/Practice/2. Predictive Analytics/R Code/")

#Create vector
vec = c(2,3,4,5)

#Create list
lis = list(4,5,6,7)

# Create a matrix
sample_matrix = matrix(1:9, byrow = T, nrow = 3) # This inserts elements by rows
sample_matrix
matrix(1:10, byrow = F, ncol = 2) # This inserts elements by columns

# Naming a matrix
colnames(sample_matrix) = c("One","Two","Three")

#transpose matrix
t(sample_matrix)

#Find rowsums of a matrix
rowSums(sample_matrix)
colSums(sample_matrix)

# Arithmetic with matrices
sample_matrix*10
sample_matrix/10

#Let us learn how to create data frame
df = data.frame(age = c(2, 3, 4, 5), Gender = c("M", "F", "F", "M"))

#Rename varaible
names(df)[2] = "Gen"

#convert vector into dataframes
df = as.data.frame(vec) 

#Selecting variables from the dataset and making a new dataset
NewData = subset(data, select = c("mpg","cyl","hp"))

#selecting the rows with condition
data_rowLevel = data[which(data$mpg == 21.4),]

#Creating new variable
data$LogMPG = with(data, log(mpg))

# Adding rows of two data frame
d1 = data.frame(a = c(3,4,5,6), b = c(4,5,6,6)) #Let us create two data frame to merge
d2 = data.frame(a = c(5,6,7,8), b = c(4,5,7,8))

d3 = rbind(d1,d2)

#Adding columns 
x = rnorm(10)
y = rnorm(10)
d6 = cbind(x,y)

#Data types
data = mtcars

#convert each varaible
data$cyl = as.factor(data$cyl)
data$vs = as.factor(data$vs)

#Convert n number of variables at a time
for(i in c(2,8:11)){
  data[,i] = as.factor(data[,i])
}

#Convert numeric to categorical/binning
data$mpgcat[data$mpg >= 10 & data$mpg <= 16] = "Low"
data$mpgcat[data$mpg > 16 & data$mpg <= 20] = "Medium"
data$mpgcat[data$mpg > 20] = "High"

#Convert categorical into numeric
voice = c(rep("meow", 30), rep("Hiss", 30), rep("Purr", 40))
voice_factor = factor(voice, labels=(1:length(levels(factor(voice)))))
voice_numeric = as.numeric(voice_factor)

#Sorting in ascending order
data = data[order(data$cyl, data$gear),]

#Sorting in descending order
data = data[order(-data$cyl, data$gear),]

#Merging Two dataframes
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))
MergedData = merge(df1, df2, by = "CustomerId")

#Joins
LeftJoin = merge(df1, df2, by = "CustomerId", all.x = TRUE) #vlookup
RightJoin = merge(df1, df2, by = "CustomerId", all.y = TRUE)
CrossJoin = merge(df1, df2, by = NULL)

#Aggregating
data = mtcars
aggregate(data, by = list(data$cyl), median)
aggregate(data, by = list(data$cyl, data$vs), mean)
aggregate(data, by = list(data$cyl), var)

#Gives the observation which have cyl value 6
grep(6, data$cyl)
grep(14.3, data$mpg)

#Repalcing one/multiple characters by other
text="I/work/in/valuelabs"
gsub("/", " ", text)

x <- c("This is a sentence about axis",
       "A second pattern is also listed here")

sub("is", "XY", x)
gsub("is", "XY", x)

#remove column by its name
data$mpg = NULL

#convert row.names into a column
data = cbind(rownames(data), data)
rownames(data) = NULL
colnames(data)[1] = "CarNames"
