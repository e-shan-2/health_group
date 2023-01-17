import 'package:health_group/utils/app_string.dart';

class DataModel {
  String? email;
  String? password;

  DataModel({this.email, this.password});

  DataModel.fromJson(Map<String, dynamic> json) {
    email = json[AppStrings.emailSmallCase];
    password = json[AppStrings.passwordSmallCase];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.emailSmallCase] = email;
    data[AppStrings.passwordSmallCase] = password;

    return data;
  }
}
