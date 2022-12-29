import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trynsiki_admin_panel/Service.dart';

uploadImageToStorage(PickedFile? pickedFile1) async {
  String uploadedPhotoUrl = "";
  try {
    EasyLoading.show();
    if (kIsWeb) {
      print("object 1");
      // var directory = await PickedFile(pickedFile);
      print(" ${pickedFile1!.path}");
      // var path = pickedFile!.path;
      Reference _reference = fStorage.ref().child('images/${pickedFile1.path}');
      print("object 2");

      await _reference
          .putData(
        await pickedFile1.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .whenComplete(() async {
        print("object 3");

        await _reference.getDownloadURL().then((value) {
          uploadedPhotoUrl = value;
        });
        print("object 4");
      });
      if (uploadedPhotoUrl != "") {
        print(uploadedPhotoUrl);
        EasyLoading.dismiss();

        return uploadedPhotoUrl;
      }
    } else {
      return null;

//write a code for android or ios

    }
    EasyLoading.dismiss();
  } catch (e) {
    print(e);
    EasyLoading.dismiss();

    Get.snackbar("$e", "");
  }
}

chooseImage(
  ImageSource source,
) async {
  try {
    EasyLoading.show();
    print("object 5");

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: source,
    );
    print("object 6");
    print(pickedFile!.path);

    if (pickedFile != null) {
      EasyLoading.dismiss();

      return pickedFile;
    }
    EasyLoading.dismiss();
  } catch (e) {
    EasyLoading.dismiss();

    Get.snackbar("$e", "");
  }
}
