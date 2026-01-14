library(data.table)
rm(list = ls())
gc(full = TRUE)

period <- c("04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
#### OBTAINING DATA ()

for (year in period) {
    # import personal and household files
    hogar1 <- fread(paste0("data/esudb", year, "h.csv"))
    hogar2 <- fread(paste0("data/esudb", year, "d.csv"))
    persona <- fread(paste0("data/esudb", year, "p.csv"))


    # merge the matrixes on household & personal ids
    hogar <- merge(hogar1, hogar2, by.x = "HB030", by.y = "DB030", all = TRUE)
    ecv <- merge(hogar, persona, by.x = "HB030", by.y = "PB030", all = TRUE)

    # export to a minimized file
    fwrite(ecv, paste0("out/", year, ".gz"), compress = "gzip")

    # clean memory before next iteration
    rm(list = setdiff(ls(), "period"))
}
