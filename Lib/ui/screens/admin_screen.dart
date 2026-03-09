import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';
import '../../Services/user_repository.dart';

import '../../theme/widgets/app_scaffold.dart';
import '../../theme/widgets/app_card.dart';
import '../../theme/widgets/primary_button.dart';

import 'quiz_screen.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class AdminScreen extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const AdminScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    final displayName = user?.toString() ?? '—';

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
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(userRepo: userRepo, auth: auth),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            PrimaryButton(
              label: 'Neuen Nutzer anlegen',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        RegisterScreen(userRepo: userRepo, auth: auth),
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