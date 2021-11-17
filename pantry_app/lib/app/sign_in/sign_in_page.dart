import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantry App'),
        elevation: 2.0,
      ),
      body: buildContent(),
    );
  }
}

Widget buildContent() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.orange,
          child: SizedBox(
            height: 100.0,
          ),
        ),
        Container(
          color: Colors.red,
          child: SizedBox(
            height: 100.0,
          ),
        ),
        Container(
          color: Colors.purple,
          child: SizedBox(
            height: 100.0,
          ),
        ),
      ],
    ),
  );
}
