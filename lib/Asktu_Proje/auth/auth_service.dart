import 'package:asktu_proje/Asktu_Proje/data/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() => _singleton;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseManager _databaseManager = DatabaseManager();

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get user => _auth.currentUser;

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      debugPrint('Error during sign in: ${e.toString()}');
      rethrow;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required double height,
    required double weight,
    required int age,
    required String gender,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.currentUser?.updateDisplayName(username);
      await _databaseManager.createUserData(
        userId: userCredential.user?.uid ?? "",
        weight: weight,
        height: height,
        age: age,
        gender: gender,
      );
      return userCredential;
    } catch (e) {
      debugPrint('Error during registration: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('Error during sign out: ${e.toString()}');
      rethrow;
    }
  }
}
