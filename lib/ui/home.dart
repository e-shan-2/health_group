import 'package:flutter/material.dart';



import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';

import 'package:health_group/widget/appbar.dart';


class HomePage extends StatefulWidget {

  const HomePage({ Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async => false,
      child: AppBarClass(
        appBarString: AppStrings.homeScreen,
        widget: Center(
          child: Text(
            AppStrings.projectUnderDevelopment,
            style: AppTextStyle.projectUnderDevelopment,
          ),
        ),
      ),
    );
  }
}
