import 'dart:io';

import 'package:flutter/material.dart';

import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_string.dart';

class AppFormProvider extends ChangeNotifier {
  AppFormProvider(this.valueAtion);
  bool valueAtion;

  String? email;
  void setvalue(String email) {
    email = email;
    notifyListeners();
  }

  String? picUrl;
  String storeUrl(String url) {
    picUrl = url;
    return picUrl!;
  }

  String? randomData;
  storeRandomData(String data) {
    randomData = data;
    notifyListeners();
  }

  List<String>? departmentName;
  List<String>? setDepartment(List<String> data) {
    departmentName = data;

    return departmentName;
  }

  String? token;
  void setTempToken(String tempToken) {
    token = tempToken;
    notifyListeners();
  }

  File? imageFile;
  File ?storeImage(File imageFiling) {
 
    imageFile = imageFiling;

return imageFile;    
  }

  

  String? password;
  void saveValue(String? pin) {
    password = pin;
  }

  bool onchanging(List<TextEditingController> controller) {
    for (int i = 0; i < controller.length; i++) {
      if (controller[i].text.isEmpty) {
        return false;
      }
    }
    notifyListeners();
    return true;
  }

  void ontoggle(Bool obscure) {
    obscure.value = !obscure.value;
    notifyListeners();
    // return obscure;
  }

  String val = AppStrings.choose;
  void changevalue(String changeValue) {
    val = changeValue;

    notifyListeners();
  }

  String? socvalue;
  String? storeSocValue(String socchoosen) {
    socvalue = socchoosen;

    return socvalue;
  }

  String? pin;
  void setPin(String value) {
    pin = value;
    notifyListeners();
  }

  String? countryCode;
  String? countryCodeValue(String changeValue) {
    countryCode = changeValue;

    return countryCode;
  }


  bool storeAppLock(bool value) {
    valueAtion = value;

    notifyListeners();
    return valueAtion;
  }
}
