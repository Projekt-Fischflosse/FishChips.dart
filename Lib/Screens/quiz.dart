//importiert Flutter zeug - gibt uns alle UI Elemente (Buttons, Text undso)
import 'package:flutter/material.dart';
import 'ergebnis.dart';

//statefulWidget = die Seite kann sich verändern (z.B. nächste Frage laden)
class QuizScreen extends StatefulWidget {
  //kategorie = welches Thema wurde ausgewählt
  final String kategorie;
  //fragen = die Liste aller Fragen die wir anzeigen wollen
  final List<Map<String, dynamic>> fragen;

  //Konstruktor - diese Werte müssen beim Aufrufen mitgegeben werden
  const QuizScreen({
    super.key,
    required this.kategorie, // Pflichtfeld
    required this.fragen,    // Pflichtfeld
  });

  //verbindet das Widget mit seinem State
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

//hier passiert die ganze Logik (aktuelle Frage, Score zählen etc.)
class _QuizScreenState extends State<QuizScreen> {
   //aktuelle Fragenummer (startet bei 0)
  int _aktuelleFrageIndex = 0;
  //zählt wie viele Antworten richtig waren
  int _richtig = 0;
  //wurde eine Antwort ausgewählt? (verhindert doppeltes Klicken)
  bool _geantwortet = false;

  //gibt die aktuelle Frage zurück aus der Fragenliste
  //widget.fragen = greift auf die Fragen zu die wir beim Aufrufen mitgegeben haben
  Map<String, dynamic> get _aktuelleFrage => widget.fragen[_aktuelleFrageIndex];

  //build = baut die UI, wird jedes Mal neu aufgerufen wenn setState() ausgeführt wird
  @override
  Widget build(BuildContext context) {
    if (widget.fragen.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.kategorie)),
        body: const Center(child: Text('Keine Fragen gefunden.')),
      );
    }
    return Scaffold(
      //AppBar oben mit dem Kategorienamen
      appBar: AppBar(
        title: Text(widget.kategorie),
      ),
      //Padding = Abstand vom Rand
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //column = ordnet alles untereinander an
        child: Column(
          children: [
            // Fortschritt anzeigen 
            //_aktuelleFrageIndex + 1 weil Index bei 0 startet
            Text('Frage ${_aktuelleFrageIndex + 1} / ${widget.fragen.length}'),
            // SizedBox = leerer Abstand zwischen Elementen
            const SizedBox(height: 20),
            //Die eigentliche Frage aus der db
            // ?? '' bedeutet: falls null, zeige leeren Text
            Text(
              _aktuelleFrage['frage'] ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          const SizedBox(height: 30),
            // map() = geht durch jede Antwort und erstellt einen Button dafür
            // ... (spread operator) = fügt alle Buttons in die children Liste ein
            ...(_aktuelleFrage['antworten'] as List).map((antwort) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: _geantwortet ? null : () => _antwortPruefen(antwort),
                  child: Text(antwort),
                ),
              );
            }),
            if (_geantwortet && (_aktuelleFrage['explanation'] ?? '').isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Erklärung', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    const SizedBox(height: 6),
                    Text(_aktuelleFrage['explanation'] ?? ''),
                  ],
                ),
              ),
            if (_geantwortet)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _naechsteFrage,
                    child: Text(_aktuelleFrageIndex < widget.fragen.length - 1 ? 'Nächste Frage' : 'Ergebnis anzeigen'),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
   // wird aufgerufen wenn der User einen Antwort-Button drückt
  void _antwortPruefen(String gewaehlteAntwort) {
    setState(() {
      _geantwortet = true;
      if (gewaehlteAntwort == _aktuelleFrage['richtige_antwort']) {
        _richtig++;
      }
    });
  }

  void _naechsteFrage() {
    if (_aktuelleFrageIndex < widget.fragen.length - 1) {
      setState(() {
        _aktuelleFrageIndex++;
        _geantwortet = false;
      });
    } else {
      _quizBeendet();
    }
  }

  // wird aufgerufen wenn alle Fragen beantwortet wurden
  void _quizBeendet() {
    // Navigator ersetzt den aktuellen Screen mit dem Ergebnis-Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ErgebnisScreen(
          kategorie: widget.kategorie,
          richtig: _richtig,
          falsch: widget.fragen.length - _richtig,
        ),
      ),
    );
  }}