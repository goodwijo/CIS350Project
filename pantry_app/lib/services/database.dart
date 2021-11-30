import 'package:meta/meta.dart';
import 'package:pantry_app/app/home/models/meal.dart';
import 'package:pantry_app/services/api_path.dart';
import 'package:pantry_app/services/firestore_service.dart';

abstract class Database {
  Future<void> createMeal(Meal meal);
  Stream<List<Meal>> mealsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> createMeal(Meal meal) => _service.setData(
        path: APIPath.meal(uid, 'meals_abc'),
        data: meal.toMap(),
      );

  @override
  Stream<List<Meal>> mealsStream() => _service.collectionStream(
        path: APIPath.meals(uid),
        builder: (data) => Meal.fromMap(data),
      );
}
