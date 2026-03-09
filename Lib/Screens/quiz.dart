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
              // für jede Antwort wird ein Padding + Button erstellt
              return Padding(
                // Abstand nach unten zwischen den Buttons
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  // falls _geantwortet = true, ist onPressed null = Button deaktiviert
                  // falls _geantwortet = false, wird _antwortPruefen aufgerufen
                  onPressed: _geantwortet ? null : () => _antwortPruefen(antwort),
                  // zeigt den Antworttext auf dem Button an
                  child: Text(antwort),
                ),
              );
            }),
            ],
        ),
      ),
    );
  }
   // wird aufgerufen wenn der User einen Antwort-Button drückt
  void _antwortPruefen(String gewaehlteAntwort) {
    // setState = sagt Flutter dass sich etwas geändert hat, UI neu aufbauen
    setState(() {
      // verhindert dass nochmal geklickt werden kann
      _geantwortet = true;
      // vergleicht die gewählte Antwort mit der richtigen Antwort aus der DB
      if (gewaehlteAntwort == _aktuelleFrage['richtige_antwort']) {
        // richtig = Score um 1 erhöhen
        _richtig++;
      }
    });

    // 1 Sekunde warten, dann nächste Frage laden
    Future.delayed(const Duration(seconds: 1), () {
      // ist das die letzte Frage?
      if (_aktuelleFrageIndex < widget.fragen.length - 1) {
        // nein = nächste Frage
        setState(() {
          _aktuelleFrageIndex++;
          _geantwortet = false;
        });
      } else {
        // ja = Quiz beendet, Ergebnis-Screen öffnen (ausserhalb von setState)
        _quizBeendet();
      }
    });
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