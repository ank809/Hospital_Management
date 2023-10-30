import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_app/controllers/pick_image.dart';

class UploadDetails extends StatefulWidget {
  const UploadDetails({Key? key});

  @override
  _UploadDetailsState createState() => _UploadDetailsState();
}

class _UploadDetailsState extends State<UploadDetails> {
  File? imgpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 254, 78, 89),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 205, 205),
                border: Border.all(color: Colors.black),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 20),
              child: imgpath != null
                  ? Image.file(
                      imgpath!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: InkWell(
                        onTap: () async {
                          final newimgpath = await Pick_Image.pickFile();
                          if (newimgpath != null) {
                            setState(() {
                              imgpath = File(newimgpath.path);
                            });
                          }
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 45,
                          color: Colors.black,
                        ),
                      ),
                    ),
            ),
           const SizedBox(
              height: 30.0,
            ),
            SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text(
                      'Upload',
                      style: TextStyle(fontSize: 20.0, color: Colors.pink),
                    )))
          ],
        ),
      ),
    );
  }
}
