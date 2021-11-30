import 'package:meta/meta.dart';

class Meal {
  Meal({required this.name});
  final String? name;

  factory Meal.fromMap(Map<String, dynamic> data) {
    final String? name = data['name'];
    return Meal(name: name);
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
