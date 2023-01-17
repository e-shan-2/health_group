import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Authentication {
  success,
  error,
  exception,
}

class SharedPreferenceClass {
  static final SharedPreferenceClass _instance =
      SharedPreferenceClass._internal();
  factory SharedPreferenceClass() {
    return _instance;
  }

  SharedPreferenceClass._internal();

  late List<bool?>? localData;

  Future<void> screens() async {
    localData = [
      await getScreen(
            Routing.loginPageRoute,
          ) ??
          false,
      await getScreen(
            Routing.reviewProfileRoute,
          ) ??
          false,
    ];
    // print(localData);
  }

  Future<String> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    return _prefs.getString(AppStrings.token) ?? AppStrings.unableTOFindToken;
  }

  Future<void> setToken(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(AppStrings.token, value);
  }

  // String password = 'password';

  Future<String> getpassword(String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    return _prefs.getString(password) ?? AppStrings.unableToFIndTHePAssword;
  }

  Future<bool> setpassword(String password, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(password, value);
  }

  Future<void> setdesignationDepartment(List<String> data) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList(AppStrings.departmentDesignationSharedPrefernce, data);
  }

  Future<List<String>?> getdesignationDepartment() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String>? departmentDesignation =
        _prefs.getStringList(AppStrings.departmentDesignationSharedPrefernce);

    return departmentDesignation;
  }

  Future<void> setScreen(String page, bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setBool(page, value);
  }

  Future<bool?>? getScreen(String page) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool? value = _prefs.getBool(page);

    return value;
  }

  Future<void> setEmail(
    String email,
  ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(AppStrings.email, email);
  }

  String? email;
  Future<String?> getEmail() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    email = _prefs.getString(AppStrings.email);
    return email;
  }

  String socValue = AppStrings.soc;
  Future<void> setSocValue(String socvalur) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(socValue, socvalur);
  }

  Future<void> getSocValue() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    email = _prefs.getString(socValue);
  }

  Future<void> setapplock(String page, bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setBool(page, value);
  }

  Future<bool?> getapplock(String applock) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool? value = _prefs.getBool(applock);
    return value;
  }

  Future<void> clearKeyData(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove(key);
  }
}
