library(data.table)
library(dplyr)
library(tidyr)
library(ggplot2)


dt <- fread(
  "example.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

plot_grade <- function(data, main, from, to, at, bins = 21) {
  hist(
    data,
    breaks = seq(from, to, length.out = bins),
    main = main,
    xlab = "Score",
    xlim = c(from, to),
    ylim = c(0, at + 10)
  )
  
  boxplot(
    data,
    at = at + 5,
    boxwex = 10,
    horizontal = TRUE,
    add = TRUE,
    axes = FALSE
  )
  
  trans <- length(data) * (to - from) / (bins - 1)
  est <- density (data , from = from, to = to)
  est$y <- est$y * trans
  lines (est , col = 2 , lty = 2)
  
  lines ({
    tmp = seq(from, to, length.out = 100)
  },
  dnorm (tmp , mean = mean (data) , sd = sd (data)) * trans,
  col = 4)
  
  Q1 <- paste("Q1=", round(quantile(data, 0.25), 3), sep="")
  Q2 <- paste("Q2=", round(median(data), 3), sep="")
  Q3 <- paste("Q3=", round(quantile(data, 0.75), 3), sep="")
  Mean <- paste("Mean=", round(mean(data), 3), sep="")
  Var <- paste("Var=", round(var(data), 3), sep="")
  
  legend (
    "topleft" ,
    legend = c ("Estimated Distribution" ,
                "Normal Distribution", 
                Q1, Q2, Q3, Mean, Var) ,
    col = c (2, 4, 0, 0, 0, 0, 0) ,
    lty = c (2, 1, 0, 0, 0, 0, 0),
    bty = 'n'
  )
  
}

pdf(file = "distribution.pdf")
plot_grade(dt$midterm, "Midterm", 0, 100, 30, 51)
dev.off()

