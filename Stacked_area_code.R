#### Stacked area plot --------------------------------------

# This code is importing data from Amplitude CSV file and plotting
# the stacked area chart showing popularity of different workout
# types. 

## 1. Reading data ------------------------------------------

df <- read.csv("Event.csv", 
               skip = 4,
               encoding = "UTF-8")
colnames(df) <- substring(colnames(df), 3)
df2 <- rbind(colnames(df), df)
df3<- as.data.frame(t(df2))
colnames(df3) <- df3[1,]
df3 <- df3[-1,-7]
colnames(df3) <- c("date", "кардио", "силовая", "йога", 
                   "релакс", "растяжка", "пилатес")
df3$date <- as.Date(df3$date, format = "%Y.%m.%d")

## 2. Plotting data -----------------------------------------

install.packages("areaplot")
library(areaplot)
cols <- hcl.colors(6, palette = "viridis", alpha = 0.8)
areaplot(.~date, data = df3,
         main = "Количество тренировок",
         col = cols,
         border = "white",
         xlab = "",
         lwd = 0.5,
         lty = 1,
         legend= TRUE,
         args.legend = list(x = "topleft", cex = 0.8))
