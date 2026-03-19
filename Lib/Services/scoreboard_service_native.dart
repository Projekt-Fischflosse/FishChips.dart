import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreboardService {
  final _db = FirebaseFirestore.instance;

  // Score speichern - wird von ErgebnisScreen aufgerufen
  Future<void> scoreEintragen(String kategorie, int richtig, int falsch) async {
    await _db.collection('scoreboard').add({
      'kategorie': kategorie,
      'richtig': richtig,
      'falsch': falsch,
      'date': Timestamp.now(),
    });
  }

  // Top Scores laden - wird vom Leaderboard aufgerufen
  Future<List<Map<String, dynamic>>> getTopScores() async {
    final snapshot = await _db
        .collection('scoreboard')
        .orderBy('richtig', descending: true)
        .limit(10)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}