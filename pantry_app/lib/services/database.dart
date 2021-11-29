import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pantry_app/app/home/models/meal.dart';
import 'package:pantry_app/services/api_path.dart';

abstract class Database {
  Future<void> createMeal(Meal meal);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  @override
  Future<void> createMeal(Meal meal) => _setData(
        path: APIPath.meal(uid, 'meals_abc'),
        data: meal.toMap(),
      );

  Future<void> _setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }
}
