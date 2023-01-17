import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/appbar.dart';

class AlertTone extends StatefulWidget {
  const AlertTone({Key? key}) : super(key: key);

  @override
  State<AlertTone> createState() => _AlertToneState();
}

class _AlertToneState extends State<AlertTone> {
  @override
  Widget build(BuildContext context) {
    return AppBarClass(
        appBarString: AppStrings.alertTone,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.blackColour,
              size: 25,
            )),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routing.addPatientRoute);
              },
              icon: const Icon(
                Icons.check,
                color: AppColor.greyColour,
                size: 25,
              )),
        ],
        widget: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            Text(
              AppStrings.pingPong,
              style: AppTextStyle.alertToneTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(AppStrings.ripple),
          ],
        ));
  }
}
