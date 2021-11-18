import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_app/common_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    required String text,
    VoidCallback? onPressed,
  }) : super(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: Colors.red,
          borderRadius: 4.0,
          onPressed: onPressed!,
        );
}
