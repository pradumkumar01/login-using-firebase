import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/auth/forgetscreen.dart';
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
    
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Welcome Text
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 50),

                  // Login Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Email Field
                        UiHelper.CustomTextField(
                          email,
                          "Email",
                          Icons.email_outlined,
                          false,
                        ),
                        SizedBox(height: 16),

                        // Password Field
                        UiHelper.CustomTextField(
                          password,
                          "Password",
                          Icons.lock_clock_outlined,
                          true,
                        ),
                        SizedBox(height: 8),

                        // Forget Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ForgetScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF667eea),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Login Button
                        UiHelper.CustomButton(() {
                          login(
                            email.text.toString(),
                            password.text.toString(),
                          );
                        }, "Login"),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
