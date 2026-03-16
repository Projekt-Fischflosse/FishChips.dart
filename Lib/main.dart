import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth_wrapper.dart'; // This is the logic that chooses between Login and Home

void main() async {
  // Ensure that all Flutter widgets are loaded before initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Connect the app to your Firebase project
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish & Chips App',
      debugShowCheckedModeBanner: false, // Removes the red "Debug" banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // The app starts at the AuthWrapper to check if the user is logged in
      home: const AuthWrapper(), 
    );
  }
}