#Import data in R
data <- read.csv(file.choose(), header = TRUE, sep = ",")

install.packages("randomForest")
library(randomForest)

#Define the data frame
df =data.frame(data)

#Building and Applying the Model
#set random seed
set.seed(1230)

attach(df)

#Partition the data into training and testing 
train=sample (1:nrow(df), 7000) 

#Define the test frame
df.test=df[-train,]

TARGET_B.test=TARGET_B[-train] 


#Build Random Forest (By default, randomForest() uses p/3 variables when 
#building a random forest of regression trees, and square root(p) variables when building 
#a random forest of classi?cation trees)

rf <- randomForest(factor(TARGET_B)~.,data=df,subset = train, n.trees=100,interaction.depth=4, importance = T)

tree.pred=predict(rf,df.test,type="class") 
table(tree.pred,TARGET_B.test) #confusion matrix

#Using the importance() function, we can view the importance of each variable
importance (rf) 

varImpPlot (rf)

#Boosted Trees
install.packages("gbm")
library(gbm)

set.seed(123) 






