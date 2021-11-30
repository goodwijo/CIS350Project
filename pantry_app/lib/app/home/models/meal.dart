import 'package:meta/meta.dart';

class Meal {
  Meal({required this.id, required this.name});
  final String id;
  final String? name;

  factory Meal.fromMap(Map<String, dynamic> data, String documentId) {
    final String? name = data['name'];
    return Meal(id: documentId, name: name);
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
