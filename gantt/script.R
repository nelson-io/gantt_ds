library(plotly)
library(tidyverse)
library(lubridate)

gantt_df <- data.frame(
  modules = c(paste0('Módulo ', 1:8), 'Revisión y edición'),
  start_date = c(rep(dmy(160721),2), rep(dmy(190721),2),  rep(dmy(260721),2),  rep(dmy(020821),2), dmy(090821)),
  end_date = c(rep(dmy(190721),2), rep(dmy(260721),2),  rep(dmy(020821),2),  rep(dmy(090821),2), dmy(160821)),
  completion = rep('0%', 9),
  color = c(rep('steelblue', 8), 'magenta')
  )

# 
# df$Start  <- as.Date(df$Start, format = "%m/%d/%Y")
# client    <- "Sample Client"
# cols      <- RColorBrewer::brewer.pal(length(unique(df$Resource)), name = "Set3")
#factor(df$Resource, labels = cols)

p <- plot_ly()
for(i in 1:(nrow(gantt_df))){
  p <- add_trace(p,
                 x = c(gantt_df$start_date[i], gantt_df$end_date[i]), 
                 y = c(i, i), 
                 mode = "lines",
                 line = list(color = gantt_df$color[i], width = 20),
                 showlegend = F,
                 hoverinfo = "text",
                 text = paste("Event: ", gantt_df$modules[i], "<br>",
                              "Completion: ", gantt_df$completion[i], "<br>",
                              "Start date: ", gantt_df$start_date[i],"<br>",
                              "End date: ", gantt_df$end_date[i],"<br>"),
                 evaluate = T
  )
}

p
