import 'package:flutter/material.dart';
import 'package:pantry_app/app/sign_in/sign_in_button.dart';
import 'package:pantry_app/app/sign_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry App'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[350],
    );
  }
}

Widget _buildContent() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          'Sign in',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 48.0),
        SocialSignInButton(
          assetName: 'images/google-logo.png',
          text: 'Sign in with Google',
          textColor: Colors.black87,
          color: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        SignInButton(
          text: 'Sign in with email',
          textColor: Colors.white,
          color: Colors.teal.shade700,
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        const Text(
          'or',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8.0),
        SignInButton(
          text: 'Go anonymous',
          textColor: Colors.black,
          color: Colors.lime.shade300,
          onPressed: () {},
        ),
      ],
    ),
  );
}
