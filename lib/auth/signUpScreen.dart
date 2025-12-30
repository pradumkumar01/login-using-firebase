import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/auth/loginScreen.dart';
import 'package:login_using_firebase/widget/uiHelper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup(String email, String password) async {
    if (email == "" || password == "") {
      UiHelper.CustomSnackBar(context, "Email and Password cannot be empty");
      return;
    }
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UiHelper.CustomSnackBar(context, "Sign Up Successfuy");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      UiHelper.CustomSnackBar(context, "${e.code.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
            email,
            "Enter you Email",
            Icons.email,
            false,
          ),

          UiHelper.CustomTextField(
            password,
            "Enter Your Password",
            Icons.visibility_off,
            true,
          ),

          UiHelper.CustomButton(() {
            signup(email.text.toString(), password.text.toString());
          }, "Sign Up"),

          Row(
            children: [
              Text("Already account ?"),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
                child: Text(
                  "Login In",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
