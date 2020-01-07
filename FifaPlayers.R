##Loading the Libraries
library(dplyr)
library(ggplot2)

## Reading the Dataset
fifaData <- read.csv('data.csv')

## Exploring first few observations
head(fifaData)

## Cleaning the Data
names(fifaData) <- gsub("\\.", "", names(fifaData))

fifaData$ReleaseClause <-  gsub('â,¬','',fifaData$ReleaseClause)
fifaData$ReleaseClause <-  gsub('M','',fifaData$ReleaseClause)
fifaData$ReleaseClause <- as.numeric(fifaData$ReleaseClause)*1000000


fifaData$Value <-  gsub('â,¬','',fifaData$Value)
fifaData$Value <-  gsub('M','',fifaData$Value)
fifaData$Value <- as.numeric(fifaData$Value)*1000000

fifaData$Wage <-  gsub('â,¬','',fifaData$Wage)
fifaData$Wage <-  gsub('K','',fifaData$Wage)
fifaData$Wage <- as.numeric(fifaData$Wage)*1000


fifaData = fifaData[,-1]

fifaData = mutate_if(fifaData, is.numeric, as.integer)

## Writing in a new file
write.csv(fifaData, file = "fifaData.csv",na="")


    
## Visualizing the Relationship between variables
ggplot(fifaData,aes(x = fifaData$Overall,y = fifaData$Value)) +
  geom_point(alpha = 0.2,shape = 19) +
  xlab("Overall Ratings")+ylab("Market Value") + 
  geom_smooth() 

ggplot(fifaData,aes(x = fifaData$Overall,y = fifaData$ReleaseClause)) +
  geom_point(alpha = 0.2,shape = 19) +
  xlab("Overall Ratings")+ylab("Release Clause") + 
  geom_smooth()

ggplot(fifaData,aes(x = fifaData$Overall,y = fifaData$Value,size = fifaData$Wage)) +
  geom_point(alpha = 0.2,shape = 19) +
  xlab("Overall Ratings")+ylab("Market Value") +
  labs(size = "Wage")
  