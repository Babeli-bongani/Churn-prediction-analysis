#installing libraries
library(dplyr)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(ggpubr)
library(gplots)
library(gridExtra)
library(grid)
library(caret)
library(randomForest)
library(rpart)


#importing data
Churn_data<-WA_Fn.UseC_.Telco.Customer.Churn

#data cleaning#
head(Churn_data)
#checking for missing values
sapply(Churn_data, function(x) sum(is.na(x)))
#removing missing values
Churn_data<-Churn_data%>%na.omit()

#changing no internet service and service type to "no"
Churn_data$SeniorCitizen[Churn_data$SeniorCitizen==1]<- 'yes'
Churn_data$SeniorCitizen[Churn_data$SeniorCitizen==0]<- 'no'

#creating a new variable tenure group by factors
Churn_data <- (mutate(Churn_data, tenure = ifelse(Churn_data$tenure %in% 0:12, "0-12 Months",
                                                  ifelse(Churn_data$tenure %in% 13:24, "13-24 Months",
                                                         ifelse(Churn_data$tenure %in% 25:36, "25-36 Months",
                                                                ifelse(Churn_data$tenure %in% 37:48, "37-48 Months",
                                                                       ifelse(Churn_data$tenure %in% 49:60, "49-60 Months","over 60 Months")))))))
#removing the first column
Churn_data<-Churn_data[,-1]


#changing to factor variables
names <- c(1:4,6:17,20)
Churn_data[,names] <- lapply(Churn_data[,names] , factor)
str(Churn_data)


#exploratory data analysis
# bar plots based on churn rates
#phone service bar plot
p1<- ggplot(Churn_data,aes(gender)) + geom_bar(aes(fill=Churn)) +ggtitle("Phone Service")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                       stat = 'count',
                                                                       position = position_dodge(.1),
                                                                       size = 3) + xlab("gender") + theme_minimal() + coord_flip() + ylab("count")


#senior citizen bar plot
p2<- ggplot(Churn_data,aes(SeniorCitizen)) + geom_bar(aes(fill=Churn)) +ggtitle("Senior Citizen")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                       stat = 'count',
                                                                                                       position = position_dodge(.1),
                                                                                                       size = 3) + xlab("SeniorCitizen") + theme_minimal() + coord_flip() + ylab("count")

#partner bar plot
p3<- ggplot(Churn_data,aes(Partner)) + geom_bar(aes(fill=Churn)) +ggtitle("Partner")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                       stat = 'count',
                                                                                                       position = position_dodge(.1),
                                                                                                       size = 3) + xlab("Partner") + theme_minimal() + coord_flip() + ylab("count")

#dependents bar plot
p4<- ggplot(Churn_data,aes(Dependents)) + geom_bar(aes(fill=Churn)) +ggtitle("Dependents")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                       stat = 'count',
                                                                                                       position = position_dodge(.1), size = 3) + xlab("Dependents") + theme_minimal() + coord_flip() + ylab("count")

#creating a visual grid of bar plots
grid.arrange(p1, p2, p3, p4, ncol=2)

#phone service bar plot
p5<- ggplot(Churn_data,aes(PhoneService)) + geom_bar(aes(fill=Churn)) +ggtitle("Phone Service")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                       stat = 'count',
                                                                                                       position = position_dodge(.1),
                                                                                                       size = 3) + xlab("PhoneService") + theme_minimal() + coord_flip() + ylab("count")


#multiple lines bar plot
p6<- ggplot(Churn_data,aes(MultipleLines)) + geom_bar(aes(fill=Churn)) +ggtitle("MultipleLines")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                               stat = 'count',
                                                                                                               position = position_dodge(.1),
                                                                                                               size = 3) + xlab("MultipleLines") + theme_minimal() + coord_flip() + ylab("count")

#tech support bar plot
p7<- ggplot(Churn_data,aes(TechSupport)) + geom_bar(aes(fill=Churn)) +ggtitle("TechSupport")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                  stat = 'count',
                                                                                                  position = position_dodge(.1),
                                                                                                  size = 3) + xlab("TechSupport") + theme_minimal() + coord_flip() + ylab("count")

#online security bar plot
p8<- ggplot(Churn_data,aes(OnlineSecurity)) + geom_bar(aes(fill=Churn)) +ggtitle("OnlineSecurity")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                        stat = 'count',
                                                                                                        position = position_dodge(.1),
                                                                                                        size = 3) + xlab("OnlineSecurity") + theme_minimal() + coord_flip() + ylab("count")
#creating a visual grid
grid.arrange(p5, p6, p7, p8, ncol=2)

#streaming tv bar plot
p9<- ggplot(Churn_data,aes(StreamingTV)) + geom_bar(aes(fill=Churn)) +ggtitle("StreamingTV")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                                 stat = 'count',
                                                                                                                 position = position_dodge(.1),
                                                                                                                 size = 3) + xlab("StreamingTV") + theme_minimal() + coord_flip() + ylab("count")

#streaning movies bar plot
p10<- ggplot(Churn_data,aes(StreamingMovies)) + geom_bar(aes(fill=Churn)) +ggtitle("StreamingMovies")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                              stat = 'count',
                                                                                                              position = position_dodge(.1),
                                                                                                              size = 3) + xlab("StreamingMovies") + theme_minimal() + coord_flip() + ylab("count")

#payment method bar plot
p11<- ggplot(Churn_data,aes(PaymentMethod)) + geom_bar(aes(fill=Churn)) +ggtitle("PaymentMethod")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                  stat = 'count',
                                                                                                  position = position_dodge(.1),
                                                                                                  size = 3) + xlab("PaymentMethod") + theme_minimal() + coord_flip() + ylab("count")

#contract bar plot
p12<- ggplot(Churn_data,aes(Contract)) + geom_bar(aes(fill=Churn)) +ggtitle("Contract")  + geom_text(aes(y= ..count.. -100,label = paste0(round(prop.table(..count..),4) * 100, '%')),
                                                                                                                stat = 'count',
                                                                                                                position = position_dodge(.1),
                                                                                                                size = 3) + xlab("Contract") + theme_minimal() + coord_flip() + ylab("count")
#creating a visual grid
grid.arrange(p9, p10, p11, p12, ncol=2)


#changing internet service to no
Churn_data[Churn_data == 'No internet service'] <- 'No'
Churn_data[Churn_data == 'No phone service'] <- 'No'

#model building
#partitioning data
part<- createDataPartition(Churn_data$Churn,p=0.7,list=FALSE)
set.seed(2020)
train_churn<- Churn_data[part,]
test_churn<- Churn_data[-part,]


#logistic regression model
lrmode1=glm(Churn~., data=train_churn ,family=binomial)
summary(lrmode1)$coef

#summary of coefficients
coef_table<-data.frame(summary(lrmode1)$coef)

#predicting
lrpred <- predict(lrmode1,test_churn,type = "response")

#creating a confucious matrix
tbl<-ifelse(lrpred > 0.5,"yes", "no")
conf_m<-table(predicted=tbl,actual=test_churn$Churn)

#model prediction accuracy
acc<-1707/sum(table(lrpred,test_churn$Churn))



#Random forest model
rf.churn=randomForest(Churn~.,data=train_churn,
                       mtry=2,importance =TRUE)

#predictions
yhat.rf = predict(rf.churn ,newdata=test_churn)

#confucious matrix
conf.m<-table(Predicted = yhat.rf, Actual = test_churn$Churn)

#top 10 important variables
imp<-varImpPlot(rf.churn, sort=T, n.var = 10,
           main = 'Top 10 important variables')

#Model prediction accuracy
acc2<-1703/sum(conf.m)

##################################################################################################################################################################################################################















