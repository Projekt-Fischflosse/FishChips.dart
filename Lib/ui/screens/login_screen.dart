import 'package:flutter/material.dart';

import '../../../Services/auth_service.dart';
import '../../../Services/user_repository.dart';

import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';
import '../theme/widgets/primary_button.dart';

import 'register_screen.dart';
import 'admin_screen.dart';
import 'user_screen.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const LoginScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _doLogin() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final u = await widget.auth.login(
        name: _nameCtrl.text,
        password: _passCtrl.text,
      );

      if (!mounted) return;

      if (u.role == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => AdminScreen(userRepo: widget.userRepo, auth: widget.auth),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => UserScreen(userRepo: widget.userRepo, auth: widget.auth),
          ),
        );
      }
    } catch (e) {
      setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),

          if (_error != null) ...[
            AppCard(child: Text(_error!, style: const TextStyle(color: Colors.red))),
            const SizedBox(height: 12),
          ],

          AppCard(
            child: Column(
              children: [
                TextField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(labelText: 'Benutzername'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passCtrl,
                  decoration: const InputDecoration(labelText: 'Passwort'),
                  obscureText: true,
                ),
                const SizedBox(height: 14),
                PrimaryButton(
                  label: _loading ? 'Bitte warten…' : 'Einloggen',
                  onPressed: _loading ? null : _doLogin,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RegisterScreen(userRepo: widget.userRepo, auth: widget.auth),
                  ),
                );
              },
              child: const Text('Registrieren'),
            ),
          ),
        ],
      ),
    );
  }
}