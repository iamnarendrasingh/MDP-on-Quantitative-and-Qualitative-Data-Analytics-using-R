getwd()
setwd("E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day02")

#importing file 
grades <- read.csv("grades.csv") #if your file is in pwd 

#browse command in R
View(grades)

getwd()

#dimension of data
dim(grades)

#summary 
summary(grades)

summary(grades$gpa)

length(grades$ethnicity) # to know the 
length(grades$gpa)

min(grades$ethnicity)
min(grades$gpa)

max(grades$ethnicity)
max(grades$gpa)

range(grades$ethnicity)
range(grades$gpa)


sum(grades)
sum(grades$gpa)

median(grades$gpa)

var(grades$gpa)

summary(grades)

str(grades)

#for first 6 obs
head(grades)

head(grades$gpa)
tail(grades$gpa) #for last 6 obs

summary(grades)

#install package
install.packages("psych")

#load package 
library(psych)

help(sum)

#describe = summary both commands are same 
help(describe)
describe(grades)


a <- grades[ , 10:15]
View(a)
cor(a)
write.csv(a, "E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day02\\a.csv")

#correlation 

cor(grades)
cor(a)



b <- grades[ , 13:15]
View(b)
cor(b)
write.csv(b, "E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day02\\b.csv")


pairs.panels(b)



cs2m <- read.csv("cs2m.csv")
View(cs2m)

#hist0gram
hist(grades$gpa , xlab ="gpa" , ylab="Frequency" , main "Histo of gpa")

#Bar chart
counts <- table(grades$ethnicity)
barplot(counts)
help("barplot")


prashnat <- c(10,20,25,30)
names(prashnat) <- c("JP", "Ag" ,"Jammu" , "Delhi")
pie(prashnat)


cs2m <- as.matrix(cs2m)
heatmap(cs2m, scale = 'none')