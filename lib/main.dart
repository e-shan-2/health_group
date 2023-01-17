import 'package:flutter/material.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/provider/connectivity.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  String data;
  bool value;

  SharedPreferenceClass _s = SharedPreferenceClass();
  WidgetsFlutterBinding.ensureInitialized();

  await _s.screens();
  await _s.getEmail();
  await _s.getToken();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  data = await _s.getToken();

  value = (await _s.getapplock(AppStrings.appLock)) ?? false;

  runApp(HealthGroup(
    value: value,
    data: data,
  ));
}

// ignore: must_be_immutable
class HealthGroup extends StatefulWidget {
  HealthGroup({required this.data, required this.value, Key? key})
      : super(key: key);

  final bool value;
  String data;

  @override
  State<HealthGroup> createState() => _HealthGroupState();
}

class _HealthGroupState extends State<HealthGroup> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_provider) => AppFormProvider(widget.value),
          ),
          ChangeNotifierProvider(
            create: (context) => ApiServiceProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) {
              ConnectivityProvider changeNotifer = ConnectivityProvider();
              changeNotifer.initialLoad();
              return ConnectivityProvider();
            },
          )
        ],
        child: Consumer<ConnectivityProvider>(
            builder: (context, _connectivityProvider, child) {
          // print(_connectivityProvider.isOnline);
          _connectivityProvider.initialLoad();
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routing.generateRoute,
              initialRoute: _connectivityProvider.isOnline == false
                  ? Routing.networkSetting
                  : widget.data == AppStrings.unableTOFindToken
                      ? Routing.loginPageRoute
                      : SharedPreferenceClass().localData?[0] == false
                          ? Routing.loginPageRoute
                          : SharedPreferenceClass().localData?[1] == false
                              // ignore: unrelated_type_equality_checks
                              ? SharedPreferenceClass().getScreen(
                                          Routing.setPasswordRoute) ==
                                      true
                                  ? Routing.buildProfileRoute
                                  : Routing.setPasswordRoute
                              // ignore: unrelated_type_equality_checks
                              : widget.value == true
                                  ? Routing.currentPinLock
                                  : Routing.tabBarRoute);
        }));
  }
}
