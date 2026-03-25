import 'package:flutter/material.dart';
import '../Services/auth_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Separate controllers for the registration form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // New User Email
            TextField(
              controller: _emailController,
              onChanged: (value) => setState(() {}), // Help Flutter Web capture text
              decoration: const InputDecoration(
                labelText: "New Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            // New User Password
            TextField(
              controller: _passwordController,
              onChanged: (value) => setState(() {}),
              decoration: const InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 25),
            
            // REGISTER BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text;

                print("DEBUG: Registering '$email'...");
                var user = await _auth.register(email, password);
                
                if (user != null) {
                  // If success, show message and go back to Login
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Account created! You can now login.")),
                    );
                    Navigator.pop(context); // This closes the registration screen
                  }
                }
              },
              child: const Text("Register Now"),
            ),
          ],
        ),
      ),
    );
  }
}