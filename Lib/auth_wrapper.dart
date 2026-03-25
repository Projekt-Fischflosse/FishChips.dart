import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fish_chips/Screens/home.dart'; // Import your Home Screen
import 'package:fish_chips/Screens/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Listen to the Firebase Auth state
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 1. If the snapshot has data, the user is logged in
        if (snapshot.hasData) {
          return const HomeScreen(); 
        }
        
        // 2. If no data, show the real Login Screen
        return const LoginScreen(); 
      }, // This closes builder
    ); // This closes StreamBuilder
  }
}