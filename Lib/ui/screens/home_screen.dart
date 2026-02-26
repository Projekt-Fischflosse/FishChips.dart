import 'package:flutter/material.dart';
import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';
import '../theme/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Fish&Chips',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 6),
          Text(
            'Quiz-App • Team Fischflosse',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 18),

          // Content Cards
          AppCard(
            child: Row(
              children: [
                Icon(Icons.school, color: cs.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Wähle ein Thema und starte das Quiz.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Schnellstart', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _Chip('Cybersecurity'),
                    _Chip('Netzwerke'),
                    _Chip('Datenbanken'),
                    _Chip('OOP'),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Actions
          PrimaryButton(
            label: 'Quiz starten',
            onPressed: () {
              // TODO: Navigation zum Quiz
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: OutlinedButton(
              onPressed: () {
                // TODO: Einstellungen / Scores
              },
              child: const Text('Highscores / Einstellungen'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: () {},
    );
  }
}