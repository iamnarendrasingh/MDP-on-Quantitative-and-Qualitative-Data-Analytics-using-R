
setwd("E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day04")
getwd()


readLines("speech.txt")

a <- c("Hello" , "world", "My" , "First", "Handshake" , "Through" , "R")
a


b <- paste(a, collapse = "     ")
b


chunk_2 <- readLines('speech.txt')



chunk_pasted_2 <- paste(chunk_2, collapse = " " )

#check data
head(chunk_pasted_2)

#lower case
clean_data <- tolower(chunk_pasted_2)
head(clean_data)

#gsub == global subsetting  , 
clean_data_2 <-gsub( pattern = "\\W" , replace = " " , clean_data )

head(clean_data_2)

clean_data3 <- gsub(pattern = "\\d" , replace = " " , clean_data_2)
head(clean_data3)


library('tm')
stopwords()

clean_data_4 <- removeWords(clean_data3 , stopwords())


head(clean_data_4)
clean_data_5 <- gsub(pattern = "\\b[A-z]\\b{1}", replace= " ", clean_data_4 )
clean_data_5


clean_data_6 <- stripWhitespace(clean_data_5)
head(clean_data_6)


#clean data in different words

clean_data_7 <- strsplit(clean_data_6, " ")
head(clean_data_7)

help(table)
word_freq1 <- table(clean_data_7)
View(word_freq1)
head(word_freq1)

#cbind == column bind 
word_freq2 <- cbind(names(word_freq1) , as.integer(word_freq1))
head(word_freq2)

#exporting csv 
write.csv(word_freq2, "15AugModi.csv")

library(RColorBrewer)
library(wordcloud)

class(clean_data_7)

word_cloud1 <- unlist(clean_data_7)

wordcloud(word_cloud1)
wordcloud(word_cloud1, min.freq = 3)




#############################Sentiment Analysis 

positive <- scan("positive.txt" , what = "character" , comment.char = ";")


negative <- scan("negative.txt" , what = "character" , comment.char = ";")

head(positive)
head(negative)


senti_analysis <- unlist(clean_data_7)

match(senti_analysis, positive)


match(senti_analysis, negative)


##############calculate 
p_score<- sum(!is.na(match(senti_analysis,positive)))
p_score


n_score<- sum(!is.na(match(senti_analysis,negative)))
n_score

senti_score = p_score - n_score

senti_score
