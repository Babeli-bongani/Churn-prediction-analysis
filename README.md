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

summary of coefficients output


##########################################################################################################################################################

Coefficients:
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           5.246e-01  9.846e-01   0.533 0.594179    
genderMale                            7.001e-02  7.811e-02   0.896 0.370094    
SeniorCitizenyes                      2.673e-01  1.006e-01   2.658 0.007865 ** 
PartnerYes                           -3.294e-02  9.303e-02  -0.354 0.723264    
DependentsYes                        -1.870e-01  1.082e-01  -1.727 0.084105 .  
tenure13-24 Months                   -8.767e-01  1.260e-01  -6.959 3.43e-12 ***
tenure25-36 Months                   -1.079e+00  1.780e-01  -6.062 1.34e-09 ***
tenure37-48 Months                   -9.526e-01  2.394e-01  -3.979 6.92e-05 ***
tenure49-60 Months                   -1.124e+00  3.111e-01  -3.612 0.000304 ***
tenureover 60 Months                 -1.343e+00  4.146e-01  -3.238 0.001203 ** 
PhoneServiceYes                       1.760e-01  7.859e-01   0.224 0.822815    
MultipleLinesYes                      4.728e-01  2.150e-01   2.199 0.027847 *  
InternetServiceFiber optic            1.788e+00  9.713e-01   1.841 0.065627 .  
InternetServiceNo                    -1.503e+00  9.793e-01  -1.534 0.124946    
OnlineSecurityYes                    -5.230e-02  2.156e-01  -0.243 0.808368    
OnlineBackupYes                       1.223e-01  2.148e-01   0.569 0.569114    
DeviceProtectionYes                   1.766e-01  2.136e-01   0.827 0.408301    
TechSupportYes                       -1.225e-01  2.207e-01  -0.555 0.578944    
StreamingTVYes                        5.944e-01  3.973e-01   1.496 0.134667    
StreamingMoviesYes                    6.820e-01  3.972e-01   1.717 0.086017 .  
ContractOne year                     -9.172e-01  1.323e-01  -6.934 4.10e-12 ***
ContractTwo year                     -1.747e+00  2.188e-01  -7.982 1.44e-15 ***
PaperlessBillingYes                   3.537e-01  9.022e-02   3.921 8.83e-05 ***
PaymentMethodCredit card (automatic) -1.677e-01  1.367e-01  -1.226 0.220122    
PaymentMethodElectronic check         3.232e-01  1.118e-01   2.892 0.003828 ** 
PaymentMethodMailed check            -1.113e-01  1.373e-01  -0.811 0.417409    
MonthlyCharges                       -3.350e-02  3.858e-02  -0.868 0.385199    
TotalCharges                         -1.013e-04  7.409e-05  -1.367 0.171729   

##########################################################################################################################################################

Variables that have a significant raltionship with churn variable are marked with a "*", that is they have a significant p-value
These variables best describe churn.

Confucious matrix

##########################################################################################################################################################
         actual
predicted   No  Yes
      no  1394  273
      yes  154  287
 
 ##########################################################################################################################################################


Model prediction accuracy

##########################################################################################################################################################

[1] 0.8097723

##########################################################################################################################################################

We see that the logistic regression model has a 81% predcition accuracy.

#Random Forest model

variables importance output
These are important variables that best predict churn

##########################################################################################################################################################

                         MeanDecreaseAccuracy MeanDecreaseGini
gender                       2.596616         20.72752
SeniorCitizen               14.192568         27.23275
Partner                      6.321546         23.44791
Dependents                   7.464451         23.73646
tenure                      27.234170        110.96482
PhoneService                 5.350442         10.24328
MultipleLines                9.862654         19.60240
InternetService             25.423655         81.62383
OnlineSecurity              16.551333         29.14318
OnlineBackup                12.297888         21.60372
DeviceProtection            11.998545         20.46885
TechSupport                 17.587671         29.86629
StreamingTV                 12.193877         20.31239
StreamingMovies             11.264534         20.14386
Contract                    32.243592        127.91060
PaperlessBilling            15.610165         34.02823
PaymentMethod               19.752987         92.65554
MonthlyCharges              29.173782        154.22265
TotalCharges                34.279247        169.32442

##########################################################################################################################################################

Confucious matrix

##########################################################################################################################################################

 Actual
Predicted   No  Yes
      No  1399  289
      Yes  149  271

##########################################################################################################################################################

Model prediction accuracy

##########################################################################################################################################################

[1] 0.8078748

##########################################################################################################################################################

We see that the model also ahs a 81% prediction accuarcy.

*END*

##########################################################################################################################################################

