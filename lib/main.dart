import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() => runApp(PlayfulEnglishApp());

class PlayfulEnglishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RegisterScreen(),
      home: LoginScreen(),
    );
  }
}