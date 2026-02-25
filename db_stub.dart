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
  ];

  print('Web-Stub: ${questions.length} Fragen in-memory angelegt.');
  // Optional: expose JSON for debugging
  final jsonStr = jsonEncode(questions);
  print('Web-Stub JSON-Länge: ${jsonStr.length}');
}
