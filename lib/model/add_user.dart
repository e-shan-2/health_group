import 'package:health_group/utils/app_string.dart';

class AddUserDataModel {
  String? firstName;
  String? lastName;
  String? designation;
  String? department;
  String? mobileNumber;
  String? email;
  String? about;
  String?profilePicUrl;
  String? countryCode;

  AddUserDataModel({
    this.profilePicUrl,
    this.department,
    this.countryCode,
    this.lastName,
    this.designation,
    this.firstName,
    this.mobileNumber,
    this.email,
    this.about,
  });

  AddUserDataModel.fromJson(Map<String, dynamic> json) {
    profilePicUrl=json[AppStrings.profilePicUrl];
    mobileNumber = json[AppStrings.phoneNumberSmallCase];
    firstName = json[AppStrings.firstName];
    lastName = json[AppStrings.lastName];
    designation = json[AppStrings.designationSmallCase];
    department = json[AppStrings.departmentSmallCase];
    email = json[AppStrings.emailSmallCase];
    countryCode = json[AppStrings.countryCode];
    about = json[AppStrings.aboutSmallCase];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
   data[AppStrings.profilePicUrl]=profilePicUrl;
    data[AppStrings.lastName] = lastName;
    data[AppStrings.designationSmallCase] = designation;
    data[AppStrings.departmentSmallCase] = department;
    data[AppStrings.phoneNumberSmallCase] = mobileNumber;
    data[AppStrings.firstName] = firstName;
    data[AppStrings.countryCode] = countryCode;
    data[AppStrings.emailSmallCase] = email;
    data[AppStrings.aboutSmallCase] = about;

    return data;
  }
}
