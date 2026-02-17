import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

void main() {
  //datenbank erstellen
  final db = sqlite3.open('fish_and_chips.db');

  //egemen erstellt jetzt eine Tabelle für die ersten 10 Fragen, SCHON WIEDER!
  db.execute('''
    CREATE TABLE IF NOT EXISTS questions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      category TEXT NOT NULL,
      difficulty TEXT,
      question TEXT NOT NULL,
      option_a TEXT NOT NULL,
      option_b TEXT NOT NULL,
      option_c TEXT NOT NULL,
      option_d TEXT NOT NULL,
      correct_answer TEXT NOT NULL,
      explanation TEXT,
      created_date TEXT
    )
  ''');

  print('Tabelle erstellt!');

  //die kack Fragen definieren
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

  //die kack Fragen einfügen
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

  print('🐟🍟 ${fragen.length} Fragen hinzugefügt!');
}
