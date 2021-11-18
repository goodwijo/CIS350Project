import 'package:flutter/material.dart';
import 'package:pantry_app/services/auth.dart';

class AuthProvider extends InheritedWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  AuthProvider({required this.auth, required this.child}) : super(child: child);
  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AuthBase of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }
}
