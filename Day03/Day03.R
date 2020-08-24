setwd("E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day02")

cs2m <- read.csv("cs2m.csv")
View(cs2m)

#Case1
#Null :  Average age of the group is equal to 40

t.test(cs2m$Age, mu=40)

#Since the p value is greater than 0.05 , 
# we reject the Null Hypo.
#The average is equal to 40 


#Case2
#Null :  Average age of the group is equal to 50

t.test(cs2m$Age, mu=50)

#Since the p value is less than 0.05 , 
# we will reject the Null Hypo.
#The average is equal to 40 

grades <- read.csv("grades.csv")

View(grades)

t.test(grades$gpa, mu =1.5)

t.test(grades$quiz1, mu = 5)

#Paired t-test
#Null : there is no significant difference in the 
#quiz1 and quiz2 , 

t.test(grades$quiz1 , grades$quiz2 , paired =  T)
#p value is less than 0.05 , reject the nul


#Null : the true mean diff between quiz4 and quiz4 is zero.
t.test(grades$quiz4 , grades$quiz5 , mu=0  ,paired =  T)

#p-value is greater than 0.05 , fail to reject Null


#Independent Sample t-test
#Null : Average BP of People with AnxtyLh low(0) = Average BP of People with AnxtyLh high 

View(cs2m)
t.test(cs2m$BP~cs2m$AnxtyLH)
#p value is less than 0.05, we are goimng to reject the NUll

t.test(cs2m$BP~cs2m$AnxtyLH , var.equal=T)
#p value is less than 0.05, we are goimng to reject the NUll

#Null : Average total score of Male = Average Total score of Female 
View(grades)
t.test(grades$total~grades$gender, var.equal= T) #catogoriacl group is on 2nd number
help(t.test)


###############################
#ANOVA 


#Null : Average sale of A = Average sale of B = Average sale of C = Average sale of D
setwd("E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day03")

salescity <- read.csv("salescity.csv")
View(salescity)
aov(sales~city , data = salescity)
#saving results in a file
results <- aov(sales~city , data = salescity)
View(results)
summary(results)

#F-test value is 42.03 , p = 0.000000000654
#Reject to Null Hypo as p value is less than 0.05

TukeyHSD(results)
boxplot(sales~city , data = salescity , col="red")

#pratice-Null

kannan <- aov(grades$total~grades$passfail, data = grades)
summary(kannan)
boxplot(grades$total~grades$passfail, col = "blue")
#F-value = 32.12


#Cross-tabulation

install.packages("gmodels")
library(gmodels)

CrossTable(cs2m$AnxtyLH, cs2m$DrugR)

CrossTable(cs2m$AnxtyLH, cs2m$DrugR , prop.r =FALSE , prop.c =FALSE ,
           prop.t = FALSE, porp.chisq=FALSE)

#
chisq.test(cs2m$AnxtyLH, cs2m$DrugR)

# since pl value is less grater than 0.05, we fail to reject null hypo 



##########################################
#predictive 

getwd()

data_today <- read.csv(file.choose(), header=TRUE) #import data new method


View(data_today)

#MPG = f(CYL, ENG , WGT)


#know the data 
str(data_today)
summary(data_today)

library(psych)
describe


