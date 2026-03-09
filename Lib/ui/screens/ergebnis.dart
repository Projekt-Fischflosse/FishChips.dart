//importiert Flutter Material
import 'package:flutter/material.dart';
// Importiert den ScoreboardService um den Score zu speichern
import '../Services/scoreboard_service.dart';

//statefulWidget weil wir den Score in die DB speichern müssen (async)
class ErgebnisScreen extends StatefulWidget {
  // die drei Werte die wir vom QuizScreen mitbekommen
  final String kategorie;
  final int richtig;
  final int falsch;

  const ErgebnisScreen({
    super.key,
    required this.kategorie,
    required this.richtig,
    required this.falsch,
  });

  @override
  State<ErgebnisScreen> createState() => _ErgebnisScreenState();
}

class _ErgebnisScreenState extends State<ErgebnisScreen> {
  //die instanz von ScoreboardService um scoreEintragen aufrufen zu können
  final ScoreboardService _service = ScoreboardService();

  //initState = wird einmal aufgerufen wenn der Screen geladen wird
  @override
  void initState() {
    super.initState();
    //Score sofort beim Öffnen des Screens speichern
    _service.scoreEintragen(widget.kategorie, widget.richtig, widget.falsch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ergebnis'),
      ),
      body: Center(
        //column zentriert alles untereinander
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //kategorie anzeigen
            Text('Kategorie: ${widget.kategorie}',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            //rrichtige Antworten grün anzeigen
            Text('Richtig: ${widget.richtig}',
                style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 10),
            //falsche Antworten rot anzeigen
            Text('Falsch: ${widget.falsch}',
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(height: 30),
            //button um zurück zur Startseite zu gehen
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Zurück zur Startseite'),
            ),
          ],
        ),
      ),
    );
  }
}