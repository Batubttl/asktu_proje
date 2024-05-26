import 'package:asktu_proje/Asktu_Proje/auth/auth_service.dart';
import 'package:asktu_proje/Asktu_Proje/data/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  DatabaseManager.internal();
  static final DatabaseManager _instance = DatabaseManager.internal();
  factory DatabaseManager() {
    return _instance;
  }

  UserModel userModel = UserModel('', 0.0, 0.0, '', 0);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUserData({
    required String userId,
    required double weight,
    required double height,
    required int age,
    required String gender,
  }) async {
    try {
      await userCollection.doc(userId).set({
        'weight': weight,
        'height': height,
        'age': age,
        'gender': gender,
      });
    } catch (e) {
      debugPrint("Error adding user data: $e");
    }
  }

  Future<void> updateUserData({
    required String userId,
    required String username,
    required double weight,
    required double height,
    required int age,
    required String gender,
  }) async {
    try {
      AuthService().user?.updateDisplayName(username);
      await userCollection.doc(userId).update({
        'weight': weight,
        'height': height,
        'gender': gender,
        'age': age,
      });
    } catch (e) {
      debugPrint("Error updating user data: $e");
    }
  }

  Future<UserModel> getUserData(String userId) async {
    try {
      DocumentSnapshot doc = await userCollection.doc(userId).get();
      if (doc.exists) {
        final model = UserModel.fromFirestore(doc);
        userModel = model;
        return model;
      } else {
        debugPrint("No user data found");
        return UserModel('', 0.0, 0.0, '', 0);
      }
    } catch (e) {
      debugPrint("Error getting user data: $e");
      return UserModel('', 0.0, 0.0, '', 0);
    }
  }
}
