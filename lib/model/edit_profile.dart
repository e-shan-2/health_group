import 'package:health_group/utils/app_string.dart';

class EditProfileDataModel {
  String? firstName;
  String? lastName;
  String? status;
  String? countryCode;
  String? mobileNumber;
  String? about;
  String? profilePicUrl;

  EditProfileDataModel(
      {this.firstName,
      this.lastName,
      this.status,
      this.countryCode,
      this.mobileNumber,
      this.about,
      this.profilePicUrl});

  EditProfileDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json[AppStrings.firstName];
    lastName = json[AppStrings.lastName];
    status = json[AppStrings.statusSmallCase];
    countryCode = json[AppStrings.countryCode];
    mobileNumber = json[AppStrings.mobileNUmberSmallCase];
    about = json[AppStrings.aboutSmallCase];
    profilePicUrl = json[AppStrings.profilePicUrl];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.firstName] = firstName;
    data[AppStrings.lastName] = lastName;
    data[AppStrings.statusSmallCase] = status;
    data[AppStrings.countryCode] = countryCode;
    data[AppStrings.mobileNUmberSmallCase] = mobileNumber;
    data[AppStrings.aboutSmallCase] = about;
    data[AppStrings.profilePicUrl] = profilePicUrl;
    return data;
  }
}
