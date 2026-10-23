import 'package:flutter/material.dart';
import 'package:localstorage/DB/savelog.dart';
import 'package:localstorage/Login.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  save s =save();

  bool? isLogin;

  // check user

  void checkLogin()async{
    final status = await s.isLoggedIn();
    setState(() {
      isLogin = status;
    });
  }

  void initState(){
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}