#plotter for report
library(plotly)

plotter <- function(ls) {
  fig <- plot_ly(ls$df_binded, type = "scatter", mode = "lines", ) %>%
  add_trace(x = ~timestamp_hour, y = ~co2_partial_pressure_hour, 
            name = 'Среднечасовое содержание',
            hovertemplate = 'pCO2: %{y:ppm}\nВремя: %{x}<extra></extra>') %>%
  
  add_trace(x = ~day, y = ~co2_partial_pressure_daily,
            name = "Среднесуточное содержание", 
            hovertemplate = 'pCO2: %{y:ppm}\nВремя: %{x}<extra></extra>') %>%
  layout("show.legend")
  return(fig)
}