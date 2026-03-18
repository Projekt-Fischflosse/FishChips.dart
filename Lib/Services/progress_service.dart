import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressService {

  // Fortschritt speichern/updaten nach jeder Frage
  Future<void> updateProgress(String userId, String categoryId, bool wasCorrect) async {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc(categoryId);

    final doc = await ref.get();

    if (doc.exists) {
      await ref.update({
        'completedQuestions': FieldValue.increment(1),
        'correctAnswers': FieldValue.increment(wasCorrect ? 1 : 0),
        'lastAccessed': FieldValue.serverTimestamp(),
      });
    } else {
      await ref.set({
        'categoryName': categoryId,
        'totalQuestions': 20,
        'completedQuestions': 1,
        'correctAnswers': wasCorrect ? 1 : 0,
        'lastAccessed': FieldValue.serverTimestamp(),
      });
    }
  }

  // Fortschritt für eine Kategorie abrufen
  Future<Map<String, dynamic>?> getProgress(String userId, String categoryId) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('progress')
        .doc(categoryId)
        .get();

    return doc.exists ? doc.data() : null;
  }

  // Alle Kategorien-Fortschritte abrufen
  Future<List<Map<String, dynamic>>> getAllProgress(String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('progress')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}