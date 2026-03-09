// Importiert Flutter Material
import 'package:flutter/material.dart';
// Importiert den QuizScreen um ihn aufrufen zu können
import 'quiz.dart';

// StatelessWidget = diese Seite verändert sich nicht
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Titel der App
        title: const Text('Fish & Chips Quiz'),
      ),
      body: Center(
        // Column ordnet alles untereinander an
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App-Titel
            const Text(
              'Willkommen!',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 40),
            // Button für jede Kategorie
            ElevatedButton(
              // navigiert zum QuizScreen und gibt Kategorie + leere Fragenliste mit
              // TODO: Navigation zum Quiz
              onPressed: () {
                //navigiert zum quiz screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      kategorie:'Allgemein',
                      fragen: const []
                    ),
                  ),
                );
              },
              child: const Text('Quiz starten'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // TODO: Einstellungen / Scores
              onPressed: () {},
              child: const Text('Meine Scores'),
            ),
          ],
        ),
      ),
    );
  }
}
