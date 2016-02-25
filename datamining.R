install.packages(c("adabag","arules","c50","dplyr","e1071","igraph","mclust"))
install.packages('printr',type = 'source',
  repos = c('http://yihui.name/xran', 'http://cran.rstudio.com'))
install.packages("C50")
dataframe<- read.csv("E:/data/titanic.csv")
dataframe
library(C50)
library(printr)
# now making the data into train set and test data set

train.indices<- sample(1:nrow(dataframe),100)

# now making them split

dataframe.train <- dataframe[train.indices,]
dataframe.test <- dataframe[-train.indices,]
dataframe.test <- na.omit(dataframe.test)
dataframe.train<-na.omit(dataframe.train)

dataframe.train

model <- C5.0(Name ~ .,data=dataframe.train)

levels(dataframe.train$Cabin)[1] ="missing"
levels(dataframe.train$Embarked)[1] ="missing"
model
levels(dataframe.test$Cabin)[1] ="missing"
levels(dataframe.test$Embarked)[1] ="missing"
results <- predict(model,dataframe.test,type ="class")
results
write.csv(results,"E:/data/titanicprediction.csv")
summary(model)
