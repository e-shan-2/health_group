import 'package:health_group/utils/app_string.dart';

class UserProfileDataModel {
  String? email;
  String? designation;
  String? department;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? countryCode;
  String? about;
  String? status;
  String? profilePicUrl;

  UserProfileDataModel(
      {this.email,
      this.designation,
      this.department,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.countryCode,
      this.about,
      this.status,
      this.profilePicUrl});

  UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    email = json[AppStrings.emailSmallCase];
    designation = json[AppStrings.designationSmallCase];
    department = json[AppStrings.departmentSmallCase];
    firstName = json[AppStrings.firstName];
    lastName = json[AppStrings.lastName];
    mobileNumber = json[AppStrings.mobileNUmberSmallCase];
    countryCode = json[AppStrings.countryCode];
    about = json[AppStrings.aboutSmallCase];
    status = json[AppStrings.statusSmallCase];
    profilePicUrl = json[AppStrings.profilePicUrl];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.emailSmallCase] =email;
    data[AppStrings.designationSmallCase] = designation;
    data[AppStrings.departmentSmallCase] =department;
    data[AppStrings.firstName] = firstName;
    data[AppStrings.lastName] = lastName;
    data[AppStrings.mobileNUmberSmallCase] = mobileNumber;
    data[AppStrings.countryCode] = countryCode;
    data[AppStrings.about] = about;
    data[AppStrings.statusSmallCase] = status;
    data[AppStrings.profilePicUrl] = profilePicUrl;
    return data;
  }
}
