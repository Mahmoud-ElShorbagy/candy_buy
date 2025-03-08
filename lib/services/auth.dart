import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> get authStateChanges;
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;
  Future<void> signOut() => _firebaseAuth.signOut();
}
