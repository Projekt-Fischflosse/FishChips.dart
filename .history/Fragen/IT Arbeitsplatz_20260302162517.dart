import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für IT Arbeitsplatz definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'IT Arbeitsplatz',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Was versteht man unter Ergonomie am IT-Arbeitsplatz?',

      // Antwortoptionen
      'option_a': 'Die Ausstattung des Arbeitsplatzes mit möglichst vielen Geräten',
      'option_b': 'Die optimale Gestaltung des Arbeitsplatzes zur Förderung von Gesundheit und Effizienz',
      'option_c': 'Die rechtliche Regelung der Arbeitszeiten am Computer',
      'option_d': 'Die Wartung und Pflege von IT-Geräten',

      // Richtige Antwort
      'correct_answer': 'B',

      // Erklärung
      'explanation': 'Ergonomie bezeichnet die Anpassung der Arbeitsbedingungen an den Menschen. Am IT-Arbeitsplatz umfasst das die richtige Sitzhaltung, Monitorausrichtung, Beleuchtung und Eingabegeräte.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'leicht',
      'question': 'Auf welcher Höhe sollte der Bildschirm am IT-Arbeitsplatz positioniert sein?',
      'option_a': 'Der obere Bildschirmrand sollte auf Augenhöhe oder leicht darunter sein',
      'option_b': 'Der Bildschirm sollte möglichst hoch hängen damit man aufrecht schaut',
      'option_c': 'Der Bildschirm sollte auf Tischhöhe stehen',
      'option_d': 'Die Höhe spielt keine Rolle solange der Abstand stimmt',
      'correct_answer': 'A',
      'explanation': 'Der obere Bildschirmrand sollte auf Augenhöhe oder leicht darunter sein. So wird die Halswirbelsäule entlastet und Nackenschmerzen werden vermieden.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'leicht',
      'question': 'Welchen Mindestabstand sollte man zum Bildschirm einhalten?',
      'option_a': '20–30 cm',
      'option_b': '50–70 cm',
      'option_c': '100–120 cm',
      'option_d': 'Mehr als 150 cm',
      'correct_answer': 'B',
      'explanation': 'Der empfohlene Sehabstand zum Bildschirm beträgt 50–70 cm (ca. eine Armlänge). Ein zu geringer Abstand belastet die Augen, ein zu großer erfordert Anstrengung beim Lesen.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'mittel',
      'question': 'Was regelt die Bildschirmarbeitsverordnung (BildscharV) in Deutschland?',
      'option_a': 'Die maximale Bildschirmgröße am Arbeitsplatz',
      'option_b': 'Mindestanforderungen an Sicherheit und Gesundheitsschutz bei der Arbeit an Bildschirmgeräten',
      'option_c': 'Die erlaubten Bildschirmmodelle in Unternehmen',
      'option_d': 'Die Pflicht zur regelmäßigen Reinigung von Bildschirmen',
      'correct_answer': 'B',
      'explanation': 'Die Bildschirmarbeitsverordnung schreibt Mindestanforderungen für Bildschirmarbeitsplätze vor: Beleuchtung, Ergonomie, Pausen und regelmäßige Augenuntersuchungen für Arbeitnehmer.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'leicht',
      'question': 'Wie oft sollte man bei langer Bildschirmarbeit eine Pause einlegen?',
      'option_a': 'Einmal pro Tag für 30 Minuten',
      'option_b': 'Alle 2 Stunden für mindestens 1 Stunde',
      'option_c': 'Alle 45–60 Minuten für 5–10 Minuten',
      'option_d': 'Pausen sind bei Bildschirmarbeit nicht nötig',
      'correct_answer': 'C',
      'explanation': 'Experten empfehlen alle 45–60 Minuten eine kurze Pause von 5–10 Minuten. Dabei sollte man aufstehen, sich bewegen und den Blick in die Ferne schweifen lassen um die Augen zu entspannen.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'mittel',
      'question': 'Was ist bei der Beleuchtung am IT-Arbeitsplatz zu beachten?',
      'option_a': 'Je heller die Beleuchtung desto besser für die Augen',
      'option_b': 'Der Bildschirm sollte immer im Dunkeln leuchten',
      'option_c': 'Blendung und Reflexionen auf dem Bildschirm sollten vermieden werden, Tageslicht von der Seite ist ideal',
      'option_d': 'Direkte Sonneneinstrahlung auf den Bildschirm ist optimal',
      'correct_answer': 'C',
      'explanation': 'Blendung durch Fenster oder Lampen sowie Reflexionen auf dem Bildschirm belasten die Augen. Tageslicht sollte seitlich einfallen. Empfohlene Beleuchtungsstärke am Arbeitsplatz: 500 Lux.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'mittel',
      'question': 'Welche Sitzhaltung ist am IT-Arbeitsplatz empfehlenswert?',
      'option_a': 'Leicht nach vorne gebeugt um nah am Bildschirm zu sein',
      'option_b': 'Aufrechte Sitzhaltung mit 90° Winkel in Hüfte, Knie und Ellbogen sowie Füßen flach auf dem Boden',
      'option_c': 'Zurückgelehnt mit ausgestreckten Armen zur Tastatur',
      'option_d': 'Die Sitzhaltung ist unwichtig solange man bequem sitzt',
      'correct_answer': 'B',
      'explanation': 'Die ideale Sitzhaltung: Rücken aufrecht, Hüft-, Knie- und Ellbogenwinkel ca. 90°, Füße flach auf dem Boden oder einer Fußstütze. Der Rücken sollte von der Stuhllehne gestützt werden.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'mittel',
      'question': 'Was ist ein USV-Gerät und wofür wird es am IT-Arbeitsplatz eingesetzt?',
      'option_a': 'Ein USB-Verteiler für mehrere Geräte',
      'option_b': 'Eine unterbrechungsfreie Stromversorgung die bei Stromausfall den Computer kurzzeitig weiter betreibt',
      'option_c': 'Ein Gerät zur Überwachung des Stromverbrauchs',
      'option_d': 'Ein universeller Spannungswandler für internationale Geräte',
      'correct_answer': 'B',
      'explanation': 'Eine USV (Unterbrechungsfreie Stromversorgung) puffert den Strom mit Akkus. Bei einem Stromausfall ermöglicht sie das kontrollierte Speichern und Herunterfahren des Computers ohne Datenverlust.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'schwer',
      'question': 'Was versteht man unter dem Prinzip des "Clean Desk"?',
      'option_a': 'Die regelmäßige Reinigung der Tastatur und des Bildschirms',
      'option_b': 'Eine Sicherheitsrichtlinie bei der der Arbeitsplatz nach Feierabend frei von sensiblen Dokumenten und Daten ist',
      'option_c': 'Ein ergonomisches Konzept für aufgeräumte Kabelführung',
      'option_d': 'Die Pflicht zur täglichen Desinfektion des Arbeitsplatzes',
      'correct_answer': 'B',
      'explanation': 'Das Clean-Desk-Prinzip ist eine Sicherheitsrichtlinie: Nach der Arbeit müssen alle sensiblen Unterlagen weggeschlossen und Computer gesperrt oder ausgeschaltet werden um Datenschutz zu gewährleisten.',
    },
    {
      'category': 'IT Arbeitsplatz',
      'difficulty': 'schwer',
      'question': 'Welche Maßnahme schützt beim Einbau von Hardware vor elektrostatischer Entladung (ESD)?',
      'option_a': 'Gummihandschuhe tragen',
      'option_b': 'Den Computer vor dem Öffnen ausschalten und vom Strom trennen',
      'option_c': 'Ein Antistatikarmband verwenden das mit der Erdung verbunden ist',
      'option_d': 'Alle Komponenten vorher mit einem feuchten Tuch abwischen',
      'correct_answer': 'C',
      'explanation': 'Ein Antistatikarmband (ESD-Armband) leitet elektrostatische Ladung sicher ab und schützt empfindliche Bauteile wie RAM, CPU oder Grafikkarten vor Schäden durch elektrostatische Entladung.',
    },
  ];

  // Aktuelles Datum für created_date Spalte
  final now = DateTime.now().toIso8601String();

  // SQL-Statement vorbereiten
  final stmt = db.prepare('''
    INSERT INTO questions (category, difficulty, question, option_a, option_b, option_c, option_d, correct_answer, explanation, created_date)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''');

  // Jede Frage einzeln in die Datenbank einfügen
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

  print('${fragen.length} IT Arbeitsplatz Fragen eingefügt!');
}
