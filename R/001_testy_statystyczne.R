#

#### wczytanie danych ####
bio_data <- read.csv('bio_data.csv') # albo pelna sciezka do pliku
head(bio_data)    # naglowek danych / pierwsze 6 rekordow
dim(bio_data)     # wymiary danych, liczba wierszy i kolumn
View(bio_data)    # podgląd danych

#### Opis zmiennych ####
# times               - czas pacjenta przebywania pod obserwacja
# bcr_patient_barcode - unikalny kod pacjenta
# cancer              - jakim nowotworem dotkniety byl pacjent
# status              - czy pacjent zmarl / 1 = tak, 0 = nie
# drug_therapy        - typ terapii 
# TP53   - czy pacjent mial mutacje danego genu w pobranej probce nowotworowej
# TTN    - czy pacjent mial mutacje danego genu w pobranej probce nowotworowej
# PIK3CA - czy pacjent mial mutacje danego genu w pobranej probce nowotworowej
# ADCY5     - ekspresja danego genu w próbce nowotworowej
# ADCY6
# ADCY7
# ADCY8
# ADCY9
# ADCYAP1R1
summary(bio_data)


#### podstawowe wizualizacje ####
hist(bio_data$times)
hist(bio_data$ADCY5)
hist(bio_data$ADCY6)

# install.packages(ggplot2)
library(ggplot2)
ggplot(data = bio_data, aes(x = ADCY5)) + geom_histogram()
ggplot(data = bio_data, aes(x = ADCY5)) + geom_histogram() + facet_grid(status~.)
ggplot(data = bio_data, aes(x = ADCY5)) + geom_histogram(bins = 100) + facet_grid(.~status)

ggplot(bio_data, aes(x = TP53, y = ADCY9)) + geom_boxplot()
ggplot(bio_data, aes(TTN, log(ADCYAP1R1+1))) + geom_boxplot()

#### testy ####