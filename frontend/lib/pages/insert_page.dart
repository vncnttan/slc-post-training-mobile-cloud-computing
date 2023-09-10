import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/apis/anime_api.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/utils/navigator.dart';
import 'package:frontend/utils/snack_bar.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/text_input.dart';
import 'package:image_picker/image_picker.dart';

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

  void _handleInsert() async {
    if (_image == null) {
      showSnackBar(context, "Image cannot be null");
      return;
    }

    String title = _titleController.text;
    String episodes = _episodeController.text;
    String description = _descriptionController.text;

    String? errMsg =
        await insertAnime(title, _image!, int.parse(episodes), description);

    if (errMsg == null){
      showSnackBar(context, "Anime inserted");
      navigate(context, const HomePage(), false);
      return;
    }

    showSnackBar(context, errMsg);
  }

  void _handlePickImage() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

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
