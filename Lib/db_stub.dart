// Stub für Web: SQLite nicht verfügbar, FragenService nutzt In-Memory-Daten
late final List<Map<String, String>> questions;

void initializeDatabase() {
  questions = [];
  print('Web: Fragen werden direkt aus dem Speicher geladen.');
}
