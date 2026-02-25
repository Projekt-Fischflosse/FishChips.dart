import 'package:flutter/material.dart';
import 'db_stub.dart' if (dart.library.io) 'db_native.dart';

void main() {
  initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish & Chips App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const QuestionsPage(),
    );
  }
}

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fragen-Tabelle'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Kategorie')),
            DataColumn(label: Text('Frage')),
          ],
          rows: questions
              .map(
                (q) => DataRow(cells: [
                  DataCell(Text(q['category'] ?? '')),
                  DataCell(Text(q['question'] ?? '')),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
