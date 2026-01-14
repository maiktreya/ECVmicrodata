suppressPackageStartupMessages({
    library(magrittr)
    library(data.table)
    library(survey)
})

period <- c("04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
#### OBTAINING DATA ()

for (year in c(0:4)) {
    hogar1 <- fread(paste0("data/HOUSEHOLDS/esudb2", year, "h.csv"))
    hogar2 <- fread(paste0("data/HOUSEHOLDS/esudb2", year, "d.csv"))

    # unir

    ecv <- merge(hogar1, hogar2, by.x = "HB030", by.y = "DB030", all = TRUE)
    ecv[, renter := fcase(HY040G > 0, 1, default = 0)][, renter := factor(renter)]

    dt <- svydesign(ids = ~1, data = ecv, weights = ecv$DB090)
    test <- svymean(~renter, dt, na.rm = TRUE)
    print(test)
}
