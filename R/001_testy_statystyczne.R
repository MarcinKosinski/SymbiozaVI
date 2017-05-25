#

#### wczytanie danych ####
bio_data <- read.csv('data/bio_data.csv') # albo pelna sciezka do pliku
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
ggplot(bio_data, aes(as.factor(status), log(ADCYAP1R1+1))) + geom_boxplot()
ggplot(bio_data, aes(cancer, log(ADCYAP1R1+1))) + geom_boxplot()

#### testy ####


# normalnosc rozkladu -----------------------------------------------------

shapiro.test(bio_data$ADCYAP1R1)
shapiro.test(bio_data[, "ADCYAP1R1"])
shapiro.test(bio_data$ADCY5)
shapiro.test(bio_data$ADCY6)
shapiro.test(bio_data$ADCY7)
shapiro.test(bio_data$ADCY8)


# Test rangowy Kruskala-Wallis'a dla > 2 grup -----------------------------
kruskal.test(bio_data$ADCYAP1R1, g = bio_data$cancer)
# istnieje podstawa do odrzucenia hipotezy zerowej o tym, ze rozklady sa sobie rowne



# Test rangowy Wilcoxona (Manna-Whitneya) dla 2 grup ----------------------
# przygotujmy podzbior dotyczacy tylko BRCA i zawierajacy dane odnosnie ADCY8
# na kilka sposobow, co komu bardziej przypasuje
# 1)
bio_data_ADCY8_BRCA <- bio_data$ADCY8[bio_data$cancer == "BRCA"]
# 2)
bio_data_ADCY8_BRCA <- bio_data[bio_data$cancer == "BRCA", "ADCY8"]
# 3)
bio_data_BRCA <- subset(bio_data, cancer == "BRCA")
bio_data_ADCY8_BRCA <-  bio_data_BRCA$ADCY8

# podobne dane ale dla OV i HNSC
bio_data_ADCY8_OV <- bio_data$ADCY8[bio_data$cancer == "OV"]
bio_data_ADCY8_HNSC <- bio_data$ADCY8[bio_data$cancer == "HNSC"]
bio_data_ADCY8_HNSC

# Testy Wilcoxona dla 2ch grup - kazdy z kazdym
wilcox.test(x = bio_data_ADCY8_BRCA, y = bio_data_ADCY8_OV)
wilcox.test(x = bio_data_ADCY8_BRCA, y = bio_data_ADCY8_HNSC)
wilcox.test(x = bio_data_ADCY8_OV, y = bio_data_ADCY8_HNSC)
ggplot(bio_data, aes(cancer, ADCY8)) + geom_boxplot()
ggplot(bio_data, aes(cancer, log(ADCY8+1))) + geom_boxplot()
# ggplot(bio_data, aes(cancer, log(log(ADCY8+1)+1))) + geom_boxplot()


# Albo wielokrotne porownania w tescie Wilcoxona --------------------------
pairwise.wilcox.test(bio_data$ADCY8, bio_data$cancer)

# alternatywy w tescie
wilcox.test(x = bio_data_ADCY8_OV, y = bio_data_ADCY8_HNSC, alternative = "greater")
wilcox.test(x = bio_data_ADCY8_OV, y = bio_data_ADCY8_HNSC, alternative = "less")


# test Chi^2 / Chi-kwadrat ------------------------------------------------
tabela_cancer_status <- table(bio_data$status, bio_data$cancer)
tabela_cancer_status
chisq.test(tabela_cancer_status)
?chisq.test


# test T-studenta ---------------------------------------------------------
head(sleep)
nrow(sleep)
?sleep
# Data which show the effect of two soporific drugs 
# (increase in hours of sleep compared to control) on 10 patients.
shapiro.test(sleep$extra)
t.test(extra ~ group, data = sleep)


# ANOVA - analiza wariancji -----------------------------------------------
head(npk)
?npk
# A classical N, P, K (nitrogen, phosphate, potassium)
# factorial experiment on the growth of peas conducted on 6 blocks.
# Each half of a fractional factorial design confounding the 
# NPK interaction was used on 3 of the plots.

# zalozenie normalnosci rozkladu
shapiro.test(npk$yield)
# i homogenicznosci (jednostajnosci) wariancji
bartlett.test(npk$yield, npk$block)
ggplot(data = npk, aes(x = block, y = yield)) + geom_point() + theme_minimal()
ggplot(data = npk, aes(x = block, y = yield, col = N)) + geom_point() + theme_minimal()
ggplot(data = npk, aes(x = block, y = yield, col = N, shape = P)) + geom_point() + theme_minimal()
ggplot(data = npk, aes(x = block, y = yield, col = N, shape = P, size = K)) + geom_point() + theme_minimal()

npk.aov <- aov(yield ~ block, npk) 
summary(npk$block) # summary na wektorze
summary(npk.aov) # dziala inaczej niz na modelu
class(npk$block)
class(npk.aov)

# dwuczynnikowa
summary(npk$N)
summary(aov(yield ~ block + N, npk))
# trzyczynnikowa z interakcjami
summary(npk$P)
table(npk$P, npk$N)
summary(aov(yield ~ block + N*P, npk))


# ANOVA a regresja liniowa ------------------------------------------------
shapiro.test(npk$yield)
lm(yield ~ block + N*P, data = npk) # model liniowy
summary(lm(yield ~ block + N*P, data = npk)) # model liniowy

# Test Log-Rank -----------------------------------------------------------
library(survival) # dostepny w podstawowej dystrybucji R
head(ovarian)
survdiff(formula = Surv(times, status) ~ cancer,
         data=bio_data)

# install.packages('survminer')
library(survminer)
fit <- survfit(formula = Surv(times, status) ~ cancer, data = bio_data)
ggsurvplot(fit, data = bio_data)
ggsurvplot(fit, data = bio_data, risk.table = TRUE)
ggsurvplot(fit, data = bio_data, risk.table = TRUE, xlim = c(0,2000), break.time.by = 500)
