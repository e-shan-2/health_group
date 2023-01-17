import 'package:health_group/utils/app_string.dart';

class VerifyPinModel {
  String? otp;

  VerifyPinModel({this.otp});

  VerifyPinModel.fromJson(Map<String, dynamic> json) {
    otp = json[AppStrings.pinUpperCase];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.pinUpperCase] = otp;

    return data;
  }
}
