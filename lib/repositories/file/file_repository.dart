import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class FileRepository {
  User? get currentUser;

  Future<File?> pickImage();

  Future<CroppedFile?> cropImage(File? imageFile);

  Future<String?> uploadImage(File? file);
}
