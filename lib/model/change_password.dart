import 'package:health_group/utils/app_string.dart';

class ChangePasswordDataModel {
  String? confirmPassword;
  String? newPassword;
  String? oldPassword;

  ChangePasswordDataModel(
      {this.confirmPassword, this.newPassword, this.oldPassword});

  ChangePasswordDataModel.fromJson(Map<String, dynamic> json) {
    confirmPassword = json[AppStrings.confirtmPasswordSmallCase];
    newPassword = json[AppStrings.newPasswordSmallCase];
    oldPassword = json[AppStrings.oldPasswordSmallCase];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.confirtmPasswordSmallCase] = confirmPassword;
    data[AppStrings.newPasswordSmallCase] = newPassword;
    data[AppStrings.oldPasswordSmallCase] = oldPassword;

    return data;
  }
}
