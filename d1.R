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
