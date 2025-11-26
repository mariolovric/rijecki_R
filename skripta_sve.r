################################################################################
#               DATA FRAMES I OSNOVNA MANIPULACIJA PODATAKA                    #
################################################################################

# =============================================================================
# 1. UPOZNAVANJE S R-om
# =============================================================================

# Znakom ljestve (engl. hashtag) započinju komentari koje kod ne čita

# Razmaci nisu bitni u R-u
# RazmacinisubitniuRu

# Decimalni separator u R-u je . (točka)

# Osnovne operacije
1+2
5-2

6*3
9/3+2*1

# Ako želimo kao rezultat dobiti neki tekstualni oblik, moramo koristiti jednostruke ili dvostruke navodnike
b 
# Error: object 'b' not found

"b"
'b'
b <- 75

# Rezultate vidimo u konzoli
# Ti rezultati nisu spremljeni, dakle moramo ih "dodijeliti" nekoj varijabli 
a <- 1+2
p <- 3

# Ovaj kod je sad spremljen i mozemo ga "dozvati"
a

# Ili
print(a) # pokazuje rezultat u konzoli



# Znakovi jednako (=) i <- imaju isto značenje
# Isto kao i kod razmaka u kodu, tijekom kodiranja i s iskustvom cete naučiti
# "jezik" zajednice i što se češće koristi (<-)
# Alt + - (minus)
b=10+20
b

a + B

# Malo i veliko slovo je također bitno u R-u


# =============================================================================
# 2. PRIPREMA RADNOG OKRUŽENJA
# =============================================================================


# Provjera i postavljanje radnog direktorija
getwd()  # gdje se trenutno nalazimo?

# setwd("put/do/vašeg/direktorija")  # postavite svoj direktorij
setwd()

# Instalacija i učitavanje paketa
# install.packages("tidyverse")  # samo prvi put!
# install.packages("readxl")
# install.packages("writexl")

library(tidyverse)
library(readxl)
library(writexl)
library(ggplot2)
library(dplyr)

# Provjera verzije R-a
getRversion()
stopifnot(getRversion() >= "4.0.0")


# =============================================================================
# 3. VEKTORI
# =============================================================================


# Vektori su temeljna struktura u R-u
# Jednostavna, linearna struktura podataka 
# Mogu sadržavati više vrijednosti istog tipa (brojeve, tekst, logičke vrijednosti)
brojevi <- c(10, 20, 30, 40)
imena <- c("Ana", "Marko", "Ivana", "Petar")
logika <- c(TRUE, FALSE, TRUE, TRUE)

# Osnovne operacije
mean(brojevi)
length(imena)
sum(logika)  # TRUE = 1, FALSE = 0

# Prethodni rezultati nisu spremljeni
# Ako ih želimo spremiti, moramo ih "dodijeliti" nekoj varijabli 
srv <- mean(brojevi)

print(a) # pokazuje rezultat u konzoli
View(a) # otvara rezultat kao novi tab (source)

# Neke od funkcija koje možete primijeniti na numeričke vektore:
#sum()
#mean()
#ceiling()
#floor()
#trunc()
#round()
#cos()


# ZADATAK 1: 
# Kreirajte numerički vektor koji sadrži pet ocjena testova
# Izračunajte mean, median, sd

v_num <- c(4, 3, 5, 5, 2)
mean_v_num <- mean(v_num)
median_v_num <- median(v_num)
sd_v_num <- sd(v_num)

# Brisanje čitavog vektora
remove(v_num)
v_num

# Indeksiranje
brojevi[3]        # treći element
brojevi[c(1,3,5)] # prvi, treći i peti element
brojevi[brojevi > 25]  # elementi veći od 25
brojevi[1:3]

# =============================================================================
# 4. KREIRANJE DATA FRAMES
# =============================================================================


# Data frame = tablica s različitim tipovima podataka

# PRIMJER: Ručno kreiranje data frame-a
studenti <- data.frame(
  id = 1:8,
  ime = c("Ana", "Ivan", "Maja", "Petar", "Luka", "Sara", "Marko", "Nina"),
  spol = c("F", "M", "F", "M", "M", "F", "M", "F"),
  dob = c(20, 21, 20, 22, 21, 20, 23, 19),
  bodovi = c(88, 75, 92, 60, 79, 85, 58, 95)
)

View(studenti)  # otvara tablicu
print(studenti)

# PRIMJER: Kreiranje iz postojećih vektora
id_pacijenta <- 1:6
dijagnoza <- c("A", "B", "A", "C", "B", "C")
dob_pacijenta <- c(45, 52, 38, 61, 43, 55)
krvni_tlak <- c(120, 140, 110, 150, 130, 145)

pacijenti <- data.frame(
  id = id_pacijenta,
  dijagnoza = dijagnoza,
  dob = dob_pacijenta,
  tlak = krvni_tlak
)

View(pacijenti)


# ZADATAK 2:
# Kreirajte data frame pod nazivom "proizvodi" koji sadrži:
# - id proizvoda (1 do 5)
# - naziv proizvoda (najmanje 5 proizvoda po želji)
# - cijena (numeričke vrijednosti)
# - na_stanju (logičke vrijednosti: TRUE ili FALSE)
# Spremite ga i pogledajte pomoću View()

proizvodi <- data.frame(
  id = 1:5,                              
  naziv = c("Mlijeko", "Kruh", "Jaja", "Sir", "Jogurt"),  
  cijena = c(6.50, 4.20, 12.00, 25.00, 3.80),              
  na_stanju = c(TRUE, TRUE, FALSE, TRUE, FALSE)           
)

View(proizvodi)      


# ZADATAK 3:
# Kreirajte data frame "gradovi" s kolonama:
# - grad (imena 6 gradova)
# - populacija (broj stanovnika)
# - drzava (u kojoj se državi nalazi)
# - primorski (logička vrijednost - je li grad na moru?)

gradovi <- data.frame(
  grad = c("Zagreb", "Split", "Rijeka", "Osijek", "Zadar", "Dubrovnik"),
  populacija = c(790000, 178000, 128000, 108000, 75000, 42000),
  drzava = c("Hrvatska", "Hrvatska", "Hrvatska", "Hrvatska", "Hrvatska", "Hrvatska"),
  primorski = c(FALSE, TRUE, TRUE, FALSE, TRUE, TRUE)
)

View(gradovi)


# =============================================================================
# 5. UČITAVANJE PODATAKA IZ DATOTEKA
# =============================================================================


# PRIMJER: Učitavanje TXT datoteke
# Datoteka podaci_vjezba.txt je u radnom direktoriju
podaci <- read.table(
  file = "podaci_vjezba.txt",
  header = TRUE,
  sep = "\t",  # tab-separated
  stringsAsFactors = FALSE
)

View(podaci)



# PRIMJER: Učitavanje pomoću URL-a
# Učitavamo na isti način kao i .txt samo stavimo URL kao file
web <- read.table(file = 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data',
                  sep = ',',
                  header = F)
View(web)


# PRIMJER: Učitavanje .csv datoteka
df_csv <- read.csv('podaci_vjezba.csv')
View(df_csv)

# PRIMJER: Učitavanje .xlsx datoteka
# Preporučljivo je učitavnje .txt datoteka umjesto .xlsx datoteka
# Excel može imati tekst umjesto brojeva, prazne ćelije, itd. 
# R neće znati to pročitati ili neće pročitati na način na koji želimo

library(readxl)

df1 <- read_excel("podaci_vjezba.xlsx")
View(df1)

# Naredba automatski otvara prvi list u Excelu
# Za odabir nekog drugog lista potrebno je navesti ime:
d <- read_excel("podaci_vjezba.xlsx", 
                sheet = "Sheet2")
View(d)


# =============================================================================
# 6. PREGLED I EKSPLORACIJA PODATAKA
# =============================================================================


# Osnovne funkcije za pregled
head(podaci)      # prvih 6 redova
tail(podaci)      # zadnjih 6 redova
head(podaci, 10)  # prvih 10 redova

# Struktura i sažetak
str(podaci)       # tipovi varijabli
summary(podaci)   # statistički sažetak
dim(podaci)       # broj redova i stupaca
nrow(podaci)      # broj redova
ncol(podaci)      # broj stupaca

# Nazivi stupaca i redova
colnames(podaci)
names(podaci)
rownames(podaci)

# Preimenovanje stupaca
colnames(podaci)[1] <- "drzava_kod"  # prvi stupac
colnames(podaci)

# Ili sve odjednom:
# colnames(podaci) <- c("novi_naziv1", "novi_naziv2", ...)

# Pristup podacima
podaci$age              # pristup jednom stupcu
podaci[, "age"]         # isto, ali drugačija sintaksa
podaci[1:5, ]          # prvih 5 redova, svi stupci
podaci[, c("age", "sex")]  # odabir više stupaca
podaci[1:10, c("age", "sex")]  # prvih 10 redova, 2 stupca

# Jedinstvene vrijednosti
unique(podaci$sex)
table(podaci$sex)  # frekvencijska tablica


# ZADATAK 4:
# Učitajte datoteku "podaci_vjezba.csv" i:
# a) Provjerite koliko ima redaka i stupaca
# b) Prikažite prvih 15 redaka
# c) Provjerite koje su jedinstvene vrijednosti u stupcu "rural_urban"
# d) Napravite frekvencijsku tablicu za stupac "sex"

podaci <- read.table("podaci_vjezba.csv", 
                     header = TRUE, 
                     sep = ",")

# a) Provjerite koliko ima redaka i stupaca
dim(podaci)          

# b) Prikažite prvih 15 redaka
head(podaci, 15)

# c) Provjerite koje su jedinstvene vrijednosti u stupcu "rural_urban"
unique(podaci$rural_urban)

# d) Napravite frekvencijsku tablicu za stupac "sex"
table(podaci$sex)


# ZADATAK 5:
# Na skupu podataka "studenti" (koji smo ranije kreirali):
# a) Ispišite imena svih stupaca
# b) Promijenite naziv stupca "bodovi" u "rezultat"
# c) Pristupite trećem retku svih podataka
# d) Pristupite stupcima "ime" i "dob"

# a) Ispišite imena svih stupaca
colnames(studenti)

# b) Promijenite naziv stupca "bodovi" u "rezultat"
colnames(studenti)[5] <- "rezultat"

# c) Pristupite trećem retku svih podataka
studenti[3, ]

# d) Pristupite stupcima "ime" i "dob"
studenti[, c("ime", "dob")]

##### IVA ######

# PRIMJER: Ručno kreiranje data frame-a
studenti <- data.frame(
  id = 1:8,
  ime = c("Ana", "Ivan", "Maja", "Petar", "Luka", "Sara", "Marko", "Nina"),
  spol = c("F", "M", "F", "M", "M", "F", "M", "F"),
  dob = c(20, 21, 20, 22, 21, 20, 23, 19),
  bodovi = c(88, 75, 92, 60, 79, 85, 58, 95)
)


podaci <- read.table(
  file = "podaci_vjezba.txt",
  header = TRUE,
  sep = "\t",  # tab-separated
  stringsAsFactors = FALSE
)

View(podaci)

# =============================================================================
# 7. MANIPULACIJA PODATAKA - dplyr paket
# =============================================================================


library(dplyr)

# Glavni alati: filter(), select(), arrange(), mutate()

# PRIMJER: filter() - filtriranje redova

# Samo muški spol
male <- filter(podaci, sex == "M")
View(male)

# Djeca starija od 10 mjeseci
starija_djeca <- filter(podaci, age > 10)

# Kombinacija uvjeta (AND - i)
male_stariji <- filter(podaci, sex == "M", age > 10)

# Kombinacija uvjeta (OR - ili)
comb_1 <- filter(podaci, age < 5 | age > 15)

# NOT - negacija
comb_2 <- filter(podaci, sex != 1)  # sve osim muških




# PRIMJER: select() - odabir stupaca

# Odabir nekoliko stupaca
mali_skup <- select(podaci, age, sex, weight_in_kg)
View(mali_skup)

# Odabir raspona stupaca
raspon <- select(podaci, age:haemoglobin_level)

# Uklanjanje stupaca
ukloni <- select(podaci, -state_code, -district_code)

# Kombinacija select i filter
# Korak 1: Filtriranje (samo žensku djecu - sex == F)
filtrirano <- filter(podaci, sex == "F")
# Korak 2: Odabir stupaca
rezultat <- select(filtrirano, age, weight_in_kg, length_height_cm)
# Korak 3: Prikaz rezultata
View(rezultat)
print(rezultat)


# PRIMJER: arrange() - sortiranje

# Sortiranje po dobi (uzlazno)
sort <- arrange(podaci, age)

# Sortiranje silazno
sort_silazno <- arrange(podaci, desc(age))

# Sortiranje po više stupaca
sort_stupci <- arrange(podaci, sex, desc(age))


# PRIMJER: mutate() - dodavanje/transformacija stupaca

# Dodavanje novog stupca
studenti_bodovi <- mutate(studenti,
                          bonus_bodovi = rezultat + 5,
                          dupli_rezultat = rezultat * 2)
View(studenti_bodovi)


# Transformacija težine iz kg u lbs (funte)
podaci_lbs <- mutate(podaci, weight_lbs = weight_in_kg * 2.20462)
View(podaci_lbs)


# Napredniji primjer s funkcijom ifelse()
studenti_prolaz <- mutate(studenti, 
                          prolaz = rezultat >= 70,
                          ocjena = ifelse(rezultat >= 90, "A",
                                        ifelse(rezultat >= 80, "B",
                                             ifelse(rezultat >= 70, "C", "F"))))
View(studenti_prolaz)


# ZADATAK 6:
# Na skupu "podaci":
# a) Filtrirajte samo djecu čija je težina veća od 10 kg
# b) Odaberite stupce: age, sex, weight_in_kg, length_height_cm
# c) Sortirajte rezultat po težini (silazno)
# d) Spremite rezultat kao novi objekt "djeca_teza"

# a) Filtrirajte samo djecu čija je težina veća od 10 kg
korak1 <- filter(podaci, weight_in_kg > 10)

# Provjera koliko djece ima težinu > 10 kg
nrow(korak1)  # npr. 450 djece

# b) Odaberite stupce: age, sex, weight_in_kg, length_height_cm
korak2 <- select(korak1, age, sex, weight_in_kg, length_height_cm)

# Provjera - trebamo imati samo 4 stupca
ncol(korak2)  # 4 stupca
colnames(korak2)  # provjera naziva

# c) Sortirajte rezultat po težini (silazno)
korak3 <- arrange(korak2, desc(weight_in_kg))

# Provjera - prvo dijete bi trebalo imati najveću težinu
head(korak3)

# d) Spremite rezultat kao novi objekt "djeca_teza"
djeca_teza <- korak3

# Finalna provjera rezultata
View(djeca_teza)
head(djeca_teza)
dim(djeca_teza)

# ZADATAK 7:
# Na skupu "studenti":
# a) Dodajte novi stupac "postotak" koji računa rezultat/95*100
# b) Dodajte stupac "kategorija_dob" koji ima vrijednosti:
#    - "mladi" za dob <= 20
#    - "stariji" za dob > 20
# c) Filtrirajte samo studente s "rezultat" >= 90
# d) Prikažite rezultat

# a) Dodajte novi stupac "postotak" koji računa rezultat/100*100
studenti$postotak <- (studenti$rezultat / 95) * 100

# Provjera
head(studenti)

# b) Dodajte stupac "kategorija_dob" s vrijednostima:
#    - "mladi" za dob <= 20
#    - "stariji" za dob > 20

studenti <- mutate(studenti, 
                   kategorija_dob = ifelse(dob <= 20, "mladi", "stariji"))

# Provjera
head(studenti)
table(studenti$kategorija_dob)  # koliko mladih, koliko starijih

# c) Filtrirajte samo studente s "rezultat" >= 90
studenti_prolaz <- filter(studenti, rezultat >= 90)

# d) Prikažite rezultat
View(studenti_prolaz)
print(studenti_prolaz)


# =============================================================================
# 8. PIPE OPERATOR %>%
# =============================================================================


# dplyr, tidyverse
# Jednostavno povezivanje dijelova koda u bolji i čitkiji kod
# Povezivanje više naredbi bez da svaka naredba vraća objekt, već je rezultat jedan objekt
# Bez spremanja rezultata međukoraka
# %>% 
# Čita se kao "then" (zatim)
# Ctrl + Shift + M (Windows) 
# Shift + Cmd + M (Mac) 

# Primjeri:
log10(100)
100 %>% log10()

sqrt(log(cos(sin(pi))))
pi %>% sin %>% cos %>% log %>% sqrt

sin(pi)
pi %>% sin()


# Bez pipe-a (teško za čitanje):
rezultat1 <- filter(podaci, sex == "F") # 1. filtriranje ženskog spola
rezultat2 <- select(rezultat1, age, weight_in_kg) # 2. odabir dva stupca
rezultat3 <- arrange(rezultat2, desc(weight_in_kg)) # 3. sortiranje prema težini

# S pipe-om (jasnije):
rezultat <- podaci %>%
  filter(sex == "F") %>%
  select(age, weight_in_kg) %>%
  arrange(desc(weight_in_kg))


# PRIMJER: Kompleksna analiza
analiza <- podaci %>%
  filter(age >= 12, age <= 50) %>%
  select(age, sex, weight_in_kg, length_height_cm) %>%
  mutate(bmi = weight_in_kg / ((length_height_cm/100)^2)) %>%
  arrange(desc(bmi)) %>%
  head(20)

View(analiza)


# Agregacija podataka pomoću %>%

# 1. summarise() bez grupiranja - za cijeli dataset
ukupna_statistika <- podaci %>%
  summarise(
    n = n(),
    prosjek_tezina = mean(weight_in_kg, na.rm = TRUE),
    sd_tezina = sd(weight_in_kg, na.rm = TRUE)
  )
print(ukupna_statistika)


# 2. summarise() sa group_by() - po grupama
prosjek_po_spolu <- podaci %>%
  group_by(sex) %>%
  summarise(
    n = n(),
    prosjek_tezina = mean(weight_in_kg, na.rm = TRUE),
    sd_tezina = sd(weight_in_kg, na.rm = TRUE),
    )
print(prosjek_po_spolu)


# ZADATAK 8:
# Koristeći pipe operator na skupu "podaci":
# a) Filtrirajte djecu dobi između 6 i 18 mjeseci
# b) Odaberite stupce: age, sex, weight_in_kg, haemoglobin_level
# c) Dodajte novi stupac "anemija" (TRUE ako haemoglobin < 11, FALSE inače)
# d) Grupirajte po spolu
# e) Izračunajte prosjek težine i broj djece po spolu
# f) Spremite kao "analiza_dobi"


podaci %>%
  filter(age >= 6, age <= 18) %>%                    # a) dob između 6-18 mjeseci
  select(age, sex, weight_in_kg, haemoglobin_level) %>%  # b) odabir stupaca
  mutate(anemija = haemoglobin_level < 11)


analiza_dobi <- podaci %>%
  filter(age >= 6, age <= 18) %>%                    # a) dob između 6-18 mjeseci
  select(age, sex, weight_in_kg, haemoglobin_level) %>%  # b) odabir stupaca
  mutate(anemija = haemoglobin_level < 11) %>%      # c) novi stupac anemija
  group_by(sex) %>%                                  # d) grupiranje po spolu
  summarise(                                         # e) izračun statistika
    prosjek_tezine = mean(weight_in_kg, na.rm = TRUE),
    broj_djece = n()
  )

# Prikaz rezultata
print(analiza_dobi)
View(analiza_dobi)


# ZADATAK 9:
# Napišite pipe kod koji:
# a) Uzima skup "studenti"
# b) Dodaje stupac "prolaz" (TRUE/FALSE prema bodovima >= 70)
# c) Filtrira samo studente koji su prošli
# d) Sortira po bodovima (silazno)
# e) Prikazuje samo ime, bodove i prolaz

rezultat <- studenti %>%
  mutate(prolaz = rezultat >= 70) %>%               # b) jednostavna provjera
  filter(prolaz == TRUE) %>%                        # c) samo prolazni
  arrange(desc(rezultat)) %>%                       # d) sortiranje
  select(ime, rezultat, prolaz)                     # e) odabir stupaca

print(rezultat)


# =============================================================================
# 9. SPREMANJE PODATAKA
# =============================================================================


# Spremanje kao TXT
write.table(studenti_prolaz,
            file = "studenti_rezultati.txt",
            sep = "\t",
            row.names = FALSE,
            col.names = TRUE)

# Spremanje kao CSV

library(readr)
write_csv(studenti_prolaz, "studenti_rezultati.csv")

# Spremanje kao Excel

library(writexl)
write_xlsx(studenti_prolaz, "studenti_rezultati.xlsx")


# =============================================================================
# 10. RUKOVANJE S VRIJEDNOSTIMA KOJE NEDOSTAJU (NA)
# =============================================================================


# Provjera NA vrijednosti
sum(is.na(podaci))  # ukupan broj NA
colSums(is.na(podaci))  # broj NA po stupcu

# Uklanjanje redova s NA
podaci_bez_na <- na.omit(podaci)

# Uklanjanje NA samo iz određenih stupaca
podaci <- podaci %>%
  filter(!is.na(weight_in_kg), !is.na(length_height_cm))

colSums(is.na(podaci))

# Zamjena NA s određenom vrijednošću
podaci$haemoglobin_level[is.na(podaci$haemoglobin_level)] <- median(podaci$haemoglobin_level, na.rm = TRUE)
colSums(is.na(podaci))

# ZADATAK 10:
# Na skupu "podaci":
# a) Provjerite koliko NA vrijednosti ima svaki stupac
# b) Kreirajte novi data frame bez NA vrijednosti u stupcu "weight_in_kg"
# c) Izračunajte prosjek i medijan za "weight_in_kg" (ignorirajući NA)

# a) Provjerite koliko NA vrijednosti ima svaki stupac
colSums(is.na(podaci))

# b) Kreirajte novi data frame bez NA vrijednosti u stupcu "weight_in_kg"
podaci_bez_NA <- podaci[!is.na(podaci$weight_in_kg), ]

# c) Izračunajte prosjek i medijan za "weight_in_kg" (ignorirajući NA)
mean_weight <- mean(podaci$weight_in_kg, na.rm = TRUE)
median_weight <- median(podaci$weight_in_kg, na.rm = TRUE)

mean_weight
median_weight


################################################################################
#                     DESKRIPTIVNA STATISTIKA I VIZUALIZACIJA                  #
################################################################################


# =============================================================================
# 11. DESKRIPTIVNA STATISTIKA
# =============================================================================


# PRIMJER: Numeričke varijable

# Mjere centralne tendencije
mean(podaci$age, na.rm = TRUE)      # prosjek
median(podaci$age, na.rm = TRUE)    # medijan

# Mjere raspršenja
sd(podaci$age, na.rm = TRUE)        # standardna devijacija
var(podaci$age, na.rm = TRUE)       # varijanca
range(podaci$age, na.rm = TRUE)     # raspon (min, max)
IQR(podaci$age, na.rm = TRUE)       # interkvartilni raspon

# Kvantili
quantile(podaci$age, na.rm = TRUE)  # percentili
quantile(podaci$age, probs = c(0.25, 0.5, 0.75, 0.9), na.rm = TRUE)

# Sveobuhvatni pregled
summary(podaci$age)


# PRIMJER: Statistika po grupama

# Korištenje aggregate()
aggregate(weight_in_kg ~ sex, data = podaci, FUN = mean, na.rm = TRUE)
aggregate(weight_in_kg ~ sex, data = podaci, FUN = sd, na.rm = TRUE)


# Jednostavan primjer s group_by()
brojanje_po_spolu <- podaci %>%
  group_by(sex) %>%
  summarise(
    n = n(),
    prosjek = mean(weight_in_kg)
  )
print(brojanje_po_spolu)

# NAPOMENA: NA vrijednosti posljedica su vrijednosti koje nedostaju
# Provjeriti pomoću funkcije colSums(is.na())

# Više funkcija odjednom (dplyr način)
statistika_spol <- podaci %>%
  group_by(sex) %>%
  summarise(
    n = n(),
    prosjek = mean(weight_in_kg),
    medijan = median(weight_in_kg),
    sd = sd(weight_in_kg),
    min = min(weight_in_kg),
    max = max(weight_in_kg),
    se = sd(weight_in_kg) / sqrt(n())  # standardna pogreška
  )

print(statistika_spol)


# ZADATAK 11:
# Na skupu "podaci":
# a) Izračunajte prosjek, medijan i SD za "length_height_cm"
# b) Napravite frekvencijsku tablicu za "rural_urban"
# c) Grupirajte podatke po "sex" i izračunajte statistiku za "age"

# a) Prosjek, medijan i SD za "length_height_cm"
mean(podaci$length_height_cm, na.rm = TRUE)
median(podaci$length_height_cm, na.rm = TRUE)
sd(podaci$length_height_cm, na.rm = TRUE)

# b) Frekvencijska tablica za "rural_urban"
table(podaci$rural_urban)

# c) Grupiranje po "sex" i izračun statistike za "age"
podaci %>%
  group_by(sex) %>%
  summarise(
    prosjek_dob = mean(age, na.rm = TRUE),
    medijan_dob = median(age, na.rm = TRUE),
    sd_dob = sd(age, na.rm = TRUE)
  )


# ZADATAK 12:
# Analizirajte "haemoglobin_level":
# a) Koliko ima NA vrijednosti?
# b) Izračunajte min, Q1, median, Q3, max
# c) Grupirajte po "sex" i usporedite prosjeke
# d) Odredite koliko djece ima hemoglobin < 10

# a) Broj NA u haemoglobin_level
sum(is.na(podaci$haemoglobin_level))

# b) Min, Q1, median, Q3, max
summary(podaci$haemoglobin_level)

# c) Prosjek po "sex"
aggregate(haemoglobin_level ~ sex, 
          data = podaci, FUN = mean, na.rm = TRUE)

# d) Koliko djece ima hemoglobin < 10
sum(podaci$haemoglobin_level < 10, na.rm = TRUE)


# =============================================================================
# 12. OSNOVE VIZUALIZACIJE - ggplot2
# =============================================================================


library(ggplot2)

# ggplot2 sintaksa:
# ggplot(data, aes(x = ..., y = ...)) + geom_*()


# Najjednostavniji plot
ggplot(podaci, aes(x = age, y = weight_in_kg)) +
  geom_point()

# Objašnjenje:
# - ggplot(podaci, ...) --> koji dataset koristimo
# - aes(x = age, y = weight_in_kg) --> mapiranje podataka na osi
# - geom_point() --> tip grafa (točke)


# Dodavanje boje i naslova
ggplot(podaci, aes(x = age, y = weight_in_kg)) +
  geom_point(color = "steelblue") +
  labs(title = "Dob vs Težina",
       x = "Dob (mjeseci)",
       y = "Težina (kg)")


# PRIMJER: Histogram

ggplot(podaci, aes(x = age)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
  labs(title = "Distribucija dobi",
       x = "Dob (mjeseci)",
       y = "Frekvencija") +
  theme_minimal()


# PRIMJER: Boxplot

ggplot(podaci, aes(x = factor(sex), y = weight_in_kg, fill = factor(sex))) +
  geom_boxplot() +
  scale_fill_manual(values = c("pink", "lightblue"),
                    labels = c("Ženski", "Muški")) +
  labs(title = "Distribucija težine po spolu",
       x = "Spol",
       y = "Težina (kg)",
       fill = "Spol") +
  theme_classic()


# PRIMJER: Scatter plot

ggplot(podaci, aes(x = age, y = weight_in_kg, color = factor(sex))) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE) +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("Muški", "Ženski")) +
  labs(title = "Odnos dobi i težine",
       x = "Dob (mjeseci)",
       y = "Težina (kg)",
       color = "Spol") +
  theme_bw()


# PRIMJER: Bar plot

spol_count <- podaci %>%
  count(sex) %>%
  mutate(sex = factor(sex, labels = c("Muški", "Ženski")))

ggplot(spol_count, aes(x = sex, y = n, fill = sex)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = n), vjust = -0.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Broj djece po spolu",
       x = "Spol",
       y = "Broj djece") +
  theme_minimal() +
  theme(legend.position = "none")


# ZADATAK 13:
# Napravite sljedeće grafove za skup "podaci":
# a) Histogram za "length_height_cm" (crvene boje)
# b) Boxplot za "haemoglobin_level" po spolu
# c) Spremite jedan graf kao PNG (ggsave())


# a) Histogram za "length_height_cm" (crvene boje)
ggplot(podaci, aes(x = length_height_cm)) +
  geom_histogram(fill = "red", color = "black") +
  labs(title = "Histogram visine/dužine (cm)")

# b) Boxplot za "haemoglobin_level" po spolu
ggplot(podaci, aes(x = factor(sex), y = haemoglobin_level)) +
  geom_boxplot() +
  labs(title = "Boxplot hemoglobina po spolu",
       x = "Spol")

# c) Spremanje grafa kao PNG
p <- ggplot(podaci, aes(x = length_height_cm)) +
  geom_histogram(fill = "red", color = "black") +
  labs(title = "Histogram visine/dužine (cm)")

ggsave("histogram_length.png", plot = p, width = 6, height = 4)


# ZADATAK 14:
# Kreirajte scatter plot:
# a) X-os: length_height_cm, Y-os: weight_in_kg
# b) Točke obojite prema spolu
# c) Dodajte regresijsku liniju
# d) Dodajte prikladne naslove i teme

# Scatter plot: X = length_height_cm, Y = weight_in_kg
ggplot(podaci, aes(x = length_height_cm, 
                   y = weight_in_kg,
                   color = sex)) +
  geom_point() +
  geom_smooth(aes(x = length_height_cm, y = weight_in_kg), method = "lm") +
  labs(title = "Povezanost visine i težine",
       x = "Visina (cm)",
       y = "Težina (kg)",
       color = "Spol") +
  theme_minimal()


# =============================================================================
# 13. NAPREDNA VIZUALIZACIJA
# =============================================================================


# Faceting - više grafova odjednom

ggplot(podaci, aes(x = age, y = weight_in_kg)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "loess") +
  facet_wrap(~sex) +
  labs(title = "Rast djece po spolu",
       x = "Dob (mjeseci)",
       y = "Težina (kg)") +
  theme_bw()


# Kombiniranje grafova - library(patchwork)
# install.packages("patchwork")
library(patchwork)

p1 <- ggplot(podaci, aes(x = age)) +
  geom_histogram(fill = "skyblue", bins = 30) +
  theme_minimal()

p2 <- ggplot(podaci, aes(x = factor(sex), y = age)) +
  geom_boxplot(fill = "coral") +
  theme_minimal()

p1 + p2  # crtamo ih jedan do drugog


# Spremanje grafova
graf <- ggplot(podaci, aes(x = age, y = weight_in_kg)) +
  geom_point()

ggsave("moj_graf.png", plot = graf, width = 8, height = 6, dpi = 300)


# ZADATAK 15:
# Napravite kompleksan graf:
# a) Scatter plot (weight vs height)
# b) Odvojite po "rural_urban" koristeći facet_wrap
# c) Dodajte loess smooth liniju
# d) Prilagodite boje, naslove i temu

# Učitavanje podataka (ako već nije učitano)
podaci <- read.table("podaci_vjezba.txt", 
                     header = TRUE, 
                     sep = "\t")


ggplot(podaci, aes(x = length_height_cm,
                   y = weight_in_kg,
                   color = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~ rural_urban) +
  labs(
    title = "Povezanost visine i težine",
    subtitle = "Odvojeno po ruralnim i urbanim područjima",
    x = "Visina (cm)",
    y = "Težina (kg)",
    color = "Spol"
  ) +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold"),
    legend.position = "bottom"
  )


################################################################################
#                           INFERENTNA STATISTIKA                              #
################################################################################


# Učitavanje potrebnih paketa
library(dplyr)
library(ggplot2)
install.packages("car")
library(car)  # za Levene test

# Učitavanje podataka
podaci <- read.table("podaci_vjezba.txt", 
                     header = TRUE, 
                     sep = "\t")


# =============================================================================
# 14. HISTOGRAM
# =============================================================================


# Najjednostavniji način - pogledati oblik distribucije

# PRIMJER: Histogram za težinu
ggplot(podaci, aes(x = weight_in_kg)) +
  geom_histogram()


# Napredniji histogram
ggplot(podaci, aes(x = weight_in_kg)) +
  geom_histogram(bins = 30, fill = "lightblue", color = "black") +
  labs(title = "Distribucija težine djece",
       x = "Težina (kg)",
       y = "Broj djece") +
  theme_minimal()

# Ako je distribucija "zvonolika" (simetrična) → vjerojatno normalna
# Ako je iskrivljena (skewed) → nije normalna


# PRIMJER: Histogram s "gustoćom" (density line)
ggplot(podaci, aes(x = weight_in_kg)) +
  geom_histogram(aes(y = after_stat(density))) +
  geom_density()
  


ggplot(podaci, aes(x = weight_in_kg)) +
  geom_histogram(aes(y = after_stat(density)), 
                 bins = 30, 
                 fill = "lightblue", 
                 color = "black") +
  geom_density(color = "red", size = 1.5) +
  labs(title = "Distribucija težine s krivuljom gustoće",
       subtitle = "Crvena linija pokazuje oblik distribucije",
       x = "Težina (kg)",
       y = "Gustoća") +
  theme_minimal()


# =============================================================================
# 15. Q-Q PLOT
# =============================================================================


# Q-Q plot uspoređuje naše podatke s idealnom normalnom distribucijom
# Ako su točke blizu crvene linije → podaci su normalni

ggplot(podaci, aes(sample = weight_in_kg)) +
  stat_qq() +
  stat_qq_line()



ggplot(podaci, aes(sample = weight_in_kg)) +
  stat_qq() +
  stat_qq_line(color = "red", size = 1) +
  labs(title = "Q-Q plot za težinu",
       subtitle = "Ako su točke blizu crvene linije, podaci su normalni") +
  theme_minimal()

# INTERPRETACIJA:
# Točke blizu linije → normalna distribucija
# Točke daleko od linije → NIJE normalna distribucija


# =============================================================================
# 16. SHAPIRO-WILK TEST 
# =============================================================================


# Ovaj test daje p-vrijednost koja nam govori je li distribucija normalna

# UPOZORENJE: Shapiro test ne radi dobro za velike skupove (>5000)

# PRIMJER: Testirajmo samo distribuciju težine u djece mlađe od 12

podaci %>% filter()

djeca_mlada <- podaci %>% 
  filter(age <= 12, # u novi data frame ulaze samo podaci gdje je age <= 12
         !is.na(weight_in_kg)) # uklanjanje svih redova koji imaju NA vrijednosti

# Provjerimo koliko imamo podataka zbog vjerodostojnosti rezultata
nrow(djeca_mlada)

# Testiranje distribucije
shapiro.test(djeca_mlada$weight_in_kg)


### NAPREDNO ###
# Ako je više od 5000, uzmemo uzorak
# if(nrow(djeca_mlada) > 5000) {
#  uzorak <- sample(djeca_mlada$weight_in_kg, 5000)
#  shapiro.test(uzorak)
# } else {
#  shapiro.test(djeca_mlada$weight_in_kg)
# }

# INTERPRETACIJA:
# p > 0.05 → podaci SU normalno distribuirani
# p < 0.05 → podaci NISU normalno distribuirani


# PRIMJER: Provjera normalnosti po grupama (muška vs ženska djeca)

# Odvojimo djecu po spolu
male <- podaci %>% 
  filter(sex == "M", !is.na(weight_in_kg)) %>% 
  pull(weight_in_kg)

shapiro.test(male)

female <- podaci %>% 
  filter(sex == "F", !is.na(weight_in_kg)) %>% 
  pull(weight_in_kg)

shapiro.test(female)


# ZADATAK 16: Provjera normalnosti za visinu
# Na varijabli "length_height_cm":
# a) Napravite histogram
# b) Napravite Q-Q plot
# c) Provedite Shapiro-Wilk test (na podskupu do 5000 podataka)


# a) Histogram
ggplot(podaci, aes(x = length_height_cm)) +
  geom_histogram(bins = 30, fill = "lightgreen", color = "black") +
  labs(title = "Distribucija visine/dužine djece",
       x = "Visina/Dužina (cm)",
       y = "Broj djece") +
  theme_minimal()

# b) Q-Q plot
ggplot(podaci, aes(sample = length_height_cm)) +
  stat_qq() +
  stat_qq_line(color = "red", size = 1) +
  labs(title = "Q-Q plot za visinu/dužinu") +
  theme_minimal()

# c) Shapiro-Wilk test
shapiro.test(podaci$length_height_cm)


# =============================================================================
# 17. HOMOGENOST VARIJANCI
# =============================================================================

# ZAŠTO JE VAŽNA?
# Za t-test i ANOVA, grupe trebaju imati slične varijance
# (podaci unutar grupa trebaju biti podjednako "razbacani")

# Levene's test - test homogenosti varijanci
# Testirajmo jesu li varijance težine slične između muške i ženske djece

leveneTest(weight_in_kg ~ factor(sex), data = podaci)

# INTERPRETACIJA:
# p > 0.05 → varijance SU homogene (slične) → koristimo obični t-test
# p < 0.05 → varijance NISU homogene → koristimo Welchov t-test


# Vizualizacija varijanci - Boxplot
# Boxplot pokazuje raspršenost podataka
# Duža kutija = veća varijanca
podaci %>%
  filter(!is.na(weight_in_kg)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) 
#%>%
#  ggplot(aes(x = spol_naziv, y = weight_in_kg)) +
#           geom_boxplot()



podaci %>%
  filter(!is.na(weight_in_kg)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = spol_naziv, y = weight_in_kg, fill = spol_naziv)) +
  geom_boxplot() +
  labs(title = "Usporedba raspršenosti težine po spolu",
       x = "Spol",
       y = "Težina (kg)") +
  theme_minimal() +
  theme(legend.position = "none")

# Ako su kutije slične veličine → homogene varijance
# Ako je jedna kutija puno veća → nehomogene varijance


# ZADATAK 17: Homogenost varijanci za hemoglobin
# Testirajte homogenost varijanci za "haemoglobin_level" između:
# a) Muške i ženske djece (sex)
# b) Ruralne i urbane djece (rural_urban)
# c) Napravite boxplotove za obje usporedbe


# a) Levene test - spol
leveneTest(haemoglobin_level ~ factor(sex), data = podaci)

# b) Levene test - rural/urban
leveneTest(haemoglobin_level ~ factor(rural_urban), data = podaci)

# c) Boxplot - spol
podaci %>%
  filter(!is.na(haemoglobin_level)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = spol_naziv, y = haemoglobin_level, fill = spol_naziv)) +
  geom_boxplot() +
  labs(title = "Razina hemoglobina po spolu",
       x = "Spol",
       y = "Hemoglobin") +
  theme_minimal() +
  theme(legend.position = "none")

# Boxplot - rural/urban
podaci %>%
  filter(!is.na(haemoglobin_level)) %>%
  mutate(podrucje = ifelse(rural_urban == "R", "Ruralno", "Urbano")) %>%
  ggplot(aes(x = podrucje, y = haemoglobin_level, fill = podrucje)) +
  geom_boxplot() +
  labs(title = "Razina hemoglobina po području",
       x = "Područje",
       y = "Hemoglobin") +
  theme_minimal() +
  theme(legend.position = "none")


# =============================================================================
# 18. T-TEST - Usporedba dvije grupe
# =============================================================================

# Pitanje: "Je li prosjek grupe A različit od prosjeka grupe B?"

# KORACI ZA T-TEST:
# 1. Provjeri normalnost (Shapiro test ili histogram)
# 2. Provjeri homogenost varijanci (Levene test)
# 3. Odaberi pravi t-test:
#    - Ako su varijance homogene → var.equal = TRUE (Studentov t-test)
#    - Ako NISU homogene → var.equal = FALSE (Welchov t-test)


# PRIMJER: Usporedba težine između muške i ženske djece

# Korak 1: Priprema podataka (ukloni NA)
podaci_clean <- podaci %>%
  filter(!is.na(weight_in_kg), !is.na(sex))

# Korak 2: T-test
rezultat_ttest <- t.test(weight_in_kg ~ sex, 
                         data = podaci_clean, 
                         var.equal = TRUE)  # TRUE jer su varijance homogene

print(rezultat_ttest)

# INTERPRETACIJA:
# p-value < 0.05 → postoji STATISTIČKI ZNAČAJNA razlika između grupa
# p-value > 0.05 → NEMA statistički značajne razlike

# t-value → veličina razlike (što je veći, razlika je veća)
# 95% confidence interval → raspon u kojem se nalazi prava razlika


# Vizualizacija t-testa

rez_t <- rezultat_ttest$p.value

podaci_clean %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = spol_naziv, y = weight_in_kg, fill = spol_naziv)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", 
               shape = 23, size = 4, fill = "white") +
  annotate("text", x = 1.5, y = max(podaci_clean$weight_in_kg, na.rm = TRUE),
           label = rez_t, size = 5) +
  labs(title = "Usporedba težine između spolova",
       subtitle = "Bijeli kvadrat = prosjek (mean)",
       x = "Spol",
       
       y = "Težina (kg)") +
  scale_fill_manual(values = c("skyblue", "pink")) +
  theme_minimal() +
  theme(legend.position = "none")


# ZADATAK 18: T-test za hemoglobin
# Testirajte razliku u "haemoglobin_level" između muške i ženske djece:
# a) Prvo provjerite normalnost (vizualno ili Shapiro test)
# b) Filtrirajte samo pozitivne vrijednosti za "haemoglobin_level"
# c) Provjerite homogenost varijanci (Levene test)
# d) Provedite t-test (odaberite var.equal ovisno o b)
# e) Napravite boxplot s prikazom prosjeka


# a) Normalnost - vizualno
podaci %>%
  filter(!is.na(haemoglobin_level)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = haemoglobin_level)) +
  geom_histogram(bins = 30, fill = "coral", color = "black") +
  facet_wrap(~spol_naziv) +
  theme_minimal()

# b) Filtriranje samo pozitivnih vrijednosti
podaci_pozitivni <- podaci %>%
  filter(haemoglobin_level > 0)

podaci_pozitivni %>%
  filter(!is.na(haemoglobin_level)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = haemoglobin_level)) +
  geom_histogram(bins = 30, fill = "coral", color = "black") +
  facet_wrap(~spol_naziv) +
  theme_minimal()

# c) Homogenost varijanci
leveneTest(haemoglobin_level ~ factor(sex), data = podaci_pozitivni)

# d) T-test (pretpostavimo da su varijance homogene)
ttest_hb <- t.test(haemoglobin_level ~ sex, 
                   data = podaci_pozitivni, 
                   var.equal = TRUE)
print(ttest_hb)

# e) Boxplot s prosjekom

rez_t <- ttest_hb$p.value

podaci_pozitivni %>%
  filter(!is.na(haemoglobin_level)) %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = spol_naziv, y = haemoglobin_level, fill = spol_naziv)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", 
               shape = 23, size = 4, fill = "white") +
  annotate("text", x = 1.5, y = max(podaci$haemoglobin_level, na.rm = TRUE),
           label = rez_t, size = 4) +
  labs(title = "Razina hemoglobina po spolu",
       subtitle = "Bijeli kvadrat = prosjek",
       x = "Spol",
       y = "Hemoglobin") +
  theme_minimal() +
  theme(legend.position = "none")



# ZADATAK 19: T-test za visinu (rural vs urban)
# Testirajte razliku u "length_height_cm" između ruralne i urbane djece:
# a) Provjerite pretpostavke (normalnost i homogenost)
# b) Provedite t-test
# c) Napravite boxplot


# a) Pretpostavke
# Normalnost
podaci %>%
  filter(!is.na(length_height_cm)) %>%
  mutate(podrucje = ifelse(rural_urban == "R", "Ruralno", "Urbano")) %>%
  ggplot(aes(x = length_height_cm)) +
  geom_histogram(bins = 30, fill = "lightgreen", color = "black") +
  facet_wrap(~podrucje) +
  theme_minimal()

# Filtriranje pozitivnih vrijednosti
podaci %>%
  filter(length_height_cm > 0)

# Homogenost
leveneTest(length_height_cm ~ factor(rural_urban), data = podaci)

# b) T-test
ttest_visina <- t.test(length_height_cm ~ rural_urban, 
                       data = podaci, 
                       var.equal = TRUE)
print(ttest_visina)

# c) Boxplot

rez_t <- ttest_visina$p.value

podaci %>%
  filter(!is.na(length_height_cm)) %>%
  mutate(podrucje = ifelse(rural_urban == "R", "Ruralno", "Urbano")) %>%
  ggplot(aes(x = podrucje, y = length_height_cm, fill = podrucje)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", 
               shape = 23, size = 4, fill = "white") +
  annotate("text", x = 1.5, y = max(podaci$length_height_cm, na.rm = TRUE),
           label = rez_t, size = 4) +
  labs(title = "Visina/dužina djece po području",
       subtitle = "Bijeli kvadrat = prosjek",
       x = "Područje",
       y = "Visina/dužina (cm)") +
  theme_minimal() +
  theme(legend.position = "none")


# =============================================================================
# 19. MANN-WHITNEY U TEST - Neparametrijska alternativa t-testu
# =============================================================================

# Koristi se kada podaci NISU normalno distribuirani
# Ne uspoređuje prosjeke, već medijane i rangove


# PRIMJER: Mann-Whitney test za težinu

wilcox_test <- wilcox.test(weight_in_kg ~ sex, data = podaci_clean)
print(wilcox_test)

# INTERPRETACIJA (ista kao kod t-testa):
# p < 0.05 → statistički značajna razlika
# p > 0.05 → nema značajne razlike


# Vizualizacija (ista kao kod t-testa, ali koristimo medijan)

rez_t <- wilcox_test$p.value

podaci_clean %>%
  mutate(spol_naziv = ifelse(sex == "M", "Muški", "Ženski")) %>%
  ggplot(aes(x = spol_naziv, y = weight_in_kg, fill = spol_naziv)) +
  geom_boxplot() +
  stat_summary(fun = median, geom = "point", 
               shape = 23, size = 4, fill = "yellow") +
  annotate("text", x = 1.5, y = max(podaci_clean$weight_in_kg, na.rm = TRUE),
           label = rez_t, size = 4) +
  labs(title = "Mann-Whitney test - Usporedba težine",
       subtitle = "Žuti kvadrat = medijan",
       x = "Spol",
       y = "Težina (kg)") +
  theme_minimal() +
  theme(legend.position = "none")


# ZADATAK 20: Mann-Whitney test
# Za "length_height_cm" između rural i urban djece:
# a) Provedite Mann-Whitney U test
# b) Napravite boxplot s medijanom
# c) Usporedite rezultat s t-testom iz Zadatka 6


# a) Mann-Whitney test
wilcox_visina <- wilcox.test(length_height_cm ~ rural_urban, data = podaci)
print(wilcox_visina)

# b) Boxplot s medijanom

rez_t <- wilcox_visina$p.value

podaci %>%
  filter(!is.na(length_height_cm)) %>%
  mutate(podrucje = ifelse(rural_urban == "R", "Ruralno", "Urbano")) %>%
  ggplot(aes(x = podrucje, y = length_height_cm, fill = podrucje)) +
  geom_boxplot() +
  stat_summary(fun = median, geom = "point", 
               shape = 23, size = 4, fill = "yellow") +
  annotate("text", x = 1.5, y = max(podaci$length_height_cm, na.rm = TRUE),
           label = rez_t, size = 4) +
  labs(title = "Mann-Whitney test - Visina po području",
       subtitle = "Žuti kvadrat = medijan",
       x = "Područje",
       y = "Visina/dužina (cm)") +
  theme_minimal() +
  theme(legend.position = "none")

# c) Usporedba s t-testom
print("T-test p-value:")
print(ttest_visina$p.value)
print("Mann-Whitney p-value:")
print(wilcox_visina$p.value)


# =============================================================================
# 20. ANOVA – Analiza varijance
# =============================================================================

library(dplyr)
library(ggplot2)
library(car)

# 1) Priprema podataka – kreiranje dobnih skupina

podaci_anova <- podaci %>%
  filter(!is.na(weight_in_kg),
         !is.na(age)) %>%
  mutate(age_group = cut(age,
                         breaks = c(0, 12, 24, 36, 85),
                         labels = c("prva", "druga", "treca", "cetvrta")))

# 2) Provjera homogenosti varijanci
leveneTest(weight_in_kg ~ age_group, data = podaci_anova)

# 3) ANOVA test
anova_rezultat <- aov(weight_in_kg ~ age_group, data = podaci_anova)
summary(anova_rezultat)

# 4) Post-hoc test (Tukey)
TukeyHSD(anova_rezultat)

# 5) Jednostavan boxplot
ggplot(podaci_anova, aes(x = age_group, y = weight_in_kg, fill = age_group)) +
  geom_boxplot() +
  labs(title = "Težina po dobnim skupinama (ANOVA)",
       x = "Dobna skupina",
       y = "Težina (kg)") +
  theme_minimal() +
  theme(legend.position = "none")


# =============================================================================
# 21. KRUSKAL-WALLIS – Neparametrijska analiza
# =============================================================================


library(ggplot2)

# 1) Kruskal-Wallis test
kruskal.test(weight_in_kg ~ age_group, data = podaci_anova)

# 2) Jednostavni boxplot
ggplot(podaci_anova, aes(x = age_group, y = weight_in_kg, fill = age_group)) +
  geom_boxplot() +
  labs(title = "Težina po dobnim skupinama (Kruskal-Wallis)",
       x = "Dobna skupina",
       y = "Težina (kg)") +
  theme_minimal() +
  theme(legend.position = "none")



# =============================================================================
# 22. PAKET TABLEONE
# =============================================================================


# Paket tableone omogućuje brzo stvaranje deskriptivnih tablica
# (kakve se koriste u znanstvenim radovima)

library(tableone)

# Osnovna tablica
CreateTableOne(data = podaci)

# Tablica po grupama (spol)
CreateTableOne(data = podaci, 
               strata = "sex")

# Odabir specifičnih varijabli
varijable <- c("age", "weight_in_kg", "haemoglobin_level")

tabela1 <- CreateTableOne(vars = varijable,
                          strata = "sex",
                          data = podaci,
                          test = TRUE)  # dodaje statističke testove
print(tabela1)


# Export u CSV
tabla_df <- print(tabela1, printToggle = FALSE)
write.csv(tabla_df, "table1.csv")

#==========

# Potrebni paketi
install.packages("MASS")


library(MASS)         # Sadrži birthwt set podataka


# Ucitavanje birthwt seta podataka
data(birthwt)

# Pregled podataka
# bwt = težina djeteta  - CILJNA VARIJABLA
# lwt = težina majke 
# age = dob majke
# smoke = pušenje tijekom trudnoće (1=da, 0=ne)
head(birthwt)
summary(birthwt)


###linearna regresija###

#modeliranje i analiza odnosa izmedju jedne zavisne varijable 
#(ciljna varijabla = bwt) i jedne ili vise nezavisnih varijabli (prediktora)

#grafovi za distribuciju podataka
hist(birthwt$lwt, main="Histogram težine majke", xlab="Težina majke (lbs)")
hist(birthwt$bwt, main="Histogram težine djeteta", xlab="Težina djeteta (g)")
plot(bwt ~ lwt, data = birthwt, main="Težina djeteta vs Težina majke")

#predvidjanje težine djeteta (bwt) na temelju težine majke (lwt)

lm_birth <- lm(bwt ~ lwt, data = birthwt)
summary(lm_birth)

#INTERPRETACIJA REZULTATA:
# Pogledajte 'Estimate' za lwt.
# Ako je pozitivan, to sugerira da svaka dodatna jedinica
# težine majke povećava težinu djeteta za x
# P-vrijednost (Pr(>|t|)) manja od 0.05 znači da je odnos značajan.


#ZADATAK

#za isti set podataka (birthwt) testirajte:
#odnos težine djeteta (bwt) i dobi majke (age)

hist(birthwt$age)
plot(bwt ~ age, data = birthwt)

lm_task <- lm(bwt ~ age, data = birthwt)
summary(lm_task)
# Napomena: Ovdje vjerojatno nećete vidjeti jaku linearnu vezu (p-vrijednost > 0.05).



###multilineara regresija###

hist(birthwt$bwt)
hist(birthwt$lwt)
hist(birthwt$age)

# Modeliramo težinu djeteta na temelju težine majke I dobi majke
lm_multi <- lm(bwt ~ lwt + age, data = birthwt)
summary(lm_multi)

#INTERPRETACIJA REZULTATA:
# Estimate (lwt): Koliko težina majke utječe na dijete uz fiksnu dob.
# Estimate (age): Koliko dob majke utječe na dijete uz fiksnu težinu majke.

# U ovom setu podataka 'age' (dob) često nije statistički značajna,
# dok težina majke (lwt) ostaje značajna.



#mozemo izvuci podatke samo za majke koje PUŠE (smoke == 1) i procjenu raditi samo za taj set
pusaci <- subset(birthwt, birthwt$smoke == 1)
# View(pusaci)

# Model samo za pušače
lm_pusaci <- lm(bwt ~ lwt + age, data = pusaci)
summary(lm_pusaci)


#ZADATAK

#za set podataka (birthwt) testirajte:
#odnos težine djeteta (bwt) s težinom majke (lwt) i statusom hipertenzije (ht)
# ht = history of hypertension (1=da, 0=ne)

hist(birthwt$bwt)
# ht je binarna varijabla pa koristimo barplot:
barplot(table(birthwt$ht), main="Distribucija hipertenzije (0=Ne, 1=Da)")

lm_task_2 <- lm(bwt ~ lwt + ht, data = birthwt)
summary(lm_task_2)
# Očekujemo da 'ht' ima negativan koeficijent (hipertenzija smanjuje težinu djeteta).

#### ------------- Decision tree ------------

install.packages("rpart")
library(rpart)       # Za modeliranje
library(rpart.plot)  # Za crtanje stabla

# Ucitavanje podataka
data(iris)

# 2. PODJELA NA TRAIN I TEST (70% - 30%)
# Ovo je kljucni koncept strojno ucenja: učimo na jednom dijelu, testiramo na drugom.

set.seed(123) # Osigurava da svi studenti dobiju iste rezultate

# Jednostavan nacin za odabir redova
# Biramo 70% nasumicnih brojeva redova
indeksi <- sample(1:nrow(iris), 0.7 * nrow(iris))

train_data <- iris[indeksi, ]   # Podaci za učenje
test_data  <- iris[-indeksi, ]  # Podaci za provjeru


# 3. TRENIRANJE MODELA
# Maknuli smo sve komplicirane parametre.
# R ce automatski koristiti "Gini" indeks i standardne postavke.

model <- rpart(Species ~ ., 
               data = train_data, 
               method = "class")


# 4. VIZUALIZACIJA 
# Ovdje studenti vide KAKO računalo razmišlja.
# extra=104 prikazuje postotke i vjerojatnosti na način lak za čitanje.

rpart.plot(model, 
           extra = 104, 
           box.palette = "GnBu",
           main = "Kako model donosi odluke?")


# 5. PREDVIĐANJE
# Model sada gleda testne podatke (bez rješenja) i pogađa vrstu.

predikcije <- predict(model, test_data, type = "class")


# 6. EVALUACIJA (Matrica Zabune)
# Umjesto 'caret' paketa, koristimo običnu tablicu.
# Dijagonala su tocni odgovori.

tablica_tocnosti <- table(Predvidjeno = predikcije, 
                          Stvarno = test_data$Species)

print(tablica_tocnosti)

# Izracun točnosti (broj točnih / ukupno)
tocnost <- sum(diag(tablica_tocnosti)) / sum(tablica_tocnosti)
print(paste("Tocnost modela je:", round(tocnost * 100, 2), "%"))



