import 'package:flutter/material.dart';
import 'package:frontend/pages/insert_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: secondaryColor,
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(context, const InsertPage(), true);
        },
        backgroundColor: secondaryColor,
        focusColor: fontColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
