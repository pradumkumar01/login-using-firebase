import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/auth/signUpScreen.dart';
import 'package:login_using_firebase/screen/homeScreen.dart';
import 'package:login_using_firebase/widget/uiHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login(String email, String password) async {
    if (email == "" || password == "") {
      UiHelper.CustomSnackBar(context, "Enter required field");
    }
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UiHelper.CustomSnackBar(context, "Login Successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } on FirebaseAuth catch (e) {
      return UiHelper.CustomSnackBar(context, "${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
            email,
            "Enter Your Email",
            Icons.email,
            false,
          ),
          UiHelper.CustomTextField(
            password,
            "Enter Your Password",
            Icons.visibility_off,
            false,
          ),

          UiHelper.CustomButton(() {
            login(email.text.toString(), password.text.toString());
          }, "Login"),

          Row(
            children: [
              Text("Create account ?"),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpScreen()),
                ),
                child: Text(
                  "Sign Up",
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
