library(DT)
library(plotly)
library(crosstalk)

sd <- SharedData$new(iris[, c("Sepal.Length", "Sepal.Width")])

bscols(
  device = "lg",
  datatable(sd, width = "100%"),
  plot_ly(sd, x = ~Sepal.Length, y = ~Sepal.Width)
)
