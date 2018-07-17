# market-basket-analysis
this project is done on grocieries data set using assosiation rules apriori algorithm
the data set contains 9835*169 items and the graphs has been attached above.
I used the concept of support,confidence and lift

What is Association Analysis?
Association analysis uses a set of transactions to discover rules that indicate the likely occurrence of an item based on the occurrences of other items in the transaction

Items 
1 Chips, Milk 
2 Chips, Diaper, Beer, Cornflakes 
3 Milk, Diaper, Beer, Pepsi 
4 Chips, Milk, Diaper, Beer 
5 Chips, Milk, Diaper, pepsi 

 Association Rule Evaluation Metrics
Support (s) = Fraction of transactions that contain both X and Y i.e. how often Milk, Diaper and Beer occur together in the transactions. Milk, Diaper and Beer occur in 2 out of total 5 transactions, hence support =2/5=0.4


Confidence (c) = Measures how often each item in Y appears in transactions that contain X

C= Support (X + Y)/Support (X)

That is- How often beer occurs in the transactions which contain milk and diaper. Now milk and diaper are together in 3 transactions (TID=3, 4 and 5), and out of the 3, beer is present in 2 of them, hence confidence = 2/3 (No. of transactions with Milk, Diaper and Beer/No. of transactions with Milk and Beer) =0.67

R uses sparse matrix data structure to store all the transaction details 
