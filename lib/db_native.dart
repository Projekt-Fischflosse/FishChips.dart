import 'package:sqlite3/sqlite3.dart';

late final List<Map<String, String>> questions;

void initializeDatabase() {
  // datenbank erstellen
  final db = sqlite3.open('fish_and_chips.db');

  // Tabelle erstellen — option_* und correct_answer sind jetzt nullable,
  // damit INSERTs ohne Optionen nicht fehlschlagen.
  db.execute('''
    CREATE TABLE IF NOT EXISTS questions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      category TEXT NOT NULL,
      difficulty TEXT,
      question TEXT NOT NULL,
      option_a TEXT,
      option_b TEXT,
      option_c TEXT,
      option_d TEXT,
      correct_answer TEXT,
      explanation TEXT,
      created_date TEXT
    )
  ''');

  print('Tabelle erstellt!');

  final fragen = [
    {
      'category': 'Computergenerationen',
      'question': 'Welche Technologie dominierte die 1. Computergeneration?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Was war ein typisches Problem der 1. Generation?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Welche Technologie kennzeichnet die 2. Generation?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Warum waren Computer der 2. Generation besser?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Was prägte die 3. Generation?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Was ist eine integrierte Schaltung (IC)?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Welche Innovation definierte die 4. Generation?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Was wurde ab der 4. Generation massentauglich?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Was ist typisch für die 5. Generation?',
    },
    {
      'category': 'Computergenerationen',
      'question': 'Welche Reihenfolge ist korrekt?',
    },

    {
      'category': 'Cybersecurity',
      'question': 'Was ist ein Phishing-Angriff?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was bedeutet der Begriff Firewall?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen Virus und Trojaner?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was versteht man unter einem Brute-Force-Angriff?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist Zwei-Faktor-Authentifizierung (2FA)?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen HTTP und HTTPS?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was bedeutet Ransomware?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist ein VPN und wofür wird es genutzt?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was versteht man unter Social Engineering?',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen symmetrischer und asymmetrischer Verschlüsselung?',
    },

     {
      'category': 'Datenbankgrundlagen',
      'question': 'Was versteht man unter einer Datenbank?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was bezeichnet man als Datenbank-Abfragesprache (DAS)?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Datenbank-Management-System (DBMS)?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Primärschlüssel?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Fremdschlüssel?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Index?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Künstlicher Schlüssel?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Welche Arten von Datenbanken gibt es?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Stored Procedure?',
    },
    {
      'category': 'Datenbankgrundlagen',
      'question': 'Was ist ein Cursor?',
    },
  ];


  final now = DateTime.now().toIso8601String();
  final stmt = db.prepare('''
    INSERT INTO questions (category, question, created_date)
    VALUES (?, ?, ?)
  ''');

  for (final f in fragen) {
    stmt.execute([f['category'], f['question'], now]);
  }

  stmt.dispose();
  db.dispose();

  questions = List<Map<String, String>>.from(
    fragen.map((f) => {'category': f['category']!, 'question': f['question']!}),
  );

  print('🐟🍟 ${fragen.length} Fragen hinzugefügt!');
}
