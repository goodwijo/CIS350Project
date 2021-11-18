import 'package:flutter/material.dart';
import 'package:pantry_app/app/sign_in/email_sign_in_form.dart';
import 'package:pantry_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key, required this.auth}) : super(key: key);

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: EmailSignInForm(auth: auth),
        ),
      ),
      backgroundColor: Colors.grey[350],
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
