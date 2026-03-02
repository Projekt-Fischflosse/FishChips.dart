import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für PQSM definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'PQSM',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Was ist ein Projekt laut DIN 69901?',

      // Antwortoptionen
      'option_a': 'Eine wiederkehrende Routineaufgabe im Unternehmen',
      'option_b': 'Ein Vorhaben das einmalig, zeitlich begrenzt, mit definierten Zielen und begrenzten Ressourcen durchgeführt wird',
      'option_c': 'Eine Abteilung die für Sonderaufgaben zuständig ist',
      'option_d': 'Ein Dokument zur Planung von Unternehmenszielen',

      // Richtige Antwort
      'correct_answer': 'B',

      // Erklärung
      'explanation': 'Laut DIN 69901 ist ein Projekt ein Vorhaben, das durch Einmaligkeit, zeitliche Begrenzung, definierte Ziele, begrenzte Ressourcen und Abgrenzung gegenüber anderen Vorhaben gekennzeichnet ist.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'leicht',
      'question': 'Was ist ein Meilenstein in der Projektplanung?',
      'option_a': 'Ein wöchentliches Team Meeting',
      'option_b': 'Ein definierter Zwischenzustand der einen wichtigen Fortschritt im Projekt markiert',
      'option_c': 'Das Projektbudget',
      'option_d': 'Ein Mitglied des Projektteams',
      'correct_answer': 'B',
      'explanation': 'Ein Meilenstein ist ein messbarer Zwischenzustand im Projektverlauf (z.B. "Konzept abgenommen"). Er dient zur Kontrolle ob das Projekt im Zeitplan liegt, hat aber keine eigene Dauer.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'mittel',
      'question': 'Was zeigt ein Gantt-Diagramm?',
      'option_a': 'Die Kostenentwicklung eines Projekts über die Zeit',
      'option_b': 'Die Hierarchie der Projektmitglieder',
      'option_c': 'Projektaufgaben als Balken auf einer Zeitachse mit Start- und Endterminen',
      'option_d': 'Die Qualitätskennzahlen eines Projekts',
      'correct_answer': 'C',
      'explanation': 'Ein Gantt-Diagramm visualisiert Projektaufgaben als horizontale Balken auf einer Zeitachse. Es zeigt Dauer, Reihenfolge und Abhängigkeiten von Aufgaben und ermöglicht die Überwachung des Fortschritts.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'mittel',
      'question': 'Was ist der Unterschied zwischen klassischem und agilem Projektmanagement?',
      'option_a': 'Klassisch ist moderner als agil',
      'option_b': 'Klassisches PM plant alles vorab in festen Phasen, agiles PM arbeitet iterativ und flexibel in kurzen Zyklen',
      'option_c': 'Agiles PM wird nur in der IT eingesetzt, klassisches in allen Branchen',
      'option_d': 'Beide Methoden sind identisch, nur die Bezeichnung unterscheidet sich',
      'correct_answer': 'B',
      'explanation': 'Klassisches PM (z.B. Wasserfallmodell) plant vollständig vorab. Agiles PM (z.B. Scrum) arbeitet in kurzen Iterationen (Sprints), passt sich Änderungen an und liefert regelmäßig Teilprodukte.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'mittel',
      'question': 'Was ist Scrum?',
      'option_a': 'Eine Programmiersprache für Projektmanagement-Software',
      'option_b': 'Ein agiles Rahmenwerk das Arbeit in kurzen Sprints mit definierten Rollen organisiert',
      'option_c': 'Ein klassisches Phasenmodell zur Softwareentwicklung',
      'option_d': 'Ein Tool zur Erstellung von Gantt-Diagrammen',
      'correct_answer': 'B',
      'explanation': 'Scrum ist ein agiles Rahmenwerk mit festen Rollen (Product Owner, Scrum Master, Entwicklungsteam), Ereignissen (Sprint, Daily, Review) und Artefakten (Product Backlog, Sprint Backlog).',
    },
    {
      'category': 'PQSM',
      'difficulty': 'leicht',
      'question': 'Was versteht man unter Qualitätssicherung (QS)?',
      'option_a': 'Die Kontrolle der Mitarbeiterzufriedenheit',
      'option_b': 'Alle Maßnahmen die sicherstellen dass ein Produkt oder Prozess definierte Qualitätsanforderungen erfüllt',
      'option_c': 'Die Dokumentation von Fehlern nach der Auslieferung',
      'option_d': 'Die Zertifizierung von Unternehmen durch externe Prüfer',
      'correct_answer': 'B',
      'explanation': 'Qualitätssicherung umfasst alle geplanten Maßnahmen (Tests, Reviews, Audits), die sicherstellen, dass Produkte und Prozesse vorgegebene Qualitätsstandards einhalten – präventiv und kontrollierend.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'schwer',
      'question': 'Was ist der kritische Pfad in der Netzplantechnik?',
      'option_a': 'Der kürzeste Weg zum Projektziel',
      'option_b': 'Die teuerste Phase eines Projekts',
      'option_c': 'Die längste Abfolge abhängiger Aufgaben die die Mindestprojektdauer bestimmt',
      'option_d': 'Der riskanteste Abschnitt eines Projekts',
      'correct_answer': 'C',
      'explanation': 'Der kritische Pfad ist die längste Kette abhängiger Vorgänge im Netzplan. Verzögerungen auf dem kritischen Pfad verzögern das gesamte Projekt, da diese Aufgaben keinen Puffer besitzen.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'mittel',
      'question': 'Was ist ein Projektstrukturplan (PSP)?',
      'option_a': 'Ein Diagramm das den Zeitplan des Projekts zeigt',
      'option_b': 'Eine hierarchische Gliederung aller Aufgaben und Arbeitspakete eines Projekts',
      'option_c': 'Eine Liste aller Projektmitglieder und ihrer Rollen',
      'option_d': 'Ein Dokument das die Projektziele beschreibt',
      'correct_answer': 'B',
      'explanation': 'Der PSP (Work Breakdown Structure) zerlegt das Projekt hierarchisch in Teilaufgaben und Arbeitspakete. Er bildet die Grundlage für Zeit-, Kosten- und Ressourcenplanung.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'mittel',
      'question': 'Was versteht man unter einem Sprint in Scrum?',
      'option_a': 'Ein schnelles Meeting am Morgen',
      'option_b': 'Ein festgelegter Zeitraum (1–4 Wochen) in dem ein fertiges Produktinkrement entwickelt wird',
      'option_c': 'Die finale Testphase vor der Auslieferung',
      'option_d': 'Ein Notfallplan bei Projektverzögerungen',
      'correct_answer': 'B',
      'explanation': 'Ein Sprint ist ein Zeitrahmen (Time ox) von 1–4 Wochen in dem das Scrum-Team ein fertiges, auslieferbares Produktinkrement erstellt. Am Ende steht immer ein Sprint Review und eine Retrospektive.',
    },
    {
      'category': 'PQSM',
      'difficulty': 'schwer',
      'question': 'Was ist Risikomanagement im Projektmanagement?',
      'option_a': 'Die Versicherung des Projektbudgets gegen unvorhergesehene Kosten',
      'option_b': 'Die systematische Identifikation, Bewertung und Steuerung von Risiken die den Projekterfolg gefährden könnten',
      'option_c': 'Die Überwachung der Teamleistung zur Fehlervermeidung',
      'option_d': 'Die Dokumentation von Fehlern nach Projektabschluss',
      'correct_answer': 'B',
      'explanation': 'Risikomanagement umfasst: Risiken identifizieren, Eintrittswahrscheinlichkeit und Auswirkung bewerten, Gegenmaßnahmen planen und Risiken überwachen. Ziel ist die Minimierung negativer Auswirkungen auf das Projekt.',
    },
  ];

  // Aktuelles Datum für created_date Spalte
  final now = DateTime.now().toIso8601String();

  // SQL-Statement vorbereiten – wird für jede Frage, Antwortoption und Erklärung wiederverwendet
  final stmt = db.prepare('''
    INSERT INTO questions (category, difficulty, question, option_a, option_b, option_c, option_d, correct_answer, explanation, created_date)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''');

  // Jede Frage, Antwortoption, Erklärung und Schwierigkeitsgrad einzeln in die Datenbank einfügen
  for (final f in fragen) {
    stmt.execute([
      f['category'], f['difficulty'], f['question'],
      f['option_a'], f['option_b'], f['option_c'], f['option_d'],
      f['correct_answer'], f['explanation'], now,
    ]);
  }

  // Statement und Datenbank schließen
  stmt.dispose();
  db.dispose();

  // Erfolgsmeldung mit Anzahl der eingefügten Fragen
  print('${fragen.length} PQSM Fragen eingefügt!');
}
