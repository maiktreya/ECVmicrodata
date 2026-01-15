library(data.table)
rm(list = ls())
gc(full = TRUE)

period <- c("04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")

for(i in seq_along(period)){
dt <- fread(paste0("out/",period[i],".gz"))
}