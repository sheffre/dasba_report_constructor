#processor

processor <- function(df) {
  df$timestamp_char <- as.character(round_date(df$timestamp, unit = "second"))
  
  df$timestamp_hour = round_date(df$timestamp, "1 hour")
  df$day = round_date(df$timestamp, "day")
  df_hour <- aggregate(co2_partial_pressure ~ timestamp_hour, data = df, FUN = mean)
  df_day <- aggregate(co2_partial_pressure ~ day, data = df, FUN = mean)
  ls <- list(df = df, df_hour = df_hour, df_day = df_day)
  return(ls)
}