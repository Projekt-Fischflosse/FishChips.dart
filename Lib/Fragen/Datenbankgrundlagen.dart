import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für Datenbankgrundlagen definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'Datenbankgrundlagen',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Was versteht man unter einer Datenbank?',

      // Antwortoptionen
      'option_a': 'Ein Programm zum Erstellen von Tabellen in Word',
      'option_b': 'Eine strukturierte Sammlung von Daten die elektronisch gespeichert und verwaltet wird',
      'option_c': 'Eine Sicherungskopie von Dateien auf einem USB-Stick',
      'option_d': 'Ein Netzwerk zur Datenübertragung zwischen Computern',

      // Richtige Antwort
      'correct_answer': 'B',

      // Erklärung
      'explanation': 'Eine Datenbank ist eine organisierte Sammlung von strukturierten Daten, die elektronisch in einem Computersystem gespeichert und über ein DBMS verwaltet wird.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'leicht',
      'question': 'Was ist SQL?',
      'option_a': 'Eine Programmiersprache für Webanwendungen',
      'option_b': 'Ein Betriebssystem für Datenbankserver',
      'option_c': 'Eine Abfragesprache zum Verwalten und Abfragen von relationalen Datenbanken',
      'option_d': 'Ein Tool zur Datensicherung',
      'correct_answer': 'C',
      'explanation': 'SQL (Structured Query Language) ist eine standardisierte Sprache zum Erstellen, Abfragen, Ändern und Verwalten von relationalen Datenbanken.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'mittel',
      'question': 'Was ist ein Datenbank-Management-System (DBMS)?',
      'option_a': 'Eine Programmiersprache zur Erstellung von Datenbanken',
      'option_b': 'Eine Software die den Zugriff auf Datenbanken verwaltet und steuert',
      'option_c': 'Ein Backup-System für Unternehmensdaten',
      'option_d': 'Ein Netzwerkprotokoll zur Datenübertragung',
      'correct_answer': 'B',
      'explanation': 'Ein DBMS (z.B. MySQL, PostgreSQL, SQLite) ist eine Software, die zwischen Benutzer und Datenbank vermittelt und Operationen wie Lesen, Schreiben und Löschen verwaltet.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'leicht',
      'question': 'Was ist ein Primärschlüssel (Primary Key)?',
      'option_a': 'Das erste Feld in einer Datenbanktabelle',
      'option_b': 'Ein Passwort zum Schutz der Datenbank',
      'option_c': 'Ein eindeutiger Wert der jeden Datensatz in einer Tabelle identifiziert',
      'option_d': 'Ein Verweis auf eine andere Tabelle',
      'correct_answer': 'C',
      'explanation': 'Ein Primärschlüssel (Primary Key) ist ein Feld oder eine Kombination von Feldern, das jeden Datensatz in einer Tabelle eindeutig identifiziert. Er darf nicht NULL sein und muss einmalig sein.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'mittel',
      'question': 'Was ist ein Fremdschlüssel (Foreign Key)?',
      'option_a': 'Ein Schlüssel aus einer externen Datenbank',
      'option_b': 'Ein Feld das auf den Primärschlüssel einer anderen Tabelle verweist und Beziehungen herstellt',
      'option_c': 'Ein verschlüsseltes Passwort in der Datenbank',
      'option_d': 'Ein automatisch generierter eindeutiger Wert',
      'correct_answer': 'B',
      'explanation': 'Ein Fremdschlüssel (Foreign Key) verweist auf den Primärschlüssel einer anderen Tabelle und stellt so Beziehungen zwischen Tabellen her (referentielle Integrität).',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'mittel',
      'question': 'Was ist ein Index in einer Datenbank?',
      'option_a': 'Eine Liste aller Tabellen in der Datenbank',
      'option_b': 'Eine Datenstruktur die Abfragen beschleunigt indem sie schnellen Zugriff auf Datensätze ermöglicht',
      'option_c': 'Die erste Zeile einer Tabelle mit Spaltenbezeichnungen',
      'option_d': 'Ein automatisches Backup der Datenbank',
      'correct_answer': 'B',
      'explanation': 'Ein Index ist eine Hilfsdatenstruktur, die Datenbankabfragen beschleunigt, ähnlich wie ein Inhaltsverzeichnis in einem Buch. Er ermöglicht schnellen Zugriff ohne jede Zeile zu durchsuchen.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'mittel',
      'question': 'Was ist ein künstlicher Schlüssel (Surrogate Key)?',
      'option_a': 'Ein Schlüssel der aus echten Daten wie Name oder Geburtsdatum besteht',
      'option_b': 'Ein vom System automatisch generierter eindeutiger Wert ohne fachliche Bedeutung',
      'option_c': 'Ein Schlüssel der zwei Tabellen verbindet',
      'option_d': 'Ein verschlüsselter Primärschlüssel',
      'correct_answer': 'B',
      'explanation': 'Ein künstlicher Schlüssel (z.B. eine automatisch hochgezählte ID) hat keine fachliche Bedeutung und wird nur zur eindeutigen Identifikation eines Datensatzes verwendet.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'leicht',
      'question': 'Welche Arten von Datenbanken gibt es?',
      'option_a': 'Nur relationale Datenbanken',
      'option_b': 'Relationale und nicht-relationale (NoSQL) Datenbanken',
      'option_c': 'Nur dokumentenbasierte Datenbanken',
      'option_d': 'Nur objektorientierte Datenbanken',
      'correct_answer': 'B',
      'explanation': 'Es gibt relationale Datenbanken (z.B. MySQL, PostgreSQL) die Tabellen verwenden, und nicht-relationale (NoSQL) Datenbanken (z.B. MongoDB, Redis) die andere Strukturen nutzen.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'schwer',
      'question': 'Was ist eine Stored Procedure?',
      'option_a': 'Eine gespeicherte Sicherungskopie der Datenbank',
      'option_b': 'Ein automatisches Backup-Verfahren',
      'option_c': 'Ein vorgefertigtes SQL-Programm das in der Datenbank gespeichert und wiederverwendet werden kann',
      'option_d': 'Eine Methode zur Verschlüsselung von Datenbankeinträgen',
      'correct_answer': 'C',
      'explanation': 'Eine Stored Procedure ist ein gespeichertes SQL-Programm, das direkt auf dem Datenbankserver ausgeführt wird. Sie kann Parameter annehmen und wiederholt aufgerufen werden.',
    },
    {
      'category': 'Datenbankgrundlagen',
      'difficulty': 'schwer',
      'question': 'Was ist ein Cursor in einer Datenbank?',
      'option_a': 'Der Mauszeiger im Datenbankprogramm',
      'option_b': 'Ein Zeiger der es ermöglicht Ergebniszeilen einer Abfrage einzeln zu verarbeiten',
      'option_c': 'Eine Markierung für gelöschte Datensätze',
      'option_d': 'Ein Index für schnelle Datenbankabfragen',
      'correct_answer': 'B',
      'explanation': 'Ein Cursor ist ein Datenbankobjekt das auf eine Ergebnismenge zeigt und es ermöglicht, die Zeilen einer Abfrage einzeln nacheinander zu verarbeiten (zeilenweises Iterieren).',
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
  print('${fragen.length} Datenbankgrundlagen Fragen eingefügt!');
}
