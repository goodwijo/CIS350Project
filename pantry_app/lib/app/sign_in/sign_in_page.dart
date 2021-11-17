import 'package:flutter/material.dart';
import 'package:pantry_app/common_widgets/custom_elevated_button.dart';

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
    padding: EdgeInsets.all(16.0),
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
        const SizedBox(height: 8.0),
        CustomElevatedButton(
          child: const Text(
            'Sign in with Google',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
            ),
          ),
          color: Colors.green,
          borderRadius: 4.0,
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        CustomElevatedButton(
          child: const Text(
            'Sign in with email',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
            ),
          ),
          color: Colors.orange,
          borderRadius: 4.0,
          onPressed: () {},
        ),
      ],
    ),
  );
}
