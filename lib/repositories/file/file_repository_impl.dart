import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fave_app/repositories/file/file_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_repository_impl.g.dart';

@riverpod
FileRepositoryImpl fileRepositoryImpl(FileRepositoryImplRef ref) {
  return FileRepositoryImpl(ref);
}

class FileRepositoryImpl implements FileRepository {
  FileRepositoryImpl(ProviderRef<FileRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _storage = ref.read(getFirebaseStorageProvider);

  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<File?> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageFile = pickedImage != null ? File(pickedImage.path) : null;
    return imageFile;
  }

  @override
  Future<CroppedFile?> cropImage(File? imageFile) async {
    if (imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ],
      );
      if (croppedFile != null) {
        return croppedFile;
      }
    }
    return null;
  }

  @override
  Future<String?> uploadImage(File? file) async {
    if (file != null) {
      final uid = _auth.currentUser!.uid;
      final fileName = returnJpgFileName();
      final ref = _storage.ref().child('users').child(uid).child(fileName);
      await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    }
    return null;
  }
}
