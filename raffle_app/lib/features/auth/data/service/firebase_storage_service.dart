import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utilities/picker/image_pick.dart';

class FirebaseStorageService {
  final firebaseStorageRef = FirebaseStorage.instance.ref();
  final picker = ImagePick();
  XFile? selectedFile;
  Uint8List? selectedImgeByte;
  String imageUrl = '';

  Future<String?> uploadImage(String path) async {
    if (selectedImgeByte != null) {
      final uploadImage = await firebaseStorageRef.child('images').child(path).child(selectedFile!.name).putData(
            selectedImgeByte!,
            SettableMetadata(contentType: 'image/png'),
          );
      imageUrl = await uploadImage.ref.getDownloadURL();
      return imageUrl;
    }
    return null;
  }

  Future<void> pickImage() async {
    selectedFile = await picker.pickImageGallery();
    selectedImgeByte = await selectedFile?.readAsBytes();
  }
}
