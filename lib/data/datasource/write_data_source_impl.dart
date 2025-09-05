import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team1_det_tonryong/data/datasource/write_data_source.dart';

class WriteDataSourceImpl implements WriteDataSource {
  @override
  Future<String> createImage(XFile xFile) async {
    try {
      final storage = FirebaseStorage.instance;
      Reference ref = storage.ref();
      Reference fileRef = ref.child(
        '${DateTime.now().microsecondsSinceEpoch}_${xFile.name}',
      );
      await fileRef.putFile(File(xFile.path));
      String imageUrl = await fileRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  @override
  Future<bool> createFeed({
    required String feedPhoto,
    required String userNM,
  }) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final colRef = firebase.collection('feeds');
      final docRef = colRef.doc();
      final now = DateTime.now();
      await docRef.set({
        'feedPhoto': feedPhoto,
        'feedTime': now,
        'userNM': userNM,
        'feedLike': 0,
        'fLikeUsers': [],
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
