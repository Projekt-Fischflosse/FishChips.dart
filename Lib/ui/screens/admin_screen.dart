import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';
import '../theme/widgets/primary_button.dart';

import 'quiz_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.email ?? '—';

    return AppScaffold(
      title: 'Admin',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Admin Dashboard',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(user == null
                      ? 'Nicht eingeloggt'
                      : 'Eingeloggt als: $displayName'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            PrimaryButton(
              label: 'Quiz starten (Test)',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
            ),
            const SizedBox(height: 10),

            PrimaryButton(
              label: 'Logout',
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!context.mounted) return;
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
