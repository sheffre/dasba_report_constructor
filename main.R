#body

source(paste0(getwd(), "/functions/getter_monthly_report_current_month.R"))
source(paste0(getwd(), "/functions/processor_monthly_report.R"))
source(paste0(getwd(), "/functions/plotter_monthly_report.R"))

library(plotly)
library(DBI)
library(RPostgres)
library(lubridate)
library(tibble)

listed_conn <- list(drv = RPostgres::Postgres(),
                         host = "81.31.246.77",
                         user = "shinytest",
                         password = "17082002asxc",
                         dbname = "default_db")
df1 <- getter(listed_conn)
df3 <- processor(df1)

t1 <- plotter(df3)
t1
plot(x = df3$df_day$day, y = df3$df_day$co2_partial_pressure_daily, type = "line")
