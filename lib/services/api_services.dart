import 'dart:convert';

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
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_api_constants.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  late String dataValue;
  static final ApiServices _instance = ApiServices._internal();
  factory ApiServices() {
    return _instance;
  }
  ApiServices._internal();

  final SharedPreferenceClass _localStorage = SharedPreferenceClass();

  Future<Map<String, dynamic>> loginRequest(DataModel data) async {
    Response response =
        await http.post(Uri.parse("${AppApi.apiUrl}${AppStrings.login}"),
            headers: {
              AppStrings.contentType: AppStrings.applicationJson,
              AppStrings.authorization: AppStrings.basicAGv
            },
            body: jsonEncode(data.toJson()));
    var view = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        _localStorage.setToken(view[AppStrings.data][AppStrings.token]);
        List<String> dataitem = [
          view[AppStrings.data][AppStrings.designationSmallCase],
          view[AppStrings.data][AppStrings.departmentSmallCase]
        ];

        _localStorage.setdesignationDepartment(dataitem);

        return view;
      } else if (400 <= response.statusCode && response.statusCode <= 500) {
        return view;
      }
    } catch (e) {
      throw "$e";
    }

    return view;
  }

  Future<Map<String, dynamic>> setPassword(
      String password, String confirmPassword) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
        Uri.parse("${AppApi.apiUrl}${AppStrings.setPasswordRoutes}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer} $token",
        },
        body: jsonEncode({
          AppStrings.passwordSmallCase: password,
          AppStrings.confirtmPasswordSmallCase: confirmPassword,
        }));
    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>?> forgotPassword(String email) async {
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl}${AppStrings.forGotPasswordRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
      },
      body: jsonEncode({AppStrings.emailSmallCase: email}),
    );
    var view = jsonDecode(response.body);
    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>?> forgetPwdVerify(
      String token, String password, String confirmPassword, String otp) async {
    Response response = await http.patch(
        Uri.parse("${AppApi.apiUrl} ${AppStrings.forgotVerifyPasswordRoute}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer}$token ",
        },
        body: jsonEncode({
          AppStrings.passwordSmallCase: password,
          AppStrings.confirtmPasswordSmallCase: confirmPassword,
          AppStrings.otp: otp
        }));
    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> forgotPin(String email, String password) async {
    Response response = await http.post(
      Uri.parse("${AppApi.apiUrl}${AppStrings.forgotVerifyPinRoute}"),
      headers: {AppStrings.contentType: AppStrings.applicationJson},
      body: jsonEncode({
        AppStrings.emailSmallCase: email,
        AppStrings.passwordSmallCase: password
      }),
    );
    var view = jsonDecode(response.body);
    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<int> verifyPin(VerifyPinModel data) async {
    String? datavalue = await _localStorage.getToken();

    Response response = await http.post(
        Uri.parse("${AppApi.apiUrl}${AppStrings.verifyPinRoute}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer}$datavalue",
        },
        body: jsonEncode(data.toJson()));

    try {
      return response.statusCode;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> editProfile(BuildDataModel dataModel) async {
    String? data = await _localStorage.getToken();

    Response response = await http.patch(
        Uri.parse("${AppApi.apiUrl}${AppStrings.editProfileRoute}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer} $data",
        },
        body: jsonEncode(dataModel.toJson()));

    var view = jsonDecode(response.body);
    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> addPatient(AddPatientDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.post(
        Uri.parse("${AppApi.apiUrl}${AppStrings.userAddPatientRoute}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer} $token",
        },
        body: jsonEncode(dataModel.toJson()));
    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw " $e";
    }
  }

  Future<Map<String, dynamic>> addUser(AddUserDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.post(
        Uri.parse("${AppApi.apiUrl} ${AppStrings.userAddUserRoute}"),
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.authorization: "${AppStrings.bearer} $token",
        },
        body: jsonEncode(dataModel.toJson()));

    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw "  $e";
    }
  }

  // Future<int?> editMainProfile(AddUserDataModel dataModel) async {
  //   String token = await _localStorage.getToken();
  //   Response response =
  //       await http.post(Uri.parse("${AppApi.apiUrl}/user/add-user"),
  //           headers: {
  //             "Content-Type": "application/json",
  //             "Authorization": "Bearer $token",
  //           },
  //           body: jsonEncode(dataModel.toJson()));

  //   print(response.body);

  //   try {
  //     if (response.statusCode == 200) {
  //       return response.statusCode;
  //     } else {
  //       return response.statusCode;
  //     }
  //   } catch (e) {
  //     throw "response $e is not found";
  //   }
  // }

  Future<Map<String, dynamic>> changePassword(
      ChangePasswordDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl}${AppStrings.changePasswordRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
      body: jsonEncode(dataModel.toJson()),
    );
    var view = jsonDecode(response.body);
    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> profile() async {
    String token = await _localStorage.getToken();
    Response response = await http.get(
      Uri.parse("${AppApi.apiUrl}${AppStrings.profileRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
    );

    var view = jsonDecode(response.body);

    try {
      // print("${response.statusCode} huda");
      // print("${view["data"]}hardki");
      // print(view);
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> editMainProfile(
      EditProfileDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl}${AppStrings.editMainProfile}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
      body: jsonEncode(dataModel.toJson()),
    );

    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw " $e";
    }
  }

  Future<Map<String, dynamic>> userQuickreply() async {
    String token = await _localStorage.getToken();
    Response response = await http.get(
      Uri.parse("${AppApi.apiUrl}${AppStrings.userQuickReplyRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
    );

    var view = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        return view;
      } else {
        return view;
      }
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> getKnowMeMore() async {
    String token = await _localStorage.getToken();
    Response response = await http.get(
      Uri.parse("${AppApi.apiUrl} ${AppStrings.userKnowMeMoreRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
    );

    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }

  Future<Map<String, dynamic>> patchKnowMeMore(
      KnowMeMoreDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl}${AppStrings.userKnowMeMoreRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
      body: jsonEncode(dataModel.toJson()),
    );

    var view = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        return view;
      } else {
        return view;
      }
    } catch (e) {
      throw " $e ";
    }
  }

  Future<Map<String, dynamic>?> patchQuickReplyUpdate(
      QuickReplyUpdateDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl} ${AppStrings.userQuickReplyUpdateRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
      body: jsonEncode(dataModel.toJson()),
    );
    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw " $e ";
    }
  }

  Future<int?> patchQuickReplyadd(QuickReplyDataModel dataModel) async {
    String token = await _localStorage.getToken();
    Response response = await http.patch(
      Uri.parse("${AppApi.apiUrl}${AppStrings.userQuickReplyRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
      body: jsonEncode(dataModel.toJson()),
    );

    try {
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      throw " $e ";
    }
  }

  // Future<int?> deleteQuickReply(St id) async {
  //   String token = await _localStorage.getToken();
  //   Response response = await http.patch(
  //     Uri.parse("${AppApi.apiUrl}/user/quick-reply"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token",
  //     },
  //     body: jsonEncode(id.toString()),
  //   );
  //   print(response.body);

  //   try {
  //     if (response.statusCode == 200) {
  //       return response.statusCode;
  //     } else {
  //       return response.statusCode;
  //     }
  //   } catch (e) {
  //     throw "response $e is not found";
  //   }
  // }

  Future<Map<String, dynamic>> logOut() async {
    String token = await _localStorage.getToken();
    Response response = await http.post(
      Uri.parse("${AppApi.apiUrl}${AppStrings.logOutRoute}"),
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.authorization: "${AppStrings.bearer} $token",
      },
    );

    var view = jsonDecode(response.body);

    try {
      return view;
    } catch (e) {
      throw "$e";
    }
  }


}
