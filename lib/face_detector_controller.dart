import 'dart:io';
import 'dart:math';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FaceDetectorController{

  pickImage(File image)async{
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    print('VisionImage: $image');
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
    final List<Face> faces = await faceDetector.processImage(visionImage);
    print('ListFace: ${faces.length}');


    for (Face face in faces) {
      print('Teste For');
      var boundingBox = face.boundingBox;
      final double rotY = face.headEulerAngleY; // Head is rotated to the right rotY degrees
      final double rotZ = face.headEulerAngleZ; // Head is tilted sideways rotZ degrees
      print('Teste For: ${face.smilingProbability}');

      // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
      // eyes, cheeks, and nose available):
      final FaceLandmark leftEar = face.getLandmark(FaceLandmarkType.leftEar);
      if (leftEar != null) {
        var leftEarPos = leftEar.position as Point<double>;
        print('leftEarPos: $leftEarPos');
      }

      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability != null) {
        var smileProb = face.smilingProbability;
        print('SmileProb: $smileProb');
      }

      // If face tracking was enabled with FaceDetectorOptions:
      if (face.trackingId != null) {
        final int id = face.trackingId;
        print('IDS: $id');
      }

      print('FACES TESTE: ${faces.elementAt(0).trackingId}');
    }


  }


}