import 'package:health_group/utils/app_string.dart';

class ResetDataModel {
  String? confirmPassword;
  String? password;
  String? otp;

  ResetDataModel({this.confirmPassword, this.password, this.otp});

  ResetDataModel.fromJson(Map<String, dynamic> json) {
    confirmPassword = json[AppStrings.confirtmPasswordSmallCase];
    password = json[AppStrings.passwordSmallCase];
    otp = json[AppStrings.otp];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.confirtmPasswordSmallCase] = confirmPassword;
    data[AppStrings.passwordMustContain] = password;
    data[AppStrings.otp] = otp;

    return data;
  }
}
