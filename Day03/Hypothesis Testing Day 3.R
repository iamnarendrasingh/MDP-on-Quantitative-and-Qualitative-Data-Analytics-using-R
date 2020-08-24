cs2m<- read.csv("cs2m.csv")
View(cs2m)
#One Sample t-test
#Null: Average age of the group is equals to 40 years.
#Since the p-value is less than 0.05, we will reject the null.
#Average age  is not equals to 40 years.

t.test(cs2m$Age, mu=50)


#Practice: 
#1. Ho:Average gpa is equal to 1.5. 
#2. Ho:Average score in quiz 1 is equal to 5.

grades<- read.csv("grades.csv")

t.test(grades$gpa, mu=1.5)
t.test(grades$quiz1, mu=5)


#Paired Sample t-test
grades<- read.csv("grades.csv")
t.test(x=grades$quiz1, y=grades$quiz2, alternative="two.sided", mu=0, paired=TRUE)
t.test(grades$quiz1, grades$quiz2, paired=T)

#Null: There is no significant difference in the quiz1 and quiz 2 score.
#p-value is less than 0.05, reject the null


#Practice: The true mean difference between quiz 4 and 5 is equal to zero.
t.test(grades$quiz4, grades$quiz5, paired=T)
#p-value is greater than 0.05, fail to reject the null. 



#Independent Sample t-test

#Null: Average BP of People with AnxtyLH low (0) = Average BP of People with AnxtyLH High (1)
#T-test = -2.6729, p-value = 0.01268
#P-value is less than 0.05, reject the null. 



View(cs2m)
t.test(cs2m$BP~cs2m$AnxtyLH) #Equal variance is not asusmed
t.test(cs2m$BP~cs2m$AnxtyLH, var.equal=TRUE) #Equal variance is asusmed


#Practice: 
#Null: Average Total Score of Male = Average Total Score of Female
View(grades)

t.test(grades$total~grades$gender, var.equal=TRUE)

#Null hypothesis: Average Sales of A=Average Sales of B=Average Sales of C=Average Sales of D
#F-test Value = 42.03, P-value = 0.00000000654


#ANOVA
salescity<-read.csv("salescity.csv")

View(salescity)

results<- aov(sales~city, data=salescity)
summary(results)
TukeyHSD(results)

boxplot(sales~city, data=salescity, col="red")

#Practice- Null: 
Average total of Students with P Status=
  Average total of Students with F Status=
  Average total of Students with O

Kannan<- aov(grades$total~grades$passfail, data=grades)
summary(Kannan)
boxplot(grades$total~grades$passfail, col="blue")




#Cross-tabulation
install.packages("gmodels")
library(gmodels)

CrossTable(cs2m$AnxtyLH, cs2m$DrugR)

CrossTable(cs2m$AnxtyLH, cs2m$DrugR, prop.r=FALSE, prop.c=FALSE,
           prop.t=FALSE, prop.chisq=FALSE)

help(CrossTable)

#Null: There is no association between the anxiety level and drugs consumption status.
#Results: X-squared = 3.3482, df = 1, p-value = 0.06728
#Since p-value is greater than 0.05, we fail to reject the null.

#Chi-square
chisq.test(cs2m$AnxtyLH, cs2m$DrugR)



#Practice: Ho: No association exists between the gender (Male and Female) and pass/fail status of students (P, F, O).


#Chi-square practice

CrossTable(grades$gender, grades$passfail, prop.r=FALSE, prop.c=FALSE,
           prop.t=FALSE, prop.chisq=FALSE)
chisq.test(grades$gender, grades$passfail)

Chi-square test = 3.3482
P-value = 0.0672
P-value is greater than 0.05


F-test = 43.03
P-value= 6.54e-09 = 6.54/10^9 =0.00000000654
P-value < alpha value
(6.54e-09< 0.05)


Thumb Rule for Hypothesis Testing:

1. If the p-value is less than the alpha value (0.05) 
then reject the null hypothesis.

2. If the p-value is greater than the alpha value (0.05) then
we fail to reject the null hypothesis.

Null:There is no significant association between
AnxtyLH and the  DrugR. 
(Accept the null/Fail to reject the null)







