#data description


# Churn-prediction-analysis
This analysis employs machine learning algorithms (Random forest and logistic regression) to build a model that will better predict if the telecoms industry customer is likely to churn or not.

#EXPLORATORY DATA ANALYSIS

Gender
It is quiete visible that there is no difference in churn rates between males and females.
There are more male subscribers who do not churn with a difference of not more than a percentage than female subscribers who do not churn.
 
Senior Citizen
There are less senior citizen subscribers than non senior citizens. a greater percentage of chunners and non chunners comes from non senior citizens.
The ratio of chunners to non chunners is fairly equal for senior citizens however, when it comes to non senior citizens, there are lesser subscribers who are likely to churn.

Partner
There are slightly more subscribers who do not have a partner than those with a partner.
For both subscribers whit and without a partner, the ratio of chunners to non chunners is the same, that is, there are more subscribers who do not churn than those who leave.

Dependants
There are more subscribers whith no dependents.
When it comes to subscribers whithout and without dependants, there are more non chunners.

Phone Service
There are more subscribers who have a phone service than those who do not.
The ratio of subscribers churn and non chunners is more or less equal for those who have a phone service and those who do not.

Multiple lines
There are more subscribers without multiple lines than those with them.
There are less subscribers who churn than those that stay for both categories of subscribers whith and without multiple lines.

Tech Support
More subscribers do not have tech support
The ratio of chunners to non chunners is the same for both classes of subscribers, being those with and without tech support, there are less people who are likely to churn here.

Online Security
There seems to be more subscribers whithout online security.
There is significantly less people who have online security and churn while the ratio of chunners and non chunners is the same for both subscribers whith and without online security. There are less people who churn in these classes.

Streaming Tv
More subscribers do not stream Tv than those who stream tv.
For both categories of tv and non tv streamers, there is a similar pattern of less subscribers churning.

Streaming Movies
More subscribers do not stream movies.
There is also a similar behaviour for both movies and non movies streamers, with more subscribers being less likely to churn in these classes.

Payment method
For payment methods(mailed check, Credit card, Bank transfer), more subscribers are still less likely to churn, however, there seems to be a slightly equal ratio of chunners to non chunners for E-check payers.
Also, most subscribers use E-check payment method, followed by mailed check, with credit card and bank transfer payment methos having equally the least number of people.

Contract
Most subscribers have a month to month contract, followed by two the years contract and lastly the one year contract.
For all subscribers on the contarct types, more subscribers who churn are month to month contract subscribers, and the ratio of chunners to non chunners in this contract type is the same.
For both one and two year contract subscribers, there are less people who churn, with the least number of subscribers who churn having the two years contarct followed by the ones whith the one year contract.

#Modelling

Logistic Regression

Model prediction accuracy

####################################################################################################

[1] 0.8097723

##################################################################################################

We see that the logistic regression model has a 81% predcition accuracy.

#Random Forest model

Confucious matrix

Model prediction accuracy

###################################################################################################

[1] 0.8078748

###################################################################################################

We see that the model also ahs a 81% prediction accuarcy.

*END*

###################################################################################################

