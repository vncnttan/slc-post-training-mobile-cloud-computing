import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/text_input.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _episodeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _image;

  void _handleInsert() {}

  void _handlePickImage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _image == null
                      ? Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                          fit: BoxFit.fitWidth,
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.fitWidth,
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    hintText: "Title",
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    hintText: "Episodes",
                    controller: _episodeController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextInput(
                    hintText: "Description",
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomButton(text: "Pick Image", onTap: _handlePickImage),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(text: "Insert Anime", onTap: _handleInsert),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
