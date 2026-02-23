import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für Cybersecurity definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
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
  ];
  // Aktuelles Datum für created_date Spalte
  final now = DateTime.now().toIso8601String();

  // SQL-Statement vorbereiten – wird für jede Frage wiederverwendet
  final stmt = db.prepare('''
    INSERT INTO questions (category, question, created_date)
    VALUES (?, ?, ?)
  ''');

  // Jede Frage einzeln in die Datenbank einfügen
  for (final f in fragen) {
    stmt.execute([f['category'], f['question'], now]);
  }
  // Statement und Datenbank schließen
  stmt.dispose();
  db.dispose();
  
  // Erfolgsmeldung mit Anzahl der eingefügten Fragen
  print('${fragen.length} Cybersecurity Fragen eingefügt!');
}