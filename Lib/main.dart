import 'package:flutter/material.dart';

import 'Services/auth_service.dart';
import 'Services/user_repository.dart';

import 'ui/screens/login_screen.dart';
import 'ui/screens/admin_screen.dart';
import 'ui/screens/user_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) Repo + Service zentral erstellen
  final userRepo = UserRepository();
  await userRepo.init();

  // 2) Auth mit positional ctor (wichtig!)
  final auth = AuthService(userRepo);
  await auth.restoreSession();

  runApp(App(userRepo: userRepo, auth: auth));
}

class App extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const App({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fish&Chips',
      home: _StartGate(userRepo: userRepo, auth: auth),
    );
  }
}

/// Entscheidet beim Start:
/// - wenn Session vorhanden: AdminScreen oder UserScreen
/// - sonst: LoginScreen
class _StartGate extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const _StartGate({
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    final u = auth.currentUser;

    if (u == null) {
      return LoginScreen(userRepo: userRepo, auth: auth);
    }

    if (u.role == 'admin') {
      return AdminScreen(userRepo: userRepo, auth: auth);
    }

    return UserScreen(userRepo: userRepo, auth: auth);
  }
}
