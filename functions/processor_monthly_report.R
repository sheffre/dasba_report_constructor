#processor

processor <- function(df) {
  df$timestamp_char <- as.character(round_date(df$timestamp, unit = "second"))
  
  df$timestamp_hour = round_date(df$timestamp, "1 hour")
  df$day = round_date(df$timestamp, "day")
  
  df_hour <- aggregate(co2_partial_pressure ~ timestamp_hour, data = df, FUN = mean)
  df_hour$co2_partial_pressure_hour <- df_hour$co2_partial_pressure
  
  
  df_day <- aggregate(co2_partial_pressure ~ day, data = df, FUN = mean)
  df_day$co2_partial_pressure_daily <- df_day$co2_partial_pressure
  
  df_binded <- cbind(df_day, df_hour)
  
  ls <- list(df_hour = df_hour, df_day = df_day, df_binded = df_binded)
  
  
  return(ls)
}