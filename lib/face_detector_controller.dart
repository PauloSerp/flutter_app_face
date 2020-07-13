import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/rendering.dart';

class FaceDetectorController {

  pickImage(File image) async {

    ///cria uma instancia de FirebaseVisionImage e coloca o file que vc recebeu na criação FirebaseVisionImage.fromFile(image).
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(image);
    print('VisionImage: $image');

    ///depois precisa abilitar as opções do detector, porque por default ele vem tudo false, isso eu vi lá na DOC do firebase mas eles não explicam então precisei vir aqui na API e vê
    ///vc vai encontrar uma explicação em face_detector.dart
    final FaceDetectorOptions faceDetectorOptions = FaceDetectorOptions(enableTracking: true, enableLandmarks: true, enableContours: false, enableClassification: true, minFaceSize: 0.1,mode: FaceDetectorMode.accurate);

    ///agr criamos um FaceDetector e passamos o nosso faceDetectorOptions na instanciação
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(faceDetectorOptions);

    ///aqui mandamos ele processar a nossa imagem
    faceDetector.processImage(visionImage);

    ///e aqui é o nosso resultado, temos elea apenas em logs, mas da pra passar pra view de algumas formas, depois vemos isso :)
    final List<Face> faces = await faceDetector.processImage(visionImage);
    print('Quantidade de Faces: ${faces.length}');


    for (Face face in faces) {
      var boundingBox = face.boundingBox;
      final double rotY = face.headEulerAngleY;
      final double rotZ = face.headEulerAngleZ;
      print('Rotação do Rosto: $rotY, $rotZ');

      if (face.trackingId != null) {
        final int id = face.trackingId;
        print('Rosto: $id');
      }

      final FaceLandmark leftEar = face.getLandmark(FaceLandmarkType.leftEar);
      if (leftEar != null) {
        var leftEarPos = leftEar.position;
        print('posição da orelha esquerda: ${leftEarPos}');
      }

      if (face.smilingProbability != null) {
        var smileProb = face.smilingProbability;
        print('Sorrindo: $smileProb');
      }

      if (face.leftEyeOpenProbability != null){
        var leftEyeOpen = face.leftEyeOpenProbability;
        print('Olho Esquerdo aberto: $leftEyeOpen');
      }
      if (face.rightEyeOpenProbability != null){
        var rightEyeOpen = face.rightEyeOpenProbability;
        print('Olho Direito aberto: $rightEyeOpen');
      }
    }

    



  }



  pickVideo(File video) async {

    ///cria uma instancia de FirebaseVisionImage e coloca o file que vc recebeu na criação FirebaseVisionImage.fromFile(image).
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(video);
    print('VisionImage: $video');

    ///depois precisa abilitar as opções do detector, porque por default ele vem tudo false, isso eu vi lá na DOC do firebase mas eles não explicam então precisei vir aqui na API e vê
    ///vc vai encontrar uma explicação em face_detector.dart
    final FaceDetectorOptions faceDetectorOptions = FaceDetectorOptions(enableTracking: true, enableLandmarks: true, enableContours: false, enableClassification: true, minFaceSize: 0.1,mode: FaceDetectorMode.accurate);

    ///agr criamos um FaceDetector e passamos o nosso faceDetectorOptions na instanciação
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(faceDetectorOptions);

    ///aqui mandamos ele processar a nossa imagem
    faceDetector.processImage(visionImage);

    ///e aqui é o nosso resultado, temos elea apenas em logs, mas da pra passar pra view de algumas formas, depois vemos isso :)
    final List<Face> faces = await faceDetector.processImage(visionImage);
    print('Quantidade de Faces: ${faces.length}');


    for (Face face in faces) {
      var boundingBox = face.boundingBox;
      final double rotY = face.headEulerAngleY;
      final double rotZ = face.headEulerAngleZ;
      print('Rotação do Rosto: $rotY, $rotZ');

      if (face.trackingId != null) {
        final int id = face.trackingId;
        print('Rosto: $id');
      }

      final FaceLandmark leftEar = face.getLandmark(FaceLandmarkType.leftEar);
      if (leftEar != null) {
        var leftEarPos = leftEar.position;
        print('posição da orelha esquerda: ${leftEarPos}');
      }

      if (face.smilingProbability != null) {
        var smileProb = face.smilingProbability;
        print('Sorrindo: $smileProb');
      }

      if (face.leftEyeOpenProbability != null){
        var leftEyeOpen = face.leftEyeOpenProbability;
        print('Olho Esquerdo aberto: $leftEyeOpen');
      }
      if (face.rightEyeOpenProbability != null){
        var rightEyeOpen = face.rightEyeOpenProbability;
        print('Olho Direito aberto: $rightEyeOpen');
      }
    }
  }


}
