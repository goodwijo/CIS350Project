import 'package:flutter/material.dart';
import 'package:pantry_app/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:pantry_app/app/sign_in/email_sign_in_form_stateful.dart';
import 'package:pantry_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormBlocBased.create(context),
          ),
        ),
      ),
      backgroundColor: Colors.grey[350],
    );
  }
}
