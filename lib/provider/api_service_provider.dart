import 'package:flutter/material.dart';
import 'package:health_group/model/add_patient.dart';
import 'package:health_group/model/add_user.dart';
import 'package:health_group/model/build_model.dart';
import 'package:health_group/model/change_password.dart';
import 'package:health_group/model/edit_profile.dart';
import 'package:health_group/model/know_me_more.dart';
import 'package:health_group/model/model.dart';
import 'package:health_group/model/pin_model.dart';
import 'package:health_group/model/quick_reply.dart';
import 'package:health_group/model/quick_reply_update.dart';

import 'package:health_group/services/api_services.dart';

import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/common_snackbar.dart';

class ApiServiceProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  static final ApiServiceProvider _instance = ApiServiceProvider._internal();

  factory ApiServiceProvider() {
    return _instance;
  }

  ApiServiceProvider._internal();

  Future<Map<String, dynamic>?> postDataRequest(
      BuildContext context, DataModel modal) async {
    Map<String, dynamic>? data;

    try {
      data = await _apiServices.loginRequest(modal);
      AppCommonSnackBar().appCommonSnackbar(context, data[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw "$e";
    }

    return data;
  }

  Future<Map<String, dynamic>?> patchDataRequest(
      BuildContext context, String password, String confirmPassword) async {
    Map<String, dynamic>? data;
    try {
      data = await _apiServices.setPassword(password, confirmPassword);
      AppCommonSnackBar().appCommonSnackbar(context, data[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
    }
    return data;
  }

  Future<Map<String, dynamic>?> patchForgotDataRequest(
      BuildContext context, String email) async {
    Map<String, dynamic>? data;
    try {
      data = await _apiServices.forgotPassword(email);
      AppCommonSnackBar().appCommonSnackbar(context, data![AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw "$e";
    }
    return data;
  }

  Future<Map<String, dynamic>?> patchForgotPasswordVerify(BuildContext context,
      String token, String password, String confirmPassword, String otp) async {
    Map<String, dynamic>? data;
    try {
      data = await _apiServices.forgetPwdVerify(
          token, password, confirmPassword, otp);
      AppCommonSnackBar().appCommonSnackbar(context, data![AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());

      throw "$e";
    }

    return data;
  }

  Future<Map<String, dynamic>?> postForgotPin(
      BuildContext context, String email, String password) async {
    Map<String, dynamic>? data;
    try {
      data = await _apiServices.forgotPin(email, password);
      AppCommonSnackBar().appCommonSnackbar(context, data[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
    }
    return data;
  }

  Future<int?> verifyPinLock(VerifyPinModel data) async {
    int? _data = await _apiServices.verifyPin(data);

    return _data;
  }

// Review Profile
  Future<Map<String, dynamic>?> editProfile(
      BuildContext context, BuildDataModel dataModel) async {
    Map<String, dynamic>? data;
    try {
      data = await _apiServices.editProfile(dataModel);

      AppCommonSnackBar().appCommonSnackbar(context, data[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
    }

    return data;
  }

  Future<Map<String, dynamic>?> addPatientProfile(
      BuildContext context, AddPatientDataModel dataModel) async {
    Map<String, dynamic>? response;
    try {
      response = await _apiServices.addPatient(dataModel);

      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);

      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      // throw "response $e not found";
    }
    return response;
  }

  Future<Map<String, dynamic>?> addUserProfile(
      BuildContext context, AddUserDataModel dataModel) async {
    Map<String, dynamic>? response;
    try {
      response = await _apiServices.addUser(dataModel);
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
    }
    return response;
  }

  // Future<int?> addUser(AddUserDataModel dataModel) async {
  //   int? response;
  //   try {
  //     response = await _apiServices.editMainProfile(dataModel);
  //   } catch (e) {
  //     throw "response $e not found";
  //   }
  //   return response;
  // }

  Future<Map<String, dynamic>?> changePasswordSettingScereen(
      BuildContext context, ChangePasswordDataModel dataModel) async {
    Map<String, dynamic>? response;
    try {
      response = await _apiServices.changePassword(dataModel);
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e ";
    }
    return response;
  }

  Map<String, dynamic>? name;

  Future<Map<String, dynamic>> getUserProfileData() async {
    Map<String, dynamic> response;
    try {
      response = await _apiServices.profile();
      name = response[AppStrings.data];

      return response;
    } catch (e) {
      throw "$e ";
    }
  }

  Future<Map<String, dynamic>> editUserProfileData(
      BuildContext context, EditProfileDataModel dataModel) async {
    Map<String, dynamic> response;
    try {
      response = await _apiServices.editMainProfile(dataModel);
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);

      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e";
    }
  }

//For quick reply
  Future<Map<String, dynamic>> getQuickReplyUSer() async {
    Map<String, dynamic> response;
    try {
      response = await _apiServices.userQuickreply();

      return response;
    } catch (e) {
      throw " $e ";
    }
  }

  Future<Map<String, dynamic>> getKnowMeMoreProfile(
      BuildContext context) async {
    Map<String, dynamic> response;
    try {
      response = await _apiServices.getKnowMeMore();
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);
      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e ";
    }
  }

  Future<Map<String, dynamic>> patchKnowMeMoreProfile(
      BuildContext context, KnowMeMoreDataModel dataModel) async {
    Map<String, dynamic> response;
    try {
      response = await _apiServices.patchKnowMeMore(dataModel);
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);

      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e ";
    }
  }

  Future<Map<String, dynamic>?> patchQuickReplyUpdate(
      BuildContext context, QuickReplyUpdateDataModel dataModel) async {
    Map<String, dynamic>? response;
    try {
      response = await _apiServices.patchQuickReplyUpdate(dataModel);
      AppCommonSnackBar()
          .appCommonSnackbar(context, response![AppStrings.message]);

      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e";
    }
  }

  Future<int?> patchQuickReplyadd(QuickReplyDataModel dataModel) async {
    int? response;
    try {
      response = await _apiServices.patchQuickReplyadd(dataModel);

      return response;
    } catch (e) {
      throw " $e";
    }
  }

  Future<Map<String, dynamic>> logOut(BuildContext context) async {
    Map<String, dynamic>? response;
    try {
      response = await _apiServices.logOut();
      AppCommonSnackBar()
          .appCommonSnackbar(context, response[AppStrings.message]);

      return response;
    } catch (e) {
      AppCommonSnackBar().appCommonSnackbar(context, e.toString());
      throw " $e ";
    }
  }

  
}
