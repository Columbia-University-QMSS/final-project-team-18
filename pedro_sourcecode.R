
library(dplyr)
library(tm)
library(tidytext)
library(xlsx)
library(wordcloud)

load("motive_tidy.rda")
motive_tidy

m1970 <- motive_tidy %>% filter(year == 1970) %>% group_by(term) %>% summarize(count = n()) %>% arrange(desc(count))
wordcloud(m1970$term, m1970$count, max.words = 100, colors = "red") # wordcloud for year 1970
m2015 <- motive_tidy %>% filter(year == 2015) %>% group_by(term) %>% summarize(count = n()) %>% arrange(desc(count))
m2015 <- m2015[-1, ]
wordcloud(m2015$term, m2015$count, max.words = 100, colors = "blue") # wordcloud for year 2015

islamic_time <- motive_tidy %>% filter(term == "islamic" | term == "islam") %>% group_by(year) %>% summarize(count = n())
islamic_time
ggplot(islamic_time) + geom_line(aes(x = year, y = count)) # plot popularity of islam(ic) over time

taliban <- motive_tidy %>% filter(gname == "Taliban") %>% group_by(term) %>% summarize(count = n()) %>% arrange(desc(count))
isil <- motive_tidy %>% filter(gname == "Islamic State of Iraq and the Levant (ISIL)") %>% group_by(term) %>% summarize(count = n()) %>% arrange(desc(count))
islamic_time <- motive_tidy %>% filter(term == "islamic") %>% group_by(year, term) %>% summarize(count = n()) %>% arrange(year)
islamic_time
unique(motive_tidy$year)
