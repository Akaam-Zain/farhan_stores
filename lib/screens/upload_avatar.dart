import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadAvatar extends StatelessWidget {
  const UploadAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void uploadImage() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File profile_image = File(result.files.single.path);
      } else {
        // User canceled the picker
      }
    }

    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                Container(
                  child: CircleAvatar(
                      radius: 95,
                      backgroundColor: Colors.red,
                      child: Text(
                        'tap to upload',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Add Profile Picture',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 100),
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Text('Skip →',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
