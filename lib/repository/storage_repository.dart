import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(
      {Uint8List? file, required String uid}) async {
    try {
      Reference ref = _storage.ref().child("images").child(uid);
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = ref.putData(file!, metadata);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
