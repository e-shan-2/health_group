import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_text_style.dart';

// ignore: must_be_immutable
class AppBarClass extends StatefulWidget {
  String appBarString;
 

  Widget widget;
  Widget? leading;
  List<Widget>? actions;

  AppBarClass(

      { this.leading,
        this.actions,
    
      required this.widget,
     
      required this.appBarString,
      Key? key})
      : super(key: key);

  @override
  State<AppBarClass> createState() => _AppBarClassState();
}

class _AppBarClassState extends State<AppBarClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.whiteColour,
        title: Text(
          widget.appBarString,
          style: AppTextStyle.appBarTitile,
        ),
        leading: widget.leading,
        actions:widget.actions,
        
        
      ),
      body:widget.widget,
    );
  }
}
