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
