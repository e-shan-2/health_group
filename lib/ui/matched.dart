import 'package:flutter/material.dart';

import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/appbar.dart';

class MAtchedText extends StatefulWidget {
  const MAtchedText({Key? key}) : super(key: key);

  @override
  State<MAtchedText> createState() => _MAtchedTextState();
}

class _MAtchedTextState extends State<MAtchedText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  Map? data=ModalRoute.of(context)!.settings.arguments as Map;
    //  String name=data[AppStrings.matchedText];
    return AppBarClass(
      appBarString: AppStrings.chatScreen,
      widget: Center(
        child: Text(
          AppStrings.projectUnderDevelopment,
          style: AppTextStyle.projectUnderDevelopment,
        ),
      ),
    );
  }
}
