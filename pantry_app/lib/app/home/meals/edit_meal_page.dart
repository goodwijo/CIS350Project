import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/home/models/meal.dart';
import 'package:pantry_app/common_widgets/show_alert_dialog.dart';
import 'package:pantry_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:pantry_app/services/database.dart';
import 'package:provider/provider.dart';

class EditMealPage extends StatefulWidget {
  const EditMealPage({Key? key, required this.database, required this.meal})
      : super(key: key);
  final Database database;
  final Meal meal;

  static Future<void> show(BuildContext context, {meal}) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditMealPage(database: database, meal: meal),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditMealPageState createState() => _EditMealPageState();
}

class _EditMealPageState extends State<EditMealPage> {
  final _formKey = GlobalKey<FormState>();

  late String _name;

  @override
  void initState() {
    super.initState();
    if (widget.meal != null) {
      _name = widget.meal.name;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        final meals = await widget.database.mealsStream().first;
        final allNames = meals.map((meal) => meal.name).toList();
        if (allNames.contains(_name)) {
          showAlertDialog(context,
              title: 'Meal already saved',
              content: 'Enter a different meal',
              defaultActionText: 'OK');
        } else {
          final meal = Meal(name: _name, id: '');
          await widget.database.createMeal(meal);
          Navigator.of(context).pop();
        }
      } on FirebaseException catch (e) {
        showExceptionAlertDialog(context,
            title: 'Operation Failed', exception: e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.meal == null ? 'New Meal' : 'Edit Meal'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          )
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: const InputDecoration(labelText: 'Meal Name'),
        initialValue: _name,
        validator: (value) => value!.isNotEmpty ? null : 'Name can\'t be empty',
        onSaved: (value) => _name = value!,
      ),
    ];
  }
}
