import 'package:health_group/utils/app_string.dart';

class BuildDataModel {
  String? firstName;
  String? lastName;
  String? designation;
  String? department;
  String? mobileNumber;

  String? countryCode;

  BuildDataModel({
    this.department,
    this.countryCode,
    this.lastName,
    this.designation,
    this.firstName,
    this.mobileNumber,
  });

  BuildDataModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json[AppStrings.mobileNUmberSmallCase];
    firstName = json[AppStrings.firstName];
    lastName = json[AppStrings.lastName];
    designation = json[AppStrings.designationSmallCase];
    department = json[AppStrings.departmentSmallCase];

    countryCode = json[AppStrings.countryCode];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data[AppStrings.lastName] = lastName;
    data[AppStrings.designationSmallCase] = designation;
    data[AppStrings.departmentSmallCase] = department;
    data[AppStrings.mobileNUmberSmallCase] = mobileNumber;
    data[AppStrings.firstName] = firstName;
    data[AppStrings.countryCode] = countryCode;

    return data;
  }
}
