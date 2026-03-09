// lib/Services/question_repository.dart
import 'dart:io';

import 'package:sqlite3/sqlite3.dart';
import 'package:fish_chips/Services/quiz_logic.dart';

import '../models/question.dart';

class QuestionRepository {
  final String dbFileName;

  QuestionRepository({this.dbFileName = 'fish_and_chips.db'});

  /// UI-kompatibel: liefert dein simples Question-Model (frage/antworten/richtig)
  Future<List<Question>> load() async {
    final all = loadAllQuestions();

    return all.map((qq) {
      final answers = qq.answers.map((a) => a.text).toList();
      final correctIndex = qq.answers.indexWhere((a) => a.isCorrect);

      return Question(
        frage: qq.prompt,
        antworten: answers,
        richtig: correctIndex >= 0 ? correctIndex : 0,
      );
    }).toList();
  }

  /// Originale DB-Ladefunktion: liefert QuizQuestion aus quiz_logic.dart
  List<QuizQuestion> loadAllQuestions() {
    final path = _resolveDbPath(dbFileName);

    if (!File(path).existsSync()) {
      throw Exception(
        'Datenbank nicht gefunden: $path\n'
        'Starte einmal:\n'
        'dart run lib/Fragen/Generationen_Modelle.dart\n'
        'dart run lib/Fragen/Cybersecurity.dart',
      );
    }

    final db = sqlite3.open(path);

    db.execute('''
      CREATE TABLE IF NOT EXISTS questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT NOT NULL,
        difficulty TEXT,
        question TEXT,
        option_a TEXT,
        option_b TEXT,
        option_c TEXT,
        option_d TEXT,
        correct_answer TEXT,
        explanation TEXT,
        created_date TEXT
      )
    ''');

    final rows = db.select('''
      SELECT
        id, category, question,
        option_a, option_b, option_c, option_d,
        correct_answer, explanation
      FROM questions
      ORDER BY id ASC
    ''');

    final result = <QuizQuestion>[];

    for (final r in rows) {
      final id = r['id']?.toString() ?? '';
      final category = (r['category'] ?? '').toString();
      final prompt = (r['question'] ?? '').toString();

      final a = r['option_a']?.toString();
      final b = r['option_b']?.toString();
      final c = r['option_c']?.toString();
      final d = r['option_d']?.toString();
      final correct = r['correct_answer']?.toString();
      final explanation = r['explanation']?.toString();

      final hasOptions =
          [a, b, c, d].every((x) => x != null && x.trim().isNotEmpty);

      final answers = hasOptions
          ? _buildAnswersFromOptions(a!, b!, c!, d!, correct)
          : _placeholderAnswers();

      result.add(
        QuizQuestion(
          id: 'db-$id',
          category: category,
          prompt: prompt,
          answers: answers,
          explanation: explanation,
        ),
      );
    }

    db.dispose();
    return result;
  }

  List<QuizAnswer> _buildAnswersFromOptions(
    String a,
    String b,
    String c,
    String d,
    String? correct,
  ) {
    final correctNorm = (correct ?? '').trim().toLowerCase();
    bool isCorrectText(String t) => t.trim().toLowerCase() == correctNorm;

    return <QuizAnswer>[
      QuizAnswer(text: a, isCorrect: isCorrectText(a)),
      QuizAnswer(text: b, isCorrect: isCorrectText(b)),
      QuizAnswer(text: c, isCorrect: isCorrectText(c)),
      QuizAnswer(text: d, isCorrect: isCorrectText(d)),
    ];
  }

  List<QuizAnswer> _placeholderAnswers() {
    return const [
      QuizAnswer(text: 'Antwort A (noch nicht gepflegt)', isCorrect: false),
      QuizAnswer(text: 'Antwort B (noch nicht gepflegt)', isCorrect: false),
      QuizAnswer(text: 'Antwort C (noch nicht gepflegt)', isCorrect: false),
      QuizAnswer(text: 'Antwort D (noch nicht gepflegt)', isCorrect: false),
    ];
  }

  String _resolveDbPath(String fileName) {
    final cwd = Directory.current.path;
    return '$cwd${Platform.pathSeparator}$fileName';
  }
}