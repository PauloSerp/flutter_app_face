import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_face/face_detector_controller.dart';
import 'package:image_picker/image_picker.dart';

class MyFaceDetectorView extends StatefulWidget {

  @override
  _MyFaceDetectorViewState createState() => _MyFaceDetectorViewState();
}

class _MyFaceDetectorViewState extends State<MyFaceDetectorView> {
  final _picker = ImagePicker();
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () async => pickImage(),
          ),

          IconButton(
            icon: Icon(Icons.movie),
            onPressed: () async => record(),
          ),
        ],
      ),
      body: myFaceView(),
    );
  }

  myFaceView() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 500,
            height: 500,
            child: this._imageFile == null ? Placeholder() : Image.file(this._imageFile),
          ),
          RaisedButton(
            child: Text('Escanear foto'),
            onPressed: () {
               FaceDetectorController faceDetec = FaceDetectorController();
               faceDetec.pickImage(_imageFile);

            },
          ),

          RaisedButton(
            child: Text('Escanear video'),
            onPressed: () {
              FaceDetectorController faceDetec = FaceDetectorController();
              faceDetec.pickImage(_imageFile);
              },
          ),
        ],
      ),
    );
  }

  pickImage()async{
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      this._imageFile = File(pickedFile.path);
    });
  }
  record()async{
    final PickedFile pickedFile = await _picker.getVideo(source: ImageSource.camera);
    setState(() {
      this._imageFile = File(pickedFile.path);
    });
  }
}
