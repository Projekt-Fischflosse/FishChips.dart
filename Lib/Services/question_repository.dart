// lib/Services/question_repository.dart
import '../models/question.dart';
import '../Fragen/Cybersecurity.dart';
import '../Fragen/Datenbankgrundlagen.dart';
import '../Fragen/Generationen_Modelle.dart';
import '../Fragen/Grundlagen Fachinformatik.dart';
import '../Fragen/IT Arbeitsplatz.dart';
import '../Fragen/Netzwerktechnik.dart';
import '../Fragen/PQSM.dart';
import '../Fragen/Python_Programmierung.dart';
import '../Fragen/Wirtschafts_und_Geschaeftsprozesse.dart';

class QuestionRepository {
  List<Question> load() {
    final alleFragen = [
      ...fragenCybersecurity,
      ...fragenDatenbankgrundlagen,
      ...fragenComputergenerationen,
      ...fragenGrundlagenFachinformatik,
      ...fragenITArbeitsplatz,
      ...fragenNetzwerktechnik,
      ...fragenPQSM,
      ...fragenPythonProgrammierung,
      ...fragenWirtschaft,
    ];

    return alleFragen.map((f) {
      return Question(
        frage: f['question'] ?? '',
        antworten: [
          f['option_a'] ?? '',
          f['option_b'] ?? '',
          f['option_c'] ?? '',
          f['option_d'] ?? '',
        ],
        richtig: _correctIndex(f['correct_answer']),
      );
    }).toList();
  }

  int _correctIndex(String? answer) {
    switch (answer?.toUpperCase()) {
      case 'A': return 0;
      case 'B': return 1;
      case 'C': return 2;
      case 'D': return 3;
      default: return 0;
    }
  }
}