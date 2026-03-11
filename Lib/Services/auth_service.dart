import '../models/app_user.dart';
import 'local_store.dart';
import 'user_repository.dart';

class AuthService {
  final UserRepository _repo;

  AppUser? _current;
  AppUser? get currentUser => _current;

  AuthService(this._repo);

  Future<void> restoreSession() async {
    final name = await LocalStore.loadSessionUserName();
    if (name == null) return;
    _current = _repo.findByName(name);
  }

  Future<AppUser> login({
    required String name,
    required String password,
  }) async {
    final u = _repo.findByName(name);
    if (u == null) {
      throw Exception('Benutzer nicht gefunden.');
    }
    if (u.password != password) {
      throw Exception('Falsches Passwort.');
    }

    u.logins.add(DateTime.now().toIso8601String());
    await _repo.persist();

    _current = u;
    await LocalStore.saveSessionUserName(u.name);
    return u;
  }

  Future<AppUser> register({
    required String name,
    required String password,
  }) async {
    if (name.trim().isEmpty || password.trim().isEmpty) {
      throw Exception('Name und Passwort dürfen nicht leer sein.');
    }
    final existing = _repo.findByName(name);
    if (existing != null) {
      throw Exception('Dieser Benutzername existiert bereits.');
    }

    final u = AppUser(
      name: name.trim(),
      password: password,
      role: 'user',
      score: 0,
      logins: [DateTime.now().toIso8601String()],
    );

    await _repo.add(u);

    _current = u;
    await LocalStore.saveSessionUserName(u.name);
    return u;
  }

  Future<void> logout() async {
    _current = null;
    await LocalStore.clearSession();
  }

  Future<void> addScore(int delta) async {
    final u = _current;
    if (u == null) return;
    u.score += delta;
    await _repo.persist();
  }
}