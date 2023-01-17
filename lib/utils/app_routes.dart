import 'package:flutter/material.dart';
import 'package:health_group/model/build_model.dart';
import 'package:health_group/ui/add_patient.dart';
import 'package:health_group/ui/add_quick_reply.dart';
import 'package:health_group/ui/add_user.dart';
import 'package:health_group/ui/alert_tone.dart';
import 'package:health_group/ui/build_profile.dart';
import 'package:health_group/ui/calendar.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/ui/connectivity_check.dart';
import 'package:health_group/ui/edit_profile.dart';
import 'package:health_group/ui/edit_quick_reply.dart';
import 'package:health_group/ui/enter_current_pinLock.dart';
import 'package:health_group/ui/errror_page.dart';
import 'package:health_group/ui/forgot_password.dart';
import 'package:health_group/ui/google_maps.dart';
import 'package:health_group/ui/home.dart';
import 'package:health_group/ui/know_me_more.dart';
import 'package:health_group/ui/login_page.dart';
import 'package:health_group/ui/matched.dart';
import 'package:health_group/ui/new_password.dart';
import 'package:health_group/ui/organization.dart';
import 'package:health_group/ui/pin_lock.dart';
import 'package:health_group/ui/quick_reply.dart';
import 'package:health_group/ui/reset_password.dart';
import 'package:health_group/ui/reset_pin_lock.dart';
import 'package:health_group/ui/review_profile.dart';
import 'package:health_group/ui/security_settings.dart';
import 'package:health_group/ui/set_password.dart';
import 'package:health_group/ui/settings_ui.dart';
import 'package:health_group/ui/tab_view.dart';

class Routing {
  static const String loginPageRoute = '/';
  static const String newPasswordRoute = '/newPassword';
  static const String organizationRoute = '/organization';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String resetPasswordRoute = '/resetPasswordRoute';
  static const String reviewProfileRoute = '/reviewProfileRoute';
  static const String setPasswordRoute = '/setPassword';
  static const String matchedRoute = '/matched';
  static const String buildProfileRoute = '/buidProfile';
  static const String setPinRoute = '/setPin';
  static const String settingsRoute = '/settings';
  static const String homePageRoute = '/homePage';
  static const String editProfileRoute = '/editProfile';
  static const String addUserRoute = '/addUser';
  static const String addPatientRoute = '/addPatient';
  static const String changePasswordRoute = '/changePassword';
  static const String alertToneRoute = "/alertTone";
  static const String tabBarRoute = '/tabBarView';
  static const String pinLock = '/pinLock';
  static const String quickReply = '/quickReply';
  static const String calenderRoute = '/calender';
  static const String securitySettingRoute = '/securitySettingsRoute';
  static const String addQuickReplyhRoute = '/addQuickReply';
  static const String editQuickReplyRoute = '/editQuickReply';
  static const String knowMeMore = "/knowMeMore";
  static const String resetPinLock = "/resetPinLock";
  static const String currentPinLock = "/currentPinLock";
  static const String securitySettings = "/securitySettings";
  static const String googleMap = "/googleMaps";
  static const String networkSetting = "/networkSettkng";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));

      case newPasswordRoute:
        return MaterialPageRoute(builder: ((context) => const NewPassword()));

      case organizationRoute:
        return MaterialPageRoute(builder: ((context) => const Organization()));

      case forgotPasswordRoute:
        return MaterialPageRoute(
            builder: ((context) => const ForgotPassword()));

      case resetPasswordRoute:
        return MaterialPageRoute(builder: ((context) => const ResetPassword()));

      case reviewProfileRoute:
        return MaterialPageRoute(
            builder: ((context) => ReviewProfile(
                  dataItem: settings.arguments as BuildDataModel,
                )));

      case setPasswordRoute:
        return MaterialPageRoute(builder: ((context) => const SetPassword()));
      case matchedRoute:
        return MaterialPageRoute(builder: ((context) => const MAtchedText()));

      case buildProfileRoute:
        return MaterialPageRoute(builder: ((context) => const BuildProfiel()));

      case settingsRoute:
        return MaterialPageRoute(builder: ((context) => const Settings()));

      case homePageRoute:
        return MaterialPageRoute(
            builder: ((context) => const HomePage(
                // value: (settings.arguments ?? {}) as Map,
                )));

      case googleMap:
        return MaterialPageRoute(builder: ((context) => const GoogleMaps()));

      case editProfileRoute:
        return MaterialPageRoute(builder: ((context) => const EditProfile()));
      case addUserRoute:
        return MaterialPageRoute(builder: ((context) => const AddUser()));

      case addPatientRoute:
        return MaterialPageRoute(builder: ((context) => const AddPatient()));
      case changePasswordRoute:
        return MaterialPageRoute(
            builder: ((context) => const ChangePassword()));

      case alertToneRoute:
        return MaterialPageRoute(builder: ((context) => const AlertTone()));
      case tabBarRoute:
        return MaterialPageRoute(builder: ((context) => const TabBarClass()));

      case pinLock:
        return MaterialPageRoute(builder: ((context) => const PinLockClass()));
      case quickReply:
        return MaterialPageRoute(builder: ((context) => const QuickRepkly()));
      case calenderRoute:
        return MaterialPageRoute(
            builder: ((context) => const CustomTableCalendar()));
      // case securitySettingRoute:
      //   return MaterialPageRoute(builder: ((context) => const CalenderClass()));
      case addQuickReplyhRoute:
        return MaterialPageRoute(builder: ((context) => const AddQuickReply()));

      case editQuickReplyRoute:
        return MaterialPageRoute(
            builder: ((context) => const EditQuickReply()));
      case knowMeMore:
        return MaterialPageRoute(
            builder: ((context) => const KnowMeMoreClass()));

      case resetPinLock:
        return MaterialPageRoute(builder: ((context) => const ResetPinLock()));
      case currentPinLock:
        String? route;
        assert(settings.arguments is String?,
            "Incorrect Argument to (${Routing.currentPinLock}) Check Route");
        route = settings.arguments as String?;
        return MaterialPageRoute(
            builder: ((context) => route != null
                ? CurrentPinLock(route: route)
                : CurrentPinLock()));
      case securitySettings:
        return MaterialPageRoute(
            builder: ((context) => const SecuritySettings()));
      case networkSetting:
        return MaterialPageRoute(
            builder: ((context) => const ConnectivityCheck()));

      default:
        return MaterialPageRoute(builder: ((context) => const ErrorPage()));
    }
  }
}
