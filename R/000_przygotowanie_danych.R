#### przygotowanie danych ####

# source("https://bioconductor.org/biocLite.R")
# biocLite("RTCGA")
# biocLite("RTCGA.clinical")
# biocLite("RTCGA.mutations")
# biocLite("RTCGA.rnaseq")

library(RTCGA)
library(RTCGA.clinical)
library(RTCGA.mutations)
library(RTCGA.rnaseq)

survivalTCGA(BRCA.clinical, OV.clinical, HNSC.clinical, extract.names = TRUE,
             extract.cols = 'patient.drugs.drug.therapy_types.therapy_type') -> survival.data
mutationsTCGA(BRCA.mutations, OV.mutations, HNSC.mutations) -> mutations.data
expressionsTCGA(BRCA.rnaseq, OV.rnaseq, HNSC.rnaseq) -> expressions.data

survival.data[, 3] <- gsub(".clinical", "", survival.data[, 3], fixed = TRUE)
colnames(survival.data)[3:5] <- c("cancer", "status", "drug_therapy")

library(dplyr);library(tidyr)
mutations.data[, c(1,3)] %>% count(Hugo_Symbol) %>% arrange(desc(n))
  
final.data <- survival.data %>%
  left_join(mutations.data[, c(1,3)] %>%
              mutate(bcr_patient_barcode = substr(as.character(bcr_patient_barcode), 1, 12)) %>%
              filter(Hugo_Symbol == "TP53") %>%
              rename(TP53 = Hugo_Symbol)) %>%
  left_join(mutations.data[, c(1,3)] %>%
              mutate(bcr_patient_barcode = substr(as.character(bcr_patient_barcode), 1, 12)) %>%
              filter(Hugo_Symbol == "TTN") %>%
              rename(TTN = Hugo_Symbol)) %>%
  left_join(mutations.data[, c(1,3)] %>%
              filter(substr(bcr_patient_barcode, 14, 15) == '01') %>%
              mutate(bcr_patient_barcode = substr(as.character(bcr_patient_barcode), 1, 12)) %>%
              filter(Hugo_Symbol == "PIK3CA") %>%
              distinct() %>%
              rename(PIK3CA = Hugo_Symbol)) %>%
  left_join(expressions.data %>%
              filter(substr(bcr_patient_barcode, 14, 15) == '01') %>%
              mutate(bcr_patient_barcode = substr(bcr_patient_barcode, 1, 12)))#,
                     # is_tumour = substr(bcr_patient_barcode, 14, 15) == '01'))


final.data <- final.data[, c(1:8, 345:350)]
final.data$TP53 <- ifelse(is.na(final.data$TP53), FALSE, TRUE)
final.data$TTN <- ifelse(is.na(final.data$TTN), FALSE, TRUE)
final.data$PIK3CA <- ifelse(is.na(final.data$PIK3CA), FALSE, TRUE)

to_name <- unlist(strsplit(colnames(final.data)[9:14], "|", fixed = TRUE) %>% lapply(function(x){ x[1]}))

colnames(final.data)[9:14] <- to_name

# nrow(final.data)
# nrow(distinct(final.data))

final.data <- distinct(final.data)
# juz sa pojedynczo - final.data %>% distinct %>% count(bcr_patient_barcode) %>% arrange(desc(n))

write.csv(final.data, row.names = FALSE, quote = TRUE, file = 'bio_data.csv')
