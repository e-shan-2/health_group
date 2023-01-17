import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PickerMehthod {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  UploadTask? _uploadTask;

  Future<File?> imageFromCamera(BuildContext context) async {
    AppFormProvider _provider = Provider.of(context, listen: false);
    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 200, maxWidth: 200);

    if (pickedFile != null) {
      File _imageFileGallery = File(pickedFile.path);
      final path = 'health_group/images${pickedFile.name}';
      final ref = FirebaseStorage.instance.ref().child(path);
      _uploadTask = ref.putFile(_imageFileGallery);
      final snaphot = await _uploadTask!.whenComplete(() => {});
      final urlDownload = await snaphot.ref.getDownloadURL();

      String url = _provider.storeUrl(urlDownload);
      _provider.storeRandomData(url);
// _imageFileGallery.path!
      return _imageFileGallery;
    }
    return null;
  }

  Future<File?> imageFromGallery(BuildContext context) async {
    AppFormProvider _provider = Provider.of(context, listen: false);

    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);

    if (pickedFile != null) {
      File _imageFileGallery = File(pickedFile.path);
      final path = 'health_group/images${pickedFile.name}';
      final ref = FirebaseStorage.instance.ref().child(path);
      _uploadTask = ref.putFile(_imageFileGallery);
      final snaphot = await _uploadTask!.whenComplete(() => {});
      final urlDownload = await snaphot.ref.getDownloadURL();

      String url = _provider.storeUrl(urlDownload);
      _provider.storeRandomData(url);

      return _imageFileGallery;
    }
    return null;
  }

  Future<String?> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      File file = File(result.files.first.path!);

      String fileName = result.files.first.name;
      final ref = FirebaseStorage.instance.ref('health_group/file/$fileName');
      _uploadTask = ref.putFile(file);
      final snaphot = await _uploadTask!.whenComplete(() => {});
      final urlDownload = await snaphot.ref.getDownloadURL();

      return urlDownload;
    }
    return null;
  }
}
