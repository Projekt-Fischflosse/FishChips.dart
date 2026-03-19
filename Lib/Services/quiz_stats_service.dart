import 'package:cloud_firestore/cloud_firestore.dart';

class QuizStatsService {

  Future<void> saveQuizResult({
    required String userId,
    required String category,
    required int total,
    required int correct,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('quizStats')
        .add({
      'category': category,
      'totalQuestions': total,
      'correctAnswers': correct,
      'wrongAnswers': total - correct,
      'score': (correct / total) * 100,
      'playedAt': FieldValue.serverTimestamp(),
    });
  }
}