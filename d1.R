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