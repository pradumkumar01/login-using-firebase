import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_using_firebase/auth/loginScreen.dart';
import 'package:login_using_firebase/screen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CheckUser());
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return CheckUser();
  }

  CheckUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }
}
