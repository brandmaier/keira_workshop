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
totalpoints <- 30
ml <- keira::get_marks_and_labels(totalpoints)

# Nun können verschiedene Evaluationsfunktionen genutzt werden
# um Punkte zu vergeben. Die Option `partial` erlaubt die
# Vergabe anteiliger Punkte.
#
eval_fun <- examsMSB::exams_eval(partial=TRUE, rule="true", negative=FALSE)
eval_fun <- examsMSB::exams_eval(partial=FALSE)


# Nun werden die Informationen aus den korrekten und falschen
# Antworten (RDS-Datei aus Schritt 1) und die ausgelesenen
# Informationen zusammengeführt.
#
# Es wird eine Datei namens "nops_eval.csv" erzeugt, die
# eine Übersicht der Punkte, Gesamtpunkte und Note pro
# Matrikelnummer enthält.

examsMSB::nops_eval(register=NULL,
                    solutions="exam/klausur_M99_2023-02-15.rds",
                    scans="scans/nops_scan_20230515133656.zip",
                    mark=ml$marks,
                    labels=ml$labels,
                    eval=eval_fun,
                    interactive = TRUE)

#
# Zuletzt erzeugen wir die annotierten Deckblätter
# zur manuellen Durchsicht und zur Ablage als Ausdruck
# im Prüfungsbüro
#
# /!\ Achtung, dieser Schritt kann mehrere Minuten dauern
#

keira::grade_report(nops_eval_file = "nops_eval.csv",
                    path_to_scans = "scans/nops_scan_20230515133656.zip",
                    outfolder = "reports")


