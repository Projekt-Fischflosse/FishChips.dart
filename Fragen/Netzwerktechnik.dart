import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für Netzwerktechnik definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'Netzwerktechnik',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Was ist der Unterschied zwischen einem LAN und einem WAN?',

      // Antwortoptionen
      'option_a': 'LAN ist schneller als WAN',
      'option_b': 'LAN ist ein lokales Netzwerk, WAN verbindet Netzwerke über große Entfernungen',
      'option_c': 'WAN wird nur in Unternehmen genutzt, LAN nur zuhause',
      'option_d': 'Es gibt keinen Unterschied, beide Begriffe bedeuten dasselbe',

      // Richtige Antwort
      'correct_answer': 'B',

      // Erklärung
      'explanation': 'LAN (Local Area Network) verbindet Geräte in einem begrenzten Bereich (z.B. Büro, Haus). WAN (Wide Area Network) verbindet mehrere LANs über große geografische Entfernungen – das Internet ist das größte WAN.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'leicht',
      'question': 'Was ist die Aufgabe eines Routers?',
      'option_a': 'Kabelverbindungen zwischen Geräten herzustellen',
      'option_b': 'Datenpakete zwischen verschiedenen Netzwerken weiterzuleiten',
      'option_c': 'WLAN-Signale zu verstärken',
      'option_d': 'IP-Adressen zu verschlüsseln',
      'correct_answer': 'B',
      'explanation': 'Ein Router verbindet verschiedene Netzwerke miteinander und leitet Datenpakete anhand der IP-Adresse an das richtige Ziel weiter. Er arbeitet auf Schicht 3 (Netzwerkschicht) des OSI-Modells.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'leicht',
      'question': 'Was ist der Unterschied zwischen einem Switch und einem Hub?',
      'option_a': 'Ein Hub ist schneller als ein Switch',
      'option_b': 'Ein Switch sendet Daten gezielt an den Empfänger, ein Hub sendet an alle',
      'option_c': 'Beide machen dasselbe, nur der Hub ist neuer',
      'option_d': 'Ein Switch verbindet Netzwerke, ein Hub einzelne Geräte',
      'correct_answer': 'B',
      'explanation': 'Ein Switch sendet Datenpakete gezielt an den richtigen Empfänger (anhand der MAC-Adresse). Ein Hub sendet alle Daten an alle angeschlossenen Geräte, was ineffizient und unsicher ist.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'mittel',
      'question': 'Was beschreibt das OSI-Modell?',
      'option_a': 'Ein Sicherheitsprotokoll für verschlüsselte Verbindungen',
      'option_b': 'Ein 7-Schichten-Modell das Netzwerkkommunikation in standardisierte Ebenen aufteilt',
      'option_c': 'Ein Protokoll zur Vergabe von IP-Adressen',
      'option_d': 'Ein Standard für WLAN-Verbindungen',
      'correct_answer': 'B',
      'explanation': 'Das OSI-Modell (Open Systems Interconnection) teilt Netzwerkkommunikation in 7 Schichten: Bitübertragung, Sicherung, Vermittlung, Transport, Sitzung, Darstellung, Anwendung.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'mittel',
      'question': 'Was ist der Unterschied zwischen IPv4 und IPv6?',
      'option_a': 'IPv6 ist älter als IPv4',
      'option_b': 'IPv4 verwendet 32-Bit-Adressen, IPv6 verwendet 128-Bit-Adressen und bietet deutlich mehr Adressen',
      'option_c': 'IPv4 ist schneller als IPv6',
      'option_d': 'IPv6 wird nur in mobilen Netzwerken verwendet',
      'correct_answer': 'B',
      'explanation': 'IPv4 hat 32-Bit-Adressen (~4,3 Milliarden Adressen). IPv6 hat 128-Bit-Adressen und bietet nahezu unbegrenzt viele Adressen, was die Erschöpfung des IPv4-Adressraums löst.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'leicht',
      'question': 'Wofür steht die Abkürzung DHCP?',
      'option_a': 'Dynamic Host Configuration Protocol',
      'option_b': 'Data Handling and Control Process',
      'option_c': 'Digital Hardware Communication Port',
      'option_d': 'Direct Host Connection Protocol',
      'correct_answer': 'A',
      'explanation': 'DHCP (Dynamic Host Configuration Protocol) weist Geräten im Netzwerk automatisch IP-Adressen zu, sodass keine manuelle Konfiguration nötig ist.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'mittel',
      'question': 'Was ist eine MAC-Adresse?',
      'option_a': 'Eine IP-Adresse für Apple-Geräte',
      'option_b': 'Eine weltweit eindeutige Hardware-Adresse die jedem Netzwerkgerät fest zugewiesen ist',
      'option_c': 'Ein verschlüsseltes Passwort für WLAN-Netzwerke',
      'option_d': 'Die Adresse eines Mailservers',
      'correct_answer': 'B',
      'explanation': 'Eine MAC-Adresse (Media Access Control) ist eine 48-Bit-Hardwareadresse, die jedem Netzwerkadapter vom Hersteller dauerhaft zugewiesen wird. Sie wird zur Kommunikation innerhalb eines Netzwerksegments genutzt.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'mittel',
      'question': 'Was ist der Unterschied zwischen TCP und UDP?',
      'option_a': 'TCP ist langsamer aber zuverlässiger, UDP ist schneller aber ohne Fehlerkorrektur',
      'option_b': 'UDP ist zuverlässiger als TCP',
      'option_c': 'TCP wird nur für Videos verwendet, UDP für Webseiten',
      'option_d': 'Beide Protokolle sind identisch',
      'correct_answer': 'A',
      'explanation': 'TCP (Transmission Control Protocol) stellt eine zuverlässige Verbindung sicher (mit Bestätigung). UDP (User Datagram Protocol) ist schneller, aber ohne Garantie der Zustellung – geeignet für Streaming oder Gaming.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'schwer',
      'question': 'Was ist Subnetting?',
      'option_a': 'Eine Methode zur WLAN-Verschlüsselung',
      'option_b': 'Das Aufteilen eines IP-Netzwerks in kleinere Teilnetzwerke mithilfe einer Subnetzmaske',
      'option_c': 'Ein Protokoll zur automatischen IP-Vergabe',
      'option_d': 'Eine Technik zur Verbindung zweier Router',
      'correct_answer': 'B',
      'explanation': 'Subnetting teilt ein großes IP-Netzwerk in kleinere Subnetze auf. Die Subnetzmaske (z.B. 255.255.255.0) legt fest, welcher Teil der IP-Adresse das Netzwerk und welcher den Host beschreibt.',
    },
    {
      'category': 'Netzwerktechnik',
      'difficulty': 'schwer',
      'question': 'Was ist der Unterschied zwischen DNS und DHCP?',
      'option_a': 'DNS und DHCP machen dasselbe, nur für verschiedene Betriebssysteme',
      'option_b': 'DNS löst Domainnamen in IP-Adressen auf, DHCP vergibt IP-Adressen automatisch an Geräte',
      'option_c': 'DHCP verschlüsselt Netzwerkverbindungen, DNS nicht',
      'option_d': 'DNS vergibt IP-Adressen, DHCP löst Domainnamen auf',
      'correct_answer': 'B',
      'explanation': 'DNS (Domain Name System) übersetzt Domainnamen (z.B. google.com) in IP-Adressen. DHCP (Dynamic Host Configuration Protocol) weist Geräten im Netzwerk automatisch IP-Adressen zu.',
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
  print('${fragen.length} Netzwerktechnik Fragen eingefügt!');
}
