import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';
import '../../Services/user_repository.dart';

import '../../theme/widgets/app_scaffold.dart';
import '../../theme/widgets/app_card.dart';
import '../../theme/widgets/primary_button.dart';

import 'quiz_screen.dart';
import 'login_screen.dart';

class UserScreen extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const UserScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    final displayName = user?.toString() ?? '—';

    return AppScaffold(
      title: 'Benutzer',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Willkommen!',
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
              label: 'Quiz starten',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(userRepo: userRepo, auth: auth),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            PrimaryButton(
              label: 'Logout',
              onPressed: () async {
                await auth.logout();
                if (!context.mounted) return;

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(userRepo: userRepo, auth: auth),
                  ),
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}