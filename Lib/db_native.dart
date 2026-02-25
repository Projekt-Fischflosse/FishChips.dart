
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
