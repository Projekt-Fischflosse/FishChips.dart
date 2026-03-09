import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';
import '../../Services/user_repository.dart';
import '../../Services/question_repository.dart';

import '../../models/question.dart';

import '../../theme/widgets/app_scaffold.dart';
import '../../theme/widgets/app_card.dart';
import '../../theme/widgets/primary_button.dart';

class QuizScreen extends StatefulWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const QuizScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _repo = QuestionRepository();
  late Future<List<Question>> _future;

  int _index = 0;
  int? _selected;
  int _score = 0;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _future = _repo.load();
  }

  void _select(int i) {
    if (_answered) return;
    setState(() => _selected = i);
  }

  void _confirm(List<Question> questions) {
    if (_answered) return;
    final q = questions[_index];
    final s = _selected;
    if (s == null) return;

    setState(() {
      _answered = true;
      if (s == q.richtig) _score++;
    });
  }

  void _next(List<Question> questions) {
    if (!_answered) return;

    if (_index >= questions.length - 1) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Fertig!'),
          content: Text('Punkte: $_score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _index++;
      _selected = null;
      _answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quiz',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Question>>(
          future: _future,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return AppCard(child: Text('Fehler: ${snap.error}'));
            }

            final questions = snap.data ?? <Question>[];
            if (questions.isEmpty) {
              return AppCard(
                child: const Text(
                  'Keine Fragen vorhanden.\n'
                  'Aktuell liefert QuestionRepository.load() noch keine Daten.',
                ),
              );
            }

            final q = questions[_index];

            return Column(
              children: [
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Frage ${_index + 1} / ${questions.length}',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(q.frage,
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: ListView.separated(
                    itemCount: q.antworten.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final selected = _selected == i;

                      Color? bg;
                      if (_answered) {
                        if (i == q.richtig) {
                         bg = Colors.green.withValues(alpha: 0.15);
                        } else if (selected) {
                          bg = Colors.red.withValues(alpha: 0.15);
                        }
                      } else if (selected) {
                        bg = Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.12);
                      }

                      return InkWell(
                        onTap: () => _select(i),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black12,
                            ),
                          ),
                          child: Text(q.antworten[i]),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                if (!_answered)
                  PrimaryButton(
                    label: 'Antwort bestätigen',
                    onPressed:
                        _selected == null ? null : () => _confirm(questions),
                  )
                else
                  PrimaryButton(
                    label: _index == questions.length - 1
                        ? 'Ergebnis anzeigen'
                        : 'Nächste Frage',
                    onPressed: () => _next(questions),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}