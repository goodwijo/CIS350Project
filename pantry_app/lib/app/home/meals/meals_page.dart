import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/home/meals/edit_meal_page.dart';
import 'package:pantry_app/app/home/meals/meal_list_tile.dart';
import 'package:pantry_app/app/home/models/meal.dart';
import 'package:pantry_app/common_widgets/show_alert_dialog.dart';
import 'package:pantry_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:pantry_app/services/auth.dart';
import 'package:pantry_app/services/database.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => EditMealPage.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Meal>>(
        stream: database.mealsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final meals = snapshot.data;
            final children = meals!
                .map((meal) => MealListTile(
                      meal: meal,
                      onTap: () => EditMealPage.show(context, meal: meal),
                    ))
                .toList();
            return ListView(children: children);
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
