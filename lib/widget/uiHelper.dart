import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHide,
  ) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(iconData, color: Color(0xFF667eea)),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF667eea), width: 2),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback voiceCallback, String text) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          voiceCallback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF667eea),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
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
