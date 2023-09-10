import 'package:flutter/material.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/login_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      title: "REnime",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
