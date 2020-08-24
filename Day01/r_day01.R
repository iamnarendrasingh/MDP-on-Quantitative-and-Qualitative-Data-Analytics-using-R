# Work smart or live hard 

3+2
6*7
6**7
30-10
30+10
3>10
0>0
0=0
0==0

x <- 100 # 100 is stored in x , 100 is assigned to x 
# <- is assignment symbol / assignment operator .
x/5

y = 30
y

a = "Happy Learning" # = is also ccalled assignment operator 

s = 20:500
s

h=10

n = c(12,14,15,16,18,21,23,32,33,35,43,0)
n #c is combining , concatenation

f = sum(n)
f

mean(n)

summary(n)

length(n)

g = c("Ram" , "Laxman" , "Sita")

learn <- c("you", "me", "R")
learn[1]
learn[2]
learn[3]
learn[0]
learn[-1]
learn[-2]
learn[-3]
learn[3] <- "SaS"
learn[3]
length(c)
length[learn]
learn[4] <- "SPSS"
leanr


################
names <- c("joel" , "chris" , "julie" , "mary" , "sprina")
percent <- c(85,88,92,95,89)
lunch <- c("biryani" , "chicken kabab" , "biryani" , "chicken kabab" , "veg pulaoo")


joy <-  data.frame(names, percent, lunch)

joy


# define a categorical variable 


str(joy) #str for structure 
names(joy)
joy$names #able to see what is stored in names in file joy

#below will export
write.csv(joy , "E:/Dropbox (Gates Institute)/Narendra's/PMA2.0/TCB/2020Aug/MDP on Quantitative and Qualitative Data Analytics using R/Day01/joy.csv" )


