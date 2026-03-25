import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';
import '../../Services/user_repository.dart';

import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';
import '../theme/widgets/primary_button.dart';

import 'admin_screen.dart';
import 'user_screen.dart';
import 'quiz_screen.dart';
import 'login_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const HomeScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    final displayName = user?.toString() ?? '—';
    final role = user == null ? 'guest' : user.role.toString();

    return AppScaffold(
      title: 'Fish&Chips',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('User: $displayName'),
                  Text('Rolle: $role'),
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
              label: 'Leaderboard',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LeaderboardScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            PrimaryButton(
              label: role == 'admin' ? 'Admin Bereich' : 'User Bereich',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => role == 'admin'
                        ? AdminScreen(userRepo: userRepo, auth: auth)
                        : UserScreen(userRepo: userRepo, auth: auth),
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