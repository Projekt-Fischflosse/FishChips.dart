import 'package:sqlite3/sqlite3.dart';

void main() {
  // Bestehende Datenbank öffnen
  final db = sqlite3.open('fish_and_chips.db');

  // 10 Fragen für IT Arbeitsplatz definieren
  final fragen = [
    {
      // Kategorie für spätere Filterung
      'category': 'Grundlagen Fachinformatik',

      // Schwierigkeitsgrad
      'difficulty': 'leicht',

      // Frage
      'question': 'Was ist der Unterschied zwischen Hardware und Software?',

      // Antwortoptionen
      'option_a': 'Hardware ist teurer als Software',
      'option_b': 'Hardware sind physische Komponenten, Software sind Programme und Daten',
      'option_c': 'Software kann man anfassen, Hardware nicht',
      'option_d': 'Es gibt keinen Unterschied, beide Begriffe bedeuten dasselbe',

      // Richtige Antwort
      'correct_answer': 'B',

      // Erklärung
      'explanation': 'Hardware bezeichnet alle physisch greifbaren Komponenten eines Computers (z.B. CPU, RAM), während Software Programme, Betriebssysteme und Daten umfasst.',
    }
    