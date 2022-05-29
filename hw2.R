install.packages('openxlsx')
install.packages('ggplot2')
install.packages('data.table')
install.packages('skimr')
install.packages('GGally')
install.packages('ggcorrplot')
install.packages(file.choose(), repos=NULL)

require(openxlsx) 
library(openxlsx)
require(ggplot2)
require(data.table)
require(skimr)
require(GGally)
require(ggcorrplot)

install.packages("readxl")
library(readxl)
data_path=file.choose()

invest=read_excel(data_path,sheet=1)
str(invest)
install.packages("skimr")
library(skimr)
summary_data=skim(invest)
print(summary_data)
install.packages("data.table")
library(data.table)
invest=data.table(invest)
str(invest)
library(ggplot2)
ggplot(invest,aes(x=Date,y=USD.Exchange.Rate))+ 
  geom_line(color="red")+
  ggtitle("Time Series of Exchange Rate USD/TRY",
          subtitle="Between the Years 2017-2022")

ggplot(invest,aes(x=Date,y=Price.Index))+ 
  geom_line(color="purple")+
  ggtitle("Time Series of Price Index",
          subtitle="Between the Years 2017-2022")

ggplot(invest,aes(x=Date,y=Consumer.Confidence.Index))+ 
  geom_line(color="green")+
  ggtitle("Time Series of Consumer Confidence Index",
          subtitle="Between the Years 2017-2022")

dist1<- invest%>%
  ggplot(.,aes(x=USD.Exchange.Rate))+
  geom_density(color="darkgrey",fill="brown",adjust=1.5, alpha=.4) +
  ggtitle("Distribution of Exchange Rate Values")
dist1


print(paste("Variance of Exchange Rate Values:", var(invest$USD.Exchange.Rate)))
print(paste("Mean of Exchange Rate Values:",mean(invest$USD.Exchange.Rate)))
dist1+
  facet_wrap(~year(Date))

