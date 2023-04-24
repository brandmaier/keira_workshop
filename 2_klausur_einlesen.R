#
# Die gescannten Deckblätter müssen als PNG-Dateien vorliegen
# (PDFs können mittels PDF24 zu PNGs umgewandelt werden)
#
# Es entsteht eine Datei namens "nops_eval.csv", die alle
# ausgelesenen Informationen zu Matrikelnummer und Antworten
# enthält; diese Datei dient als Grundlage zur Auswertung
# der Klausuren im nächsten Schritt
#
# hier entsteht nun eine ZIP-Datei, die die eingelesenen
# Informationen und die Deckblätter enthält. Der Name
# der Datei beginnt mit "nops_scan_....".
#
examsMSB::nops_scan(dir = "scans/")

# Hier müssen wir nun die Gesamtpunktzahl angeben, damit
# wir die korrekte Abbildung von Punkten auf Noten erhalten
totalpoints <- 10
ml <- keira::get_marks_and_labels(totalpoints)

# Nun werden die Informationen aus den korrekten und falschen
# Antworten (RDS-Datei aus Schritt 1) und die ausgelesenen
# Informationen zusammengeführt

examsMSB::nops_eval(register=NULL,
                    solutions="exam/klausur_M14_2023-02-15.rds",
                    scans="scans_png/nops_scan_20230306115257.zip",
                    mark=ml$marks,
                    labels=ml$labels,
                    eval=eval_funs,
                    interactive = TRUE)

keira::grade_report(nops_eval_file = "nops_eval.csv", outfolder = "reports")
