import 'package:flutter/material.dart';
import 'ergebnis.dart';

class QuizScreen extends StatefulWidget {
  final String kategorie;
  final List<Map<String, dynamic>> fragen;

  const QuizScreen({
    super.key,
    required this.kategorie,
    required this.fragen,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _aktuelleFrageIndex = 0;
  int _richtig = 0;
  bool _geantwortet = false;
  String? _letzteAntwort;

  Map<String, dynamic> get _aktuelleFrage => widget.fragen[_aktuelleFrageIndex];

  @override
  Widget build(BuildContext context) {
    if (widget.fragen.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.kategorie)),
        body: const Center(child: Text('Keine Fragen gefunden.')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kategorie),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Frage ${_aktuelleFrageIndex + 1} / ${widget.fragen.length}'),
            const SizedBox(height: 20),
            Text(
              _aktuelleFrage['frage'] ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ...(_aktuelleFrage['antworten'] as List).map((antwort) {
              Color? farbe;
              if (_geantwortet) {
                if (antwort == _aktuelleFrage['richtige_antwort']) {
                  farbe = Colors.green;
                } else if (antwort == _letzteAntwort) {
                  farbe = Colors.red;
                }
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: farbe != null
                      ? ElevatedButton.styleFrom(backgroundColor: farbe, foregroundColor: Colors.white)
                      : null,
                  onPressed: _geantwortet ? null : () => _antwortPruefen(antwort),
                  child: Text(antwort),
                ),
              );
            }),
            if (_geantwortet)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  _aktuelleFrage['richtige_antwort'] == _letzteAntwort
                      ? 'Richtig!'
                      : 'Falsch!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _aktuelleFrage['richtige_antwort'] == _letzteAntwort
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
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

  void _antwortPruefen(String gewaehlteAntwort) {
    setState(() {
      _geantwortet = true;
      _letzteAntwort = gewaehlteAntwort;
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
        _letzteAntwort = null;
      });
    } else {
      _quizBeendet();
    }
  }

  void _quizBeendet() {
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
  }
}
