import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

class AppTextStyle {
  static const TextStyle appheadings = TextStyle(
    color: AppColor.buttonEnableColour,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle appRichText = TextStyle(
      color: AppColor.blackColour,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0);

  static const TextStyle loginScreenForgotPassword = TextStyle(
      color: AppColor.buttonEnableColour,
      fontSize: 15,
      fontWeight: FontWeight.bold);

  static const TextStyle appSubHeading =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  static const TextStyle settingScreen = TextStyle(fontWeight: FontWeight.w600);
  static const TextStyle profileScreenHeading = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0);
  static const TextStyle profileScreenSubHeading = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.0);

  static const TextStyle knowMeMOreQuestions =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  static const TextStyle appBarTitile = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 16, color: AppColor.blackColour);

  static const TextStyle alertToneTextStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
  static const TextStyle addUserPatient = TextStyle(
    color: AppColor.buttonEnableColour,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle knowMeMoreButton = TextStyle(
      color: AppColor.whiteColour, fontWeight: FontWeight.w700, fontSize: 14.0);

  static const TextStyle settingProfileName =
      TextStyle(color: AppColor.whiteColour);

  static const TextStyle phoneNumberScreen = TextStyle(
      color: AppColor.blackColour, fontSize: 14, fontWeight: FontWeight.w600);

  static const TextStyle projectUnderDevelopment = TextStyle(fontSize: 25);

  static const TextStyle expandTileAlert = TextStyle(
      color: AppColor.blackColour, fontWeight: FontWeight.w700, fontSize: 15.0);

  static const TextStyle yseterdaySize = TextStyle(
      // color:  Colors.brownGrey,
      fontWeight: FontWeight.w400,
      fontSize: 11.0);

  static const TextStyle snOt = TextStyle(
      color: AppColor.redColor, fontWeight: FontWeight.w600, fontSize: 12.0);
  static const TextStyle pt = TextStyle(
      color: AppColor.mutedGreen, fontWeight: FontWeight.w600, fontSize: 12.0);
  static const alertNameStyle = TextStyle(
      color: AppColor.blackColour, fontWeight: FontWeight.w600, fontSize: 15.0);

  static const numberTextStyle = TextStyle(color: AppColor.whiteColour);
  static const whoWillDoSocTextStyle = TextStyle(fontWeight: FontWeight.w600);
  static const editProfileStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w700);

  static const alertDialogTextStyle = TextStyle(
      fontWeight: FontWeight.w700, color: AppColor.blackColour, fontSize: 16);

  static const eventHeading = TextStyle(
      color: AppColor.bluish, fontWeight: FontWeight.w600, fontSize: 15.0);
  static const blueContainerStyle =
      TextStyle(color: AppColor.buttonEnableColour);
  static const organizationStyle = TextStyle(color: AppColor.blackColour);
  static const emailTextStyle = TextStyle(color: AppColor.buttonEnableColour);
}
