import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final double height;
  final double weight;
  final String gender;
  final int age;

  UserModel(
    this.id,
    this.height,
    this.weight,
    this.gender,
    this.age,
  );

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserModel(
      doc.id,
      (data['height'] ?? 0.0).toDouble(),
      (data['weight'] ?? 0.0).toDouble(),
      data['gender'] ?? '',
      (data['age'] ?? 0).toInt(),
    );
  }
}
