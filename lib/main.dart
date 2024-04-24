import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_gallery/home.dart';


void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Mp_4(),
    );
  }
}

class Mp_4 extends StatefulWidget {
  @override
  State<Mp_4> createState() => _Mp_4State();
}

class _Mp_4State extends State<Mp_4> {
  File? file;
  String? Mp4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,title: Text("Video Gallery"),),
      body: Center(
        child: MaterialButton(shape: Border.all(color: Colors.lightGreen.shade900,width: 5),
          color: Colors.indigo[900],
          onPressed: () async {
            await get_Mp4();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Video_Gallery(file_: file!),
              ),
            );
          },
          child: Text(
            'Pick video Gallery',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  get_Mp4() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'mp4'],
    );

    if (result != null) {
      File c = File(result.files.single.path.toString());
      setState(() {
        file = c;
        Mp4 = result.names.toString();
      });
    }
  }
}