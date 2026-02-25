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
      'option_a': 'Ein Angriff mit einem Fischernetz',
      'option_b': 'Ein betrügerische E-Mail um Passwörter zu stehlen',
      'option_c': 'Ein Computervirus der Datein löscht',
      'option_d': 'Eine Methode um WLANs zu knacken',
      'correct_answer': 'B',
      'explanation': 'Phishing ist eine Betrugsmasche per E-Mail oder Website, um sensible Daten zu stehlen.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was bedeutet der Begriff Firewall?',
      'option_a': 'Ein Programm das Viren löscht',
      'option_b': 'Eine Brandschutzmauer im Rechenzentrum',
      'option_c': 'Ein System das den Netzwerkverkehr überwacht und filtert',
      'option_d': 'Ein verschlüsseltes WLAN-Netzwerk',
      'correct_answer': 'C',
      'explanation': 'Eine Firewall kontrolliert den Datenverkehr zwischen Netzwerken nach festgelegten Regeln.',

    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen Virus und Trojaner?',
      'option_a': 'Ein Virus ist harmlos, ein Trojaner löscht Dateien',
      'option_b': 'Ein Virus verbreitet sich selbst, ein Trojaner tarnt sich als nützliches Programm',
      'option_c': 'Beide sind gleich, nur unterschiedliche Namen',
      'option_d': 'Ein Trojaner kommt per E-Mail, ein Virus nur per USB-Stick',
      'correct_answer': 'B',
      'explanation': 'Ein Virus repliziert sich selbst, während ein Trojaner sich als legitimes Programm tarnt um ins System zu gelangen.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was versteht man unter einem Brute-Force-Angriff?',
      'option_a': 'Ein physischer Angriff auf einen Server',
      'option_b': 'Eine Methode bei der alle möglichen Passwörter automatisch ausprobiert werden',
      'option_c': 'Ein Angriff über gefälschte E-Mails',
      'option_d': 'Ein Virus der sich selbst verbreitet',
      'correct_answer': 'B',
      'explanation': 'Beim Brute-Force-Angriff werden systematisch alle möglichen Passwortkombinationen ausprobiert bis die richtige gefunden wird.',

    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist Zwei-Faktor-Authentifizierung (2FA)?',
      'option_a': 'Ein doppeltes Passwort für mehr Sicherheit',
      'option_b': 'Eine Methode bei der man sich mit zwei verschiedenen Geräten einloggt',
      'option_c': 'Eine Anmeldemethode die zwei unabhängige Faktoren zur Identifikation verwendet',
      'option_d': 'Ein Sicherheitsprogramm das Viren erkennt',
      'correct_answer': 'C',
      'explanation': 'Bei 2FA braucht man zwei verschiedene Faktoren z.B. Passwort + SMS-Code, was den Account viel sicherer macht.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen HTTP und HTTPS?',
      'option_a': 'HTTPS ist schneller als HTTP',
      'option_b': 'HTTPS verschlüsselt die Datenübertragung, HTTP nicht',
      'option_c': 'HTTP ist neuer als HTTPS',
      'option_d': 'Es gibt keinen Unterschied, nur der Name ist anders',
      'correct_answer': 'B',
      'explanation': 'HTTPS verwendet SSL/TLS-Verschlüsselung um die Daten zwischen Browser und Server zu schützen.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was bedeutet Ransomware?',
      'option_a': 'Eine Software die den Computer beschleunigt',
      'option_b': 'Ein Virus der Dateien stiehlt und ins Internet hochlädt',
      'option_c': 'Eine Schadsoftware die Dateien verschlüsselt und Lösegeld fordert',
      'option_d': 'Ein Programm das Passwörter speichert',
      'correct_answer': 'C',
      'explanation': 'Ransomware verschlüsselt die Dateien des Opfers und fordert ein Lösegeld für die Entschlüsselung.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist ein VPN und wofür wird es genutzt?',
      'option_a': 'Ein Virenschutzprogramm für mobile Geräte',
      'option_b': 'Ein virtuelles privates Netzwerk das die Internetverbindung verschlüsselt und die IP verbirgt',
      'option_c': 'Ein schnelleres WLAN-Protokoll',
      'option_d': 'Eine Firewall für Unternehmen',
      'correct_answer': 'B',
      'explanation': 'Ein VPN erstellt einen verschlüsselten Tunnel für deine Internetverbindung und schützt so deine Privatsphäre.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was versteht man unter Social Engineering?',
      'option_a': 'Das Programmieren von sozialen Netzwerken',
      'option_b': 'Eine Methode bei der Menschen manipuliert werden um vertrauliche Informationen preiszugeben',
      'option_c': 'Ein Angriff der automatisch Passwörter knackt',
      'option_d': 'Eine Software die soziale Medien überwacht',
      'correct_answer': 'B',
      'explanation': 'Social Engineering nutzt menschliche Schwächen wie Vertrauen oder Angst aus um an vertrauliche Daten zu gelangen.',
    },
    {
      'category': 'Cybersecurity',
      'question': 'Was ist der Unterschied zwischen symmetrischer und asymmetrischer Verschlüsselung?',
      'option_a': 'Symmetrisch ist sicherer als asymmetrisch',
      'option_b': 'Bei symmetrischer Verschlüsselung gibt es keinen Schlüssel',
      'option_c': 'Symmetrisch verwendet einen Schlüssel, asymmetrisch verwendet ein Schlüsselpaar (public & private key)',
      'option_d': 'Asymmetrisch ist nur für E-Mails geeignet',
      'correct_answer': 'C',
      'explanation': 'Bei symmetrischer Verschlüsselung wird ein gemeinsamer Schlüssel verwendet, bei asymmetrischer ein öffentlicher und ein privater Schlüssel.',
    },
  ];
  // Aktuelles Datum für created_date Spalte
  final now = DateTime.now().toIso8601String();

  // SQL-Statement vorbereiten – wird für jede Frage wiederverwendet
  final stmt = db.prepare('''
     INSERT INTO questions (category, question, option_a, option_b, option_c, option_d, correct_answer, explanation, created_date)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''');

  // Jede Frage einzeln in die Datenbank einfügen
 for (final f in fragen) {
    stmt.execute([
      f['category'], f['question'],
      f['option_a'], f['option_b'], f['option_c'], f['option_d'],
      f['correct_answer'], f['explanation'], now, ]);
 }
  // Statement und Datenbank schließen
  stmt.dispose();
  db.dispose();
  
  // Erfolgsmeldung mit Anzahl der eingefügten Fragen
  print('${fragen.length} Cybersecurity Fragen eingefügt!');
}
