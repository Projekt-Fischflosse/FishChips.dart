<<<<<<< HEAD
const List<Map<String, String>> fragenPythonProgrammierung = [
  {
    'category': 'Python Programmierung',
    'difficulty': 'leicht',
    'question': 'Wie gibt man in Python einen Text auf der Konsole aus?',
    'option_a': 'console.log("Hallo")',
    'option_b': 'System.out.println("Hallo")',
    'option_c': 'print("Hallo")',
    'option_d': 'echo("Hallo")',
    'correct_answer': 'C',
    'explanation': 'In Python wird die eingebaute Funktion print() verwendet um Text auf der Konsole auszugeben. console.log() ist JavaScript, System.out.println() ist Java.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'leicht',
    'question': 'Wie wird eine Variable in Python erstellt?',
    'option_a': 'int x = 5',
    'option_b': 'var x = 5',
    'option_c': 'x = 5',
    'option_d': 'let x = 5',
    'correct_answer': 'C',
    'explanation': 'In Python werden Variablen ohne Typangabe erstellt – einfach Name = Wert. Python erkennt den Datentyp automatisch (dynamische Typisierung). int x = 5 ist Java/C, var und let sind JavaScript.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'leicht',
    'question': 'Was ist der Unterschied zwischen einer Liste und einem Tupel in Python?',
    'option_a': 'Listen können nur Zahlen enthalten, Tupel nur Strings',
    'option_b': 'Listen sind veränderbar (mutable), Tupel sind unveränderbar (immutable)',
    'option_c': 'Tupel sind schneller zu erstellen aber Listen haben mehr Funktionen',
    'option_d': 'Es gibt keinen Unterschied, beide sind gleich',
    'correct_answer': 'B',
    'explanation': 'Listen ([1, 2, 3]) können nach der Erstellung verändert werden. Tupel ((1, 2, 3)) sind unveränderbar – einmal erstellt können Elemente nicht mehr hinzugefügt, gelöscht oder geändert werden.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'leicht',
    'question': 'Wie schreibt man eine if-else-Bedingung in Python?',
    'option_a': 'if (x > 5) { } else { }',
    'option_b': 'if x > 5: ... else: ...',
    'option_c': 'if x > 5 then ... else ...',
    'option_d': 'IF x > 5 THEN ... ELSE ...',
    'correct_answer': 'B',
    'explanation': 'Python verwendet Doppelpunkt nach der Bedingung und Einrückung (Indentation) statt geschweifter Klammern. Die Syntax lautet: if Bedingung: gefolgt von eingerücktem Code.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'mittel',
    'question': 'Was macht die Funktion len() in Python?',
    'option_a': 'Gibt die Länge eines Videos in Sekunden zurück',
    'option_b': 'Gibt die Anzahl der Elemente in einem Objekt zurück (z.B. Liste, String)',
    'option_c': 'Verlängert eine Liste um ein Element',
    'option_d': 'Gibt den längsten Wert in einer Liste zurück',
    'correct_answer': 'B',
    'explanation': 'len() gibt die Anzahl der Elemente zurück: len([1,2,3]) ergibt 3, len("Hallo") ergibt 5. Sie funktioniert mit Listen, Strings, Tupeln, Dictionaries und anderen Sequenzen.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'mittel',
    'question': 'Was ist ein Dictionary in Python?',
    'option_a': 'Eine sortierte Liste von Strings',
    'option_b': 'Eine Sammlung von Schlüssel-Wert-Paaren (key-value pairs)',
    'option_c': 'Ein unveränderlicher Datensatz',
    'option_d': 'Eine Funktion zum Übersetzen von Text',
    'correct_answer': 'B',
    'explanation': 'Ein Dictionary (dict) speichert Daten als Schlüssel-Wert-Paare: {"name": "Max", "alter": 25}. Der Zugriff erfolgt über den Schlüssel: person["name"] ergibt "Max".',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'mittel',
    'question': 'Wie definiert man eine Funktion in Python?',
    'option_a': 'function meineFunktion():',
    'option_b': 'def meineFunktion():',
    'option_c': 'func meineFunktion():',
    'option_d': 'void meineFunktion():',
    'correct_answer': 'B',
    'explanation': 'Funktionen werden in Python mit dem Schlüsselwort def definiert, gefolgt vom Funktionsnamen und Klammern. Der Funktionskörper wird eingerückt. function() ist JavaScript, void ist Java/C.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'mittel',
    'question': 'Was macht das Schlüsselwort "return" in einer Python-Funktion?',
    'option_a': 'Es beendet das gesamte Programm',
    'option_b': 'Es gibt einen Wert aus der Funktion zurück und beendet die Funktion',
    'option_c': 'Es springt zum Anfang der Funktion zurück',
    'option_d': 'Es gibt einen Wert auf der Konsole aus',
    'correct_answer': 'B',
    'explanation': 'return beendet die Funktion und gibt den angegebenen Wert an den Aufrufer zurück. Ohne return gibt die Funktion None zurück. Nicht zu verwechseln mit print(), das nur ausgibt aber keinen Wert zurückgibt.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'schwer',
    'question': 'Was ist eine List Comprehension in Python?',
    'option_a': 'Eine Methode zum Sortieren von Listen',
    'option_b': 'Eine kompakte Schreibweise um Listen aus anderen Listen oder Sequenzen zu erstellen',
    'option_c': 'Ein Verfahren zum Vergleich zweier Listen',
    'option_d': 'Eine Funktion die prüft ob ein Element in einer Liste vorhanden ist',
    'correct_answer': 'B',
    'explanation': 'Eine List Comprehension ermöglicht das kompakte Erstellen von Listen: [x*2 for x in range(5)] ergibt [0, 2, 4, 6, 8]. Sie ersetzt oft mehrzeilige for-Schleifen durch eine einzige Zeile.',
  },
  {
    'category': 'Python Programmierung',
    'difficulty': 'schwer',
    'question': 'Was ist der Unterschied zwischen "==" und "is" in Python?',
    'option_a': 'Beide prüfen dasselbe, nur die Schreibweise unterscheidet sich',
    'option_b': '"==" vergleicht die Werte zweier Objekte, "is" prüft ob zwei Variablen auf dasselbe Objekt im Speicher zeigen',
    'option_c': '"is" ist veraltet und sollte nicht mehr verwendet werden',
    'option_d': '"==" funktioniert nur für Zahlen, "is" für alle Datentypen',
    'correct_answer': 'B',
    'explanation': '"==" prüft Wertgleichheit: [1,2] == [1,2] ist True. "is" prüft Identität (gleicher Speicherort): a = [1,2]; b = [1,2]; a is b ist False, da es zwei verschiedene Objekte sind.',
  },
];
=======
import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für Python Programmierung definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'Python Programmierung',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Wie gibt man in Python einen Text auf der Konsole aus?',

      // Antwortoptionen
      'option_a': 'console.log("Hallo")',
      'option_b': 'System.out.println("Hallo")',
      'option_c': 'print("Hallo")',
      'option_d': 'echo("Hallo")',

      // Richtige Antwort
      'correct_answer': 'C',

      // Erklärung
      'explanation': 'In Python wird die eingebaute Funktion print() verwendet um Text auf der Konsole auszugeben. console.log() ist JavaScript, System.out.println() ist Java.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'leicht',
      'question': 'Wie wird eine Variable in Python erstellt?',
      'option_a': 'int x = 5',
      'option_b': 'var x = 5',
      'option_c': 'x = 5',
      'option_d': 'let x = 5',
      'correct_answer': 'C',
      'explanation': 'In Python werden Variablen ohne Typangabe erstellt – einfach Name = Wert. Python erkennt den Datentyp automatisch (dynamische Typisierung). int x = 5 ist Java/C, var und let sind JavaScript.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'leicht',
      'question': 'Was ist der Unterschied zwischen einer Liste und einem Tupel in Python?',
      'option_a': 'Listen können nur Zahlen enthalten, Tupel nur Strings',
      'option_b': 'Listen sind veränderbar (mutable), Tupel sind unveränderbar (immutable)',
      'option_c': 'Tupel sind schneller zu erstellen aber Listen haben mehr Funktionen',
      'option_d': 'Es gibt keinen Unterschied, beide sind gleich',
      'correct_answer': 'B',
      'explanation': 'Listen ([1, 2, 3]) können nach der Erstellung verändert werden. Tupel ((1, 2, 3)) sind unveränderbar – einmal erstellt können Elemente nicht mehr hinzugefügt, gelöscht oder geändert werden.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'leicht',
      'question': 'Wie schreibt man eine if-else-Bedingung in Python?',
      'option_a': 'if (x > 5) { } else { }',
      'option_b': 'if x > 5: ... else: ...',
      'option_c': 'if x > 5 then ... else ...',
      'option_d': 'IF x > 5 THEN ... ELSE ...',
      'correct_answer': 'B',
      'explanation': 'Python verwendet Doppelpunkt nach der Bedingung und Einrückung (Indentation) statt geschweifter Klammern. Die Syntax lautet: if Bedingung: gefolgt von eingerücktem Code.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'mittel',
      'question': 'Was macht die Funktion len() in Python?',
      'option_a': 'Gibt die Länge eines Videos in Sekunden zurück',
      'option_b': 'Gibt die Anzahl der Elemente in einem Objekt zurück (z.B. Liste, String)',
      'option_c': 'Verlängert eine Liste um ein Element',
      'option_d': 'Gibt den längsten Wert in einer Liste zurück',
      'correct_answer': 'B',
      'explanation': 'len() gibt die Anzahl der Elemente zurück: len([1,2,3]) ergibt 3, len("Hallo") ergibt 5. Sie funktioniert mit Listen, Strings, Tupeln, Dictionaries und anderen Sequenzen.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'mittel',
      'question': 'Was ist ein Dictionary in Python?',
      'option_a': 'Eine sortierte Liste von Strings',
      'option_b': 'Eine Sammlung von Schlüssel-Wert-Paaren (key-value pairs)',
      'option_c': 'Ein unveränderlicher Datensatz',
      'option_d': 'Eine Funktion zum Übersetzen von Text',
      'correct_answer': 'B',
      'explanation': 'Ein Dictionary (dict) speichert Daten als Schlüssel-Wert-Paare: {"name": "Max", "alter": 25}. Der Zugriff erfolgt über den Schlüssel: person["name"] ergibt "Max".',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'mittel',
      'question': 'Wie definiert man eine Funktion in Python?',
      'option_a': 'function meineFunktion():',
      'option_b': 'def meineFunktion():',
      'option_c': 'func meineFunktion():',
      'option_d': 'void meineFunktion():',
      'correct_answer': 'B',
      'explanation': 'Funktionen werden in Python mit dem Schlüsselwort def definiert, gefolgt vom Funktionsnamen und Klammern. Der Funktionskörper wird eingerückt. function() ist JavaScript, void ist Java/C.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'mittel',
      'question': 'Was macht das Schlüsselwort "return" in einer Python-Funktion?',
      'option_a': 'Es beendet das gesamte Programm',
      'option_b': 'Es gibt einen Wert aus der Funktion zurück und beendet die Funktion',
      'option_c': 'Es springt zum Anfang der Funktion zurück',
      'option_d': 'Es gibt einen Wert auf der Konsole aus',
      'correct_answer': 'B',
      'explanation': 'return beendet die Funktion und gibt den angegebenen Wert an den Aufrufer zurück. Ohne return gibt die Funktion None zurück. Nicht zu verwechseln mit print(), das nur ausgibt aber keinen Wert zurückgibt.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'schwer',
      'question': 'Was ist eine List Comprehension in Python?',
      'option_a': 'Eine Methode zum Sortieren von Listen',
      'option_b': 'Eine kompakte Schreibweise um Listen aus anderen Listen oder Sequenzen zu erstellen',
      'option_c': 'Ein Verfahren zum Vergleich zweier Listen',
      'option_d': 'Eine Funktion die prüft ob ein Element in einer Liste vorhanden ist',
      'correct_answer': 'B',
      'explanation': 'Eine List Comprehension ermöglicht das kompakte Erstellen von Listen: [x*2 for x in range(5)] ergibt [0, 2, 4, 6, 8]. Sie ersetzt oft mehrzeilige for-Schleifen durch eine einzige Zeile.',
    },
    {
      'category': 'Python Programmierung',
      'difficulty': 'schwer',
      'question': 'Was ist der Unterschied zwischen "==" und "is" in Python?',
      'option_a': 'Beide prüfen dasselbe, nur die Schreibweise unterscheidet sich',
      'option_b': '"==" vergleicht die Werte zweier Objekte, "is" prüft ob zwei Variablen auf dasselbe Objekt im Speicher zeigen',
      'option_c': '"is" ist veraltet und sollte nicht mehr verwendet werden',
      'option_d': '"==" funktioniert nur für Zahlen, "is" für alle Datentypen',
      'correct_answer': 'B',
      'explanation': '"==" prüft Wertgleichheit: [1,2] == [1,2] ist True. "is" prüft Identität (gleicher Speicherort): a = [1,2]; b = [1,2]; a is b ist False, da es zwei verschiedene Objekte sind.',
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
  print('${fragen.length} Python Programmierung Fragen eingefügt!');
}
>>>>>>> origin/main
