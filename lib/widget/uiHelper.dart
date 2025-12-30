import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHide,
  ) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback voiceCallback, String text) {
    return ElevatedButton(
      onPressed: () {
        voiceCallback();
      },
      child: Text(text),
    );
  }

  static CustomSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
