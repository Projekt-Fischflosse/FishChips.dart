import '../Fragen/Cybersecurity.dart';
import '../Fragen/Datenbankgrundlagen.dart';
import '../Fragen/Generationen_Modelle.dart';
import '../Fragen/Grundlagen Fachinformatik.dart';
import '../Fragen/IT Arbeitsplatz.dart';
import '../Fragen/Netzwerktechnik.dart';
import '../Fragen/PQSM.dart';
import '../Fragen/Python_Programmierung.dart';
import '../Fragen/Wirtschafts_und_Geschaeftsprozesse.dart';

class FragenService {
  static final List<Map<String, String>> _alleFragen = [
    ...fragenComputergenerationen,
    ...fragenCybersecurity,
    ...fragenDatenbankgrundlagen,
    ...fragenGrundlagenFachinformatik,
    ...fragenITArbeitsplatz,
    ...fragenNetzwerktechnik,
    ...fragenPQSM,
    ...fragenPythonProgrammierung,
    ...fragenWirtschaft,
  ];

  List<Map<String, dynamic>> fragenLaden(String kategorie) {
    return _alleFragen
        .where((f) => f['category'] == kategorie)
        .map((f) {
          final antworten = [
            f['option_a'],
            f['option_b'],
            f['option_c'],
            f['option_d'],
          ].whereType<String>().where((a) => a.isNotEmpty).toList();

          final letter = (f['correct_answer'] ?? '').toUpperCase();
          final richtigeAntwort = {
            'A': f['option_a'],
            'B': f['option_b'],
            'C': f['option_c'],
            'D': f['option_d'],
          }[letter] ?? '';

          antworten.shuffle();
          return <String, dynamic>{
            'frage': f['question'] ?? '',
            'antworten': antworten,
            'richtige_antwort': richtigeAntwort,
            'explanation': f['explanation'] ?? '',
          };
        })
        .toList();
  }
}
