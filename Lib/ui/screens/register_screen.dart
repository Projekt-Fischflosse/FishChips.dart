import 'package:flutter/material.dart';

import '../../../Services/auth_service.dart';
import '../../../Services/user_repository.dart';

import '../theme/widgets/app_scaffold.dart';
import '../theme/widgets/app_card.dart';
import '../theme/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository userRepo;
  final AuthService auth;

  const RegisterScreen({
    super.key,
    required this.userRepo,
    required this.auth,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  Future<void> _doRegister() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await widget.auth.register(
        name: _nameCtrl.text,
        password: _passCtrl.text,
      );
      if (!mounted) return;
      Navigator.of(context).pop();
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
          Text('Registrieren', style: Theme.of(context).textTheme.headlineMedium),
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
                  label: _loading ? 'Bitte warten…' : 'Account erstellen',
                  onPressed: _loading ? null : _doRegister,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: OutlinedButton(
              onPressed: _loading ? null : () => Navigator.of(context).pop(),
              child: const Text('Zurück'),
            ),
          ),
        ],
      ),
    );
  }
}