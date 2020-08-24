#Null : Average sale of A = Average sale of B = Average sale of C = Average sale of D
setwd("E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day04")

readLines("Acknowledgment.txt")

#let us have a vextor of words and apply paste function into it.


a <- c("Hello" , "world", "My" , "First", "Handshake" , "Through" , "R")
a

#we are looking to use paste function and make it a chunk 

b <- paste(a, collapse = "     ")
b

chunk_2 <- readLines("Acknowledgment.txt")

chunk_pasted_2 <- paste(chunk_2, collapse = " " )

#check data
head(chunk_pasted_2)

#lower case
clean_data <- tolower(chunk_pasted_2)
head(clean_data)

#gsub == global subsetting  , 
clean_data_2 <-gsub( pattern = "\\W" , replace = " " , clean_data )

head(clean_data_2)

#remove digit 

clean_data3 <- gsub(pattern = "\\d" , replace = " " , clean_data_2)
head(clean_data3)

#cleaning the stopwords
install.packages("tm")
library('tm')

#see a preview of stopwords
stopwords()

#remove stop words from 
clean_data_4 <- removeWords(clean_data3 , stopwords())

head(clean_data_4)

#remove single letters , remove letter like a-z 

clean_data_5 <- gsub(pattern = "\\b[A-z]\\b{1}", replace= " ", clean_data_4 )

clean_data_5

# remove white space

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
write.csv(word_freq2, "WordFrequency5.csv")

#create word cloud

install.packages("RColorBrewer")
install.packages("wordcloud")

library(RColorBrewer)
library(wordcloud)

class(clean_data_7)

word_cloud1 <- unlist(clean_data_7)

wordcloud(word_cloud1)
wordcloud(word_cloud1, min.freq = 3)

wordcloud(word_cloud1, min.freq = 1 , random.order = FALSE)

wordcloud(word_cloud1, min.freq = 3 , random.order = FALSE, scale = c(4,1) )

pal2 <- brewer.pal(5, "Dark2")



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


filetxt <- sub(".pdf", ".txt", dest)


dest <- "E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day04"

myfiles <- list.files(path = dest, pattern = "pdf",  full.names = TRUE)

lapply(myfiles, function(i) system(paste('E:\\Dropbox (Gates Institute)\\Narendra's\\PMA2.0\\TCB\\2020Aug\\MDP on Quantitative and Qualitative Data Analytics using R\\Day04"
', paste0('"', i, '"')), wait = FALSE) )