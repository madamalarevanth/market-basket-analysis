
library(arules)

#### import by using read. transaction as it knows how to read the data without any mess ..##
Groceries <- read.transactions("groceries.csv",sep= ",")

##library for datasets
library(datasets)

data("Groceries")

class(Groceries)

#lists the top ten rows of the data
LIST(Groceries[1:10])

#as.transaction is used to convert the dataset to transaction 

summary(Groceries)

###otal no of transactions in data
9835*169

###otal no of filled cells with data as density is 0.026
9835*169*0.0260

### TO GET THE SUPPORT OF FIRST 6 ITEMS ###
itemFrequency(Groceries[,1:6])

#TO CHECK THE SUPPORT OF ITEMS 
#support refers to probability of intrest set of product out of all sets 
itemFrequencyPlot(Groceries,support = 0.10)


### TO CHECK THE TOP 10 SUPPORT ITEM IN AN INCREASING ORDER###  
itemFrequencyPlot(Groceries,topN =20)

#gives absolute frequency
itemFrequencyPlot(Groceries,topN =10,type="absolute")

# visualization of sparse matrix of random sample of 100 transactions
image(sample(Groceries, 100))

### BY DEFAULT VALUE OF SUPPORT IS .1 AND CONFIDENCE IS .8 and we get 0 rules bcoz non satisfy it ####
rules<- apriori(Groceries)
rules


#apriori function is in arules package, it employs levelwise search for frequent item sets
rules<- apriori(Groceries,parameter = list(support=0.002,confidence=0.5,minlen=2))

#to find the number of rules
rules

##Evaluating model performance ----

# summary of grocery association rules
summary(rules)

# look at the first five rules
inspect(groceryrules[1:5])

# targetting customers
rules<- apriori(Groceries,parameter = list(supp=0.001,conf=0.8),
                appearance = list(default="lhs",rhs="whole milk"),
                control = list(verbose = F))

inspect(rules)

#  using association rule mining
inspect(head(sort(rules,by="lift"),2))

inspect(head(sort(rules,by="lift")[1:4]))

inspect(head(sort(rules,by="lift"),100))

# writing the rules to a CSV file
write(rules, file = "groceryrules.csv",
      sep = ",", quote = TRUE, row.names = FALSE)

# converting the rule set to a data frame
groceryrules_df <- as(rules, "data.frame")
str(groceryrules_df)
