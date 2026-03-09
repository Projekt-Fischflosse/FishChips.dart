import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';
import '../../Services/user_repository.dart';

import 'login_screen.dart';
import 'home_screen.dart';

class StartScreen extends StatelessWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const StartScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return LoginScreen(userRepo: userRepo, auth: auth);
    }
    return HomeScreen(userRepo: userRepo, auth: auth);
  }
}