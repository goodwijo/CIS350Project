import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pantry_app/app/home/models/meal.dart';
import 'package:pantry_app/services/api_path.dart';

abstract class Database {
  Future<void> createMeal(Meal meal);
  Stream<List<Meal>> mealsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  @override
  Future<void> createMeal(Meal meal) => _setData(
        path: APIPath.meal(uid, 'meals_abc'),
        data: meal.toMap(),
      );

  @override
  Stream<List<Meal>> mealsStream() {
    final path = APIPath.meals(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    final Stream<List<Meal>> meals =
        snapshots.map((snapshot) => List<Meal>.of(snapshot.docs.map((snapshot) {
              final data = snapshot.data();
              return Meal(name: data['name']);
            })));
    return meals;
  }

  Future<void> _setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }
}
