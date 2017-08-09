#####
# This script reads and collapses together data from all participants from study 3 Posner
#  Of  The reliability paradox: Why robust cognitive tasks do not produce reliable individual differences
# Authors : Hedge C, Powell G, Sumner P.
# DOI:10.3758/s13428-017-0935-1
#
# Data were downloaded from the Open Science Framework site on 04/08/2017
# 
#
############################




library(tidyverse)

data_dir <- "D:/R/R_Workshop/data/Exercises/session_3"
file_list <- list.files(data_dir)

for (file_name in file_list){
  data_temp <- read_csv(paste(data_dir, file_name, sep = "/"), col_names = FALSE)
  names(data_temp)<-c("block", "trial_nb","SOA", "condition", "response", "RT")
  
  data_temp$subject_nb <- strsplit(strsplit(file_name, "_")[[1]][2], "Posner")[[1]][1]
  data_temp$session_nb <- strsplit(strsplit(file_name, "Posner")[[1]][2],".csv")[[1]][1]
  
  if (exists('data_all')) {
    data_all <- bind_rows(data_all, data_temp)
  }else{
    data_all<-data_temp
  }
      
}

write_csv(data_all,paste(data_dir, "study3_allsubjects_Posner.csv", sep = "/"), col_names = FALSE)
