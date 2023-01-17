import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';

import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/listtile_widget.dart';
import 'package:provider/provider.dart';

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      //  valuation = await _localStorage.getapplock(AppStrings.appLock);
    });

    return Consumer<AppFormProvider>(
      builder: (context, _providerVal, child) {
        return AppBarClass(
          leading: IconButton(
            icon: Image.asset(
              AppAssetImagesFile.backbutton,
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          appBarString: AppStrings.securitySettings,
          widget: ListView(children: [
            ListTileClass(
              image1: AppAssetImagesFile.changePassword,
              title: AppStrings.changePassword,
              onTap: () {
                Navigator.pushNamed(context, Routing.changePasswordRoute);
              },
            ),
            ListTileClass(
              image1: AppAssetImagesFile.setPinLock,
              title: AppStrings.resetPinLock,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routing.currentPinLock,
                  arguments: Routing.pinLock,
                );
              },
            ),
            ListTileClass(
              alert: true,
              image1: AppAssetImagesFile.appLock,
              title: AppStrings.appLock,
              value: _providerVal.valueAtion,
              onChanged: (value) async {
               
                // print("000000000000000000000");
                // print(_providerVal.valueAtion);

                _providerVal.storeAppLock(value);

                // print(_providerVal.valueAtion);

                _localStorage.setapplock(
                    AppStrings.appLock, _providerVal.storeAppLock(value));
                                 

                // bool? ans = await _localStorage.getapplock(AppStrings.appLock);
              
                if (_providerVal.storeAppLock(value)) {
                  // print(_providerVal.valuation);
                  // setState(() {
                  // valuation = ans!;

                  // });
                  // print(valuation);

                  // await Future.delayed(const Duration(seconds: 2));
                  Navigator.pushNamed(context, Routing.pinLock);
                } else {
                  return;
                }
              },
            ),
          ]),
        );
      },
    );
  }
}
