#
# Zunächst installieren wir mittels Paket "devtools"
# die beiden Pakete mit den benötigten Funktionen
# für die Klausurerstellung und -korrektur
#

# (1) zunächst devtools installieren (falls nicht schon installiert)
install.packages("devtools")

# (2) dann die aktuellen Pakete von github installieren
devtools::install_github("brandmaier/keira") # Paket: keira
devtools::install_github("brandmaier/exams") # Paket: examsMSB

# (3)
# Falls auf dem lokalen Rechner keine LaTeX-Distribution
# installiert ist (z.B. MikTeX oder TeX Live, siehe auch
# hier: https://www.latex-project.org/get/), dann kann
# man eine minimale Installation via dem R-Paket tinytex
# vornehmen:

install.packages("tinytex")
tinytex::install_tinytex()
tinytex::tlmgr_install("babel-german") # Das benötigt man für die richtige Silbentrennung

