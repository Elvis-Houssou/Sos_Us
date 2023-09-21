import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_us/image%20alert/image_area.dart';

class RiskAreaPage extends StatefulWidget {
  const RiskAreaPage({super.key});

  @override
  State<RiskAreaPage> createState() => _RiskAreaPageState();
}

class _RiskAreaPageState extends State<RiskAreaPage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            "Zone à Risque",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 25),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    maxLines: 7,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                //localisation
                const Text(
                  'Zone',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 15),
                // Premium Button
                //Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Stack(
                  children: [
                    _image != null
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image(
                                image: MemoryImage(_image!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ), // Foreground widget here
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: () => selectImage(),
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    size: 100,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
