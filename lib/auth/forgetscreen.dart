import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/widget/uiHelper.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController email = TextEditingController();

  forget(String email) async {
    if (email == "") {
      UiHelper.CustomSnackBar(context, "Enter your email");
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return UiHelper.CustomSnackBar(context, '${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Screen")),
      body: Column(
        children: [
          UiHelper.CustomTextField(
            email,
            "Enter Your Email",
            Icons.email,
            false,
          ),
          UiHelper.CustomButton(() {}, "Reset Password"),
        ],
      ),
    );
  }
}
