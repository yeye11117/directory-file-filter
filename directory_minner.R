#install.packages("readxl")
#install.packages("dplyr")
#install.packages("tidyverse")
#install.packages("openxlsx")

library(readxl)
library(dplyr)
library(tidyverse)
library(openxlsx)

df_all <- list.files(pattern = ".xls") %>%
  map_df(~read_xls(.x) %>% 
  mutate(across(.fns=as.character))) %>%
  type_convert()

colnames(df_all)[2] = "positive"
df_all

df_fresh <- filter(df_all, grepl('Pos', positive))
write.xlsx(df_fresh, 'C:\\Users\\yaelr\\Desktop\\Data')
