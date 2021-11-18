import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/app/landing_page.dart';
import 'package:pantry_app/services/auth.dart';
import 'package:pantry_app/services/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Pantry App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LandingPage(),
      ),
    );
  }
}
