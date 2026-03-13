import 'package:flutter/material.dart';
import 'package:fish_chips/Screens/quiz.dart';
import 'package:fish_chips/Services/fragen_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FragenService _fragenService = FragenService();

  static const List<String> _kategorien = [
    'Computergenerationen',
    'Cybersecurity',
    'Datenbankgrundlagen',
    'Grundlagen Fachinformatik',
    'IT Arbeitsplatz',
    'Netzwerktechnik',
    'PQSM',
    'Python Programmierung',
    'Wirtschafts- und Geschäftsprozesse',
  ];

  void _startQuiz(String kategorie) {
    final fragen = _fragenService.fragenLaden(kategorie);
    fragen.shuffle();
    if (fragen.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Keine Fragen für $kategorie gefunden.')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          kategorie: kategorie,
          fragen: fragen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish & Chips Quiz'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Wähle eine Kategorie:',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24),
              ..._kategorien.map((kat) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _startQuiz(kat),
                    child: Text(kat),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
