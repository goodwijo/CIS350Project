import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class Database {
  Future<void> createMeal(Map<String, dynamic> mealData);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  @override
  Future<void> createMeal(Map<String, dynamic> mealData) async {
    final path = '/users/$uid/meals/meals_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(mealData);
  }
}
