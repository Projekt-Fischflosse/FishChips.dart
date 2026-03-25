import 'package:flutter/material.dart';

import '../../Services/scoreboard_service.dart';
import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final _service = ScoreboardService();
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.getTopScores();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Leaderboard',
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return AppCard(child: Text('Fehler: ${snap.error}'));
          }

          final scores = snap.data ?? [];
          if (scores.isEmpty) {
            return const AppCard(
              child: Text('Noch keine Einträge vorhanden.'),
            );
          }

          return ListView.separated(
            itemCount: scores.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final s = scores[i];
              final richtig = s['richtig'] ?? 0;
              final falsch = s['falsch'] ?? 0;
              final kategorie = s['kategorie'] ?? '–';

              return AppCard(
                child: Row(
                  children: [
                    Text(
                      '${i + 1}.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: i == 0
                                ? Colors.amber
                                : i == 1
                                    ? Colors.grey
                                    : i == 2
                                        ? Colors.brown
                                        : null,
                          ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kategorie,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.green, size: 16),
                              const SizedBox(width: 4),
                              Text('$richtig richtig'),
                              const SizedBox(width: 12),
                              const Icon(Icons.cancel,
                                  color: Colors.red, size: 16),
                              const SizedBox(width: 4),
                              Text('$falsch falsch'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '$richtig Pts',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
