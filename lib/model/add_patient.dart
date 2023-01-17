import 'package:health_group/utils/app_string.dart';

class AddPatientDataModel {
  String? patientFirstName;
  String? patientLastName;
  String? patientDOB;
  String? patientDetailsSOC;
  String? patientPhnNumber;
  String? patientEmail;
  String? patientAbout;
  String? patientAddress;
  String? patientState;
  String? zipCode;
  String? city;
  String? patientCountry;
  String? patientCountryCode;
  String? physicianName;
  String? physicianCountryCode;
  String? physicianPhnNum;
  String? caregiverName;
  String? caregiverCountryCode;
  String? caregiverPhoneNumber;
  String? pharmacyName;
  String? pharmacyCountryCode;
  String? pharmacyPhnNum;
  Map<String, dynamic>? mediaFiles;
  String? url;
  String? profilePicUrl;

  AddPatientDataModel({
    this.profilePicUrl,
    this.patientDetailsSOC,
    this.patientCountryCode,
    this.patientLastName,
    this.patientDOB,
    this.patientFirstName,
    this.patientPhnNumber,
    this.patientEmail,
    this.patientAbout,
    this.patientAddress,
    this.city,
    this.patientCountry,
    this.patientState,
    this.zipCode,
    this.physicianName,
    this.physicianCountryCode,
    this.physicianPhnNum,
    this.caregiverName,
    this.caregiverCountryCode,
    this.caregiverPhoneNumber,
    this.pharmacyName,
    this.pharmacyCountryCode,
    this.pharmacyPhnNum,
 
    this.url,
  });

  AddPatientDataModel.fromJson(Map<String, dynamic> json) {
    patientPhnNumber = json[AppStrings.patientPhoneNUmber];
    patientFirstName = json[AppStrings.patientFirstNameSmallCase];
    patientLastName = json[AppStrings.patientLastnameSmallCase];
    patientDOB = json[AppStrings.patientDobSmallCase];
    patientEmail = json[AppStrings.patientEmail];
    patientCountryCode = json[AppStrings.patientCountryCode];
    patientAbout = json[AppStrings.patientAbout];
    patientDetailsSOC = json[AppStrings.patientdetailSoc];
    patientAddress = json[AppStrings.patientAddress];
    patientCountry = json[AppStrings.patientCountry];
    zipCode = json[AppStrings.patientZipCode];
    city = json[AppStrings.patientCity];
    patientState = json[AppStrings.patientState];
    physicianName = json[AppStrings.physicianName];
    physicianCountryCode = json[AppStrings.physiciamCountryCode];
    physicianPhnNum = json[AppStrings.physicianPhoneNumber];
    caregiverName = json[AppStrings.careGiverName];
    caregiverCountryCode = json[AppStrings.careGiverCountryCode];
    caregiverPhoneNumber = json[AppStrings.careGiverPhoneNumber];
    pharmacyName = json[AppStrings.pharmacyNameSmallCase];
    pharmacyCountryCode = json[AppStrings.pharmacyCountryCode];
    pharmacyPhnNum = json[AppStrings.pharmacyPhoneNumber];
    profilePicUrl = json[AppStrings.profilePicUrl];
    url = json[AppStrings.mediaFiles][AppStrings.urlFile];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.profilePicUrl] = profilePicUrl;
    data[AppStrings.patientLastName] = patientLastName;
    data[AppStrings.patientDob] = patientDOB;
    data[AppStrings.patientdetailSoc] = patientDetailsSOC;
    data[AppStrings.patientPhoneNUmber] = patientPhnNumber;
    data[AppStrings.patientFirstName] = patientFirstName;
    data[AppStrings.patientCountryCode] = patientCountryCode;
    data[AppStrings.patientEmail] = patientEmail;
    data[AppStrings.patientAddress] = patientAddress;
    data[AppStrings.patientAbout] = patientAbout;
    data[AppStrings.patientCountry] = patientCountry;
    data[AppStrings.zipCode] = zipCode;
    data[AppStrings.city] = city;
    data[AppStrings.patientState] = patientState;
    data[AppStrings.physicianName] = physicianName;
    data[AppStrings.physiciamCountryCode] = physicianCountryCode;
    data[AppStrings.physicianName] = physicianPhnNum;
    data[AppStrings.careGiverName] = caregiverName;
    data[AppStrings.careGiverCountryCode] = caregiverCountryCode;
    data[AppStrings.careGiverPhoneNumber] = caregiverPhoneNumber;
    data[AppStrings.pharmacyName] = pharmacyName;
    data[AppStrings.pharmacyCountryCode] = pharmacyCountryCode;
    data[AppStrings.pharmacyPhoneNumber] = pharmacyPhnNum;
    data[AppStrings.mediaFiles] = {AppStrings.urlFile: url};

    return data;
  }
}
