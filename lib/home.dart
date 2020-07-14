
import 'package:flutter/material.dart';
import 'package:flutter_app_face/camera_face_detector.dart';
import 'package:flutter_app_face/face_detection_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile To Face App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Add Smile to Face from Image'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FaceDetectionFromImage(),
                    ),
                  );
                }),
            RaisedButton(
                child: Text('Add Smile to Face from Live Camera'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FaceDetectionFromLiveCamera(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}