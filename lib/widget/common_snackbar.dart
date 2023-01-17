import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

class AppCommonSnackBar {
  void appCommonSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.buttonEnableColour,
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.all(0.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        content: Text(text),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: "",
          onPressed: () {},
          textColor: AppColor.whiteColour,
        ),
      ),
    );
  }
}
