# Compute, for each survey wave, the share of total population and the share of
# total net wealth held by selected quantiles groups

suppressPackageStartupMessages({
    library(data.table)
    library(survey)
})

# Waves included
period <- c(19:24)

# Accumulators
obj <- c()
summary_table <- data.table()

for (year in period) {
    # Load per<U+2011>year mean<U+2011>imputed microdata
    file_path <- sprintf("out/%d.gz", year)
    ecv <- fread(file_path)

    # Ensure types
    ecv[, weights := as.numeric(DB090)]
    ecv[, renta_alquiler := as.numeric(HY030N)]
    ecv[, reg_tenencia := factor(HH021)] # valor 3 para alquiler pm

    dt <- svydesign(ids = ~1, data = ecv, weights = ecv$weights)

    # Compute quantiles
    quant <- svymean(~renta_alquiler, subset(dt, reg_tenencia == "1"), na.rm = TRUE)
    obj <- c(obj, quant[[1]])
}

results <- data.table(period = c(2019:2024), rental_p = obj, rental_grp = c(NA, diff(log(obj))))
print(results)
