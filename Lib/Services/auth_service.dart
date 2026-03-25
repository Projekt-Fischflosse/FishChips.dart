import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 1. Sign In with Email and Password
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print("Login Error: ${e.toString()}");
      return null;
    }
  }

  // 2. Register with Email and Password
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print("Registration Error: ${e.toString()}");
      return null;
    }
  }

  // 3. Sign Out
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Logout Error: ${e.toString()}");
    }
  }

  // 4. Auth State Stream (to listen if user is logged in or not)
  Stream<User?> get userStatus {
    return _auth.authStateChanges();
  }
}