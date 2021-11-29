import 'package:meta/meta.dart';

class Meal {
  Meal({required this.name});
  final String name;

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
