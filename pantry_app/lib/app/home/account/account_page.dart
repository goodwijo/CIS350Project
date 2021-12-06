import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/common_widgets/avatar.dart';
import 'package:pantry_app/common_widgets/show_alert_dialog.dart';
import 'package:pantry_app/services/auth.dart';
import 'package:pantry_app/services/database.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
    final auth = Provider.of<AuthBase>(context, listen: false);
    auth.currentUser;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Account'),
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: _buildUserInfo(auth.currentUser),
          )),
    );
  }

  Widget _buildUserInfo(User? user) {
    return Column(
      children: [
        Avatar(
          photoUrl: user!.photoURL,
          radius: 50,
        ),
        const SizedBox(height: 8),
        if (user.displayName != null)
          Text(
            user.displayName!,
            style: const TextStyle(color: Colors.white),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
