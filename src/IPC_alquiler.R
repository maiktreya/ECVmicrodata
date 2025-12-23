# Compute, for each survey wave, the share of total population and the share of
# total net wealth held by selected quantiles groups

suppressPackageStartupMessages({
    library(data.table)
    library(survey)
    library(magrittr)
})

# Waves included
period <- c(19:29)

# Accumulators
obj <- c()
summary_table <- data.table()

for (year in period) {
    # Load per<U+2011>year mean<U+2011>imputed microdata
    file_path <- sprintf("out/%.csv", year)
    ecv <- fread(file_path)

    # Ensure types
    eff[, weights := as.numeric(DB090)]
    eff[, renta_alquiler := as.numeric(p2_31)]
    eff[, reg_tenencia := factor(p2_19)]

    dt <- svydesign(ids = ~1, data = ecv, weights = ecv$DB090)

    # Compute quantiles
    quant <- svymean(~renta_alquiler, subset(dt, reg_tenencia == "1"), na.rm = TRUE)

    obj <- c(obj, quant[[1]])
}

names(obj) <- period

rental_grp <- diff(log(obj))
