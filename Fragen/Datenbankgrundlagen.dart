import 'package:sqlite3/sqlite3.dart';

enum Category { Datenbankgrundlagen }

class Question {
  final Category category;
  final String text;

  Question({required this.category, required this.text});
}

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // Fragen definieren
  final questions = [
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was versteht man unter einer Datenbank?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was bezeichnet man als Datenbank-Abfragesprache (DAS)?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Datenbank-Management-System (DBMS)?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Primärschlüssel?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Fremdschlüssel?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Index?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Künstlicher Schlüssel?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Welche Arten von Datenbanken gibt es?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Stored Procedure?',
    ),
    Question(
      category: Category.Datenbankgrundlagen,
      text: 'Was ist ein Cursor?',
    ),
  ];

  // Aktuelles Datum
  final now = DateTime.now().toIso8601String();

  // Statement vorbereiten
  final stmt = db.prepare('''
    INSERT INTO questions (category, question, created_date)
    VALUES (?, ?, ?)
  ''');

  // Fragen einfügen
  for (final question in questions) {
    stmt.execute([question.category.name, question.text, now]);
  }

  // Ressourcen freigeben
  stmt.dispose();
  db.dispose();

  print('${questions.length} Datenbankgrundlagen Fragen eingefügt!');
}
