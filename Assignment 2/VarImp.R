#Import data in R
data <- read.csv(file.choose(), header = TRUE, sep = ",")
install.packages("randomForest")
library(randomForest)

#Define the data frame
df =data.frame(data)

#Fit the decision tree (Use different parameter values to observe changes in results)
fit <- randomForest(factor(TARGET_B)~., data=df, n.trees=100,interaction.depth=10, importance = T)
#n.trees =  number of trees
#interaction.depth = depth of tree

#Get Variable importance (will show overall accuracy and Mean decrease in Gini)
(VI_F=importance(fit))

#Plot variable importance (by Mean Decrease in Gini)
varImpPlot(fit,type=2)