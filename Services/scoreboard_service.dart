// import erste lädt die SQLite Bibliothek damit wir eine Datenbank nutzen können
// import zweite hilft den richtigen speicherort auf dem Gerät zu finden
import 'package:sqflite/sqflite.dart';    
import 'package:path/path.dart';

// Erstellt eine Klasse, wie eine Art werkzeugkasten für alles was mit dem scoreboard zu tun hat
// static ist eine variabel die die db verbindung speichert (kann auch leer(null) sein) 
class ScoreboardService {
  static Database? _db;

// eine Funktion die die DB zurückgibt 
// Future = sie braucht kurz Zeit (async)
// if (_db.... = beim ersten mal starten der app ist sie leer (null) - Wenn jemand zum 2. die DB aufruft:
//    _db != null (ist_db nicht leer?) - ja ist offen
//    danach return_db! - gibt zurück
//    ! am ende bedeutet - ich garantiere dass _db hier nicht null ist
// _db = await... bedeutet öffne die db erst (_initDB) und warte bbis sie fertig ist (await)
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB()!;
    return _db!;
  }
// Erstellt und/oder öffnet die db datei
// final path = sucht den richtigen ordner auf dem gerät UND setzt den richtigen dateinamen dran
// return await...= öffnet die datei, wenn nicht existiert, wird onCreate ausgeführt wo die Tabelle ist
  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'scoreboard.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

    )
}
// code für die Tabelle
await db.execute('''
  CREATE TABLE IF NOT EXISTS quiz_results (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    datum TEXT,
    kategorie TEXT,
    richtig INTEGER,
    falsch INTEGER,
    score INTEGER
  )
''');
  );
}
