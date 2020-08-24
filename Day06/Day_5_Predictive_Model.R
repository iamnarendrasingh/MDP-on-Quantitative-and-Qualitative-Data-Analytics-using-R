#Step1: Import the Data
#Method1: from working directory
data_today<- read.csv("cars_data.csv")
attach(data_today)

#Method2:
data_today<- read.csv(file.choose(), header = TRUE)
View(data_today)

#MPG = f(CYL, ENG, WGT) 


#Step2: Know the data (Structure and descriptive statistics)
str(data_today)
summary(data_today)
library(psych)
describe(data_today)

#Step3: Correlations
cor(data_today)

#M&C= -0.78
#M&E= -0.81
#M&W=-0.83



#Step4: Plots
pairs.panels(data_today)



#Step5: Run ols and interpret

result1<- lm(MPG~WGT, data=data_today)
summary(result1)

#MPG = a + b*WGT+error (No sense, no existance, the equation is not defined correctly)

#If you have only 1 indepndent variable, R-square (Simple Linear Regression)
#If you have more than 1 independent variable, Adjusted R-Square (Multiple Regression)

#Goodness of Fit (R-Square): 0.6918 (69.18%) (69.7%) (69.6%)
#How much percentage of variation (changes) 
#in the dep. var. can be explained by the indepndent variables. 

#Anova Statistics (F-test): 878.8 with p-value of 0.00000000000000022
#Null: b=0 {P-value is less than 0.05, reject null}
#The model is good fit and correctly specified in its functional form (Linear).


#Coefficients (Alpha and beta):
#Coeff. of WGT is -0.0076 (p-value = 0.00000000000000022)
#Coeff. is significant and 95% confidence, the WGT is having negative impact on the MGP.
#If WGT will increase by 1 unit (pound), the mileage will go down by 0.007 units (MPG) and vice-versa.  

#MPG = 46.216524 + (-0.007647)* WGT

result2<- lm(MPG~WGT+ENG+CYL, data=data_today)
summary(result2)


MPG = a+b1*WGT+b2*CYL+b3*ENG+error

#Anova Statistics (F-test): 300.8 with p-value of 0.00000000000000022
#Null: b1=b2=b3=0 {P-value is less than 0.05, reject null}
#The model is good fit and correctly specified in its functional form (Linear).


result3<- lm(MPG~ENG, data=data_today)
summary(result3)
result4<- lm(MPG~CYL, data=data_today)
summary(result4)

#When there is multicollinearity, 1. drop the variable, 2. PCA
#Variance Inflation Factor (VIF)
#Variable with VIF above 10 will be dropped. 

install.packages("car")
library(car)

vif(result2)
result5<- lm(MPG~WGT+CYL, data=data_today)
summary(result5)


#For Heteroscedasticity testing

install.packages("lmtest")
library(lmtest)
bptest()

error<- resid(result1)
View(error)
mean(error)

#Error mean = -0.0000000000000001.212647 (Assumption 4 is met)
error.var<- error^2
View(error.var)
plot(error.var)#Graphical analysis is suggestive, confirmation will come from test


library(lmtest)
bptest(result1)
#Null: Error variance is constant. (Reject null)
#Test= 22.456, p-value = 0.00000215


library(car)
ncvTest(result1)
#Null: Error variance is constant. 
#Test= 36.499, p-value = 0.000000001527

#Transformation of variables
#Log transformation (Dependent variable, independent)
#BLUE: Best Linear Unbiased Estimator

#Box-Cox Transformation
install.packages("MASS")
library(MASS) #boxcox transformation to know the transformation lambda
boxcox(result1)

attach(data_today)
MPG<- cbind(MPG)
MPG
WGT<- cbind(WGT)
MPG_1<- (MPG)^(1/2)
head(MPG)
head(MPG_1)
MPG_2<- 1/MPG_1

result7<- lm(MPG_2~WGT)
summary(result7)

library(lmtest)
bptest(result1)

library(car)
ncvTest(result1)


#Autocorrelation ( Durbin-Watson Tets, if the DW test is equal to 2, 
#then no problem of autocorrelation, else there is problem)
#1.95-2.05, No problem
#1.9 - 2.1, No problem

library(lmtest)
dwtest(result1)

#DW Statistics = 0.8076 (Much less than 2.0, there is problem of autocorrelation)
#We are using the cross-sectional data, so we may ignore this.
#In time series, it is one of the must criteria.


#Predictive Model(Divide into training-70%, and testing, 30%)


data1<- read.csv("cars_data.csv")



# Data Partition
set.seed(1234)
ind <- sample(2, nrow(data1), 
              replace = TRUE, 
              prob = c(0.7, 0.3))
training <- data1[ind==1,]
testing <- data1[ind==2,]

head(training)
head(testing)

# Multiple Linear Regression
model <- lm(MPG~WGT, data=training)
plot(MPG~WGT, training)
abline(model, col = "blue")

# Model Diagnostics
par(mfrow=c(2,2))
plot(model)

# Prediction
pred <- predict(model, testing)
head(pred)
A<- cbind(summary(pred), summary(testing))
B<- cbind(head(pred),head(testing$MPG))
B



MPG = a+b*WGT+error

predict(model, data.frame(WGT=2000))


data1 <- read.csv(file.choose(), header = TRUE)

# Data Review and Data Preparation
vehicle$lh[vehicle$lh==0] <- mean(vehicle$lh)
vehicle$lc[vehicle$lc==0] <- mean(vehicle$lc)

# Data Partition
set.seed(1234)
ind <- sample(2, nrow(data1), 
              replace = TRUE, 
              prob = c(0.7, 0.3))
training <- data1[ind==1,]
testing <- data1[ind==2,]

head(training)
head(testing)

# Multiple Linear Regression
model <- lm(MPG~WGT, data=training)
plot(MPG~WGT, training)
abline(model, col = "blue")

# Model Diagnostics
par(mfrow=c(2,2))
plot(model)

# Prediction
pred <- predict(model, testing)
head(pred)
A<- cbind(summary(pred), summary(testing))
B<- cbind(head(pred),head(testing$MPG))
B




A<- head(pred)
B<- head(testing$MPG)

Merge<- cbind(A,B)
Merge



merge


predict(model, data.frame(WGT=1000))

















