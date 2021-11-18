import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LandingPage(),
    );
  }
}
