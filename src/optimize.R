library(data.table)
rm(list = ls())
gc(full = TRUE)

period <- c(19:24)
#### OBTAINING DATA ()

for (year in period) {
    # import personal and household files
    hogar1 <- fread(paste0("data/HOUSEHOLDS/esudb", year, "h.csv"))
    hogar2 <- fread(paste0("data/HOUSEHOLDS/esudb", year, "d.csv"))

    # merge the matrixes on household & personal ids
    ecv <- merge(hogar1, hogar2, by.x = "HB030", by.y = "DB030", all = TRUE)

    # export to a minimized file
    fwrite(ecv, paste0("out/", year, ".gz"), compress = "gzip")

    # clean memory before next iteration
    rm(list = setdiff(ls(), "period"))
}
