import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/home/models/meal.dart';

class MealListTile extends StatelessWidget {
  const MealListTile({Key? key, required this.meal, required this.onTap})
      : super(key: key);

  final Meal meal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meal.name),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
