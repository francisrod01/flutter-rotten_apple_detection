import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Model extends StatefulWidget {
  const Model({Key? key}) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  late File _image;
  bool selImage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rotten Apple Detection'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            (selImage) ? Image.file(_image) : Container(),
            InkWell(
              onTap: () {
                choseImage();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigoAccent,
                ),
                child: const Text(
                  'Pick an image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> choseImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image?.path != null) {
      setState(() {
        selImage = true;
        _image = File(image!.path);
      });
    }
  }
}
