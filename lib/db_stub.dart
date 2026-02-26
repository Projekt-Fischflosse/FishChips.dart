// Stub for web builds where `dart:io` and `sqlite3` are unavailable.
// This creates an in-memory list of questions so web/Chrome runs and tests
// that expect initialization do not fail.
import 'dart:convert';

late final List<Map<String, String>> questions;

void initializeDatabase() {
  questions = [
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

  print('Web-Stub: ${questions.length} Fragen in-memory angelegt.');
  // Optional: expose JSON for debugging
  final jsonStr = jsonEncode(questions);
  print('Web-Stub JSON-Länge: ${jsonStr.length}');
}
