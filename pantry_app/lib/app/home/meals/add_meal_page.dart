import 'package:flutter/material.dart';

class AddMealPage extends StatefulWidget {
  const AddMealPage({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddMealPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddMealPageState createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: const Text('New Meal'),
      ),
    );
  }
}
