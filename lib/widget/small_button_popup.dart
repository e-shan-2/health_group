import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

// ignore: must_be_immutable
class SmallButtonPopUp extends StatefulWidget {
  String buttonString;
  Size buttonSize;
  void Function()? onPressed;
  Color appColor;
  SmallButtonPopUp(
      {required this.buttonSize,
      required this.appColor,
      required this.onPressed,
      required this.buttonString,
      Key? key})
      : super(key: key);

  @override
  State<SmallButtonPopUp> createState() => _SmallButtonPopUpState();
}

class _SmallButtonPopUpState extends State<SmallButtonPopUp> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(_screenwidth * 0.08, _screenheight * 0.03),
        elevation: 0,
        primary: widget.appColor,
      ),
      onPressed: widget.onPressed,
      child: FittedBox(
        child: Text(
          widget.buttonString,
          style: const TextStyle(color: AppColor.blackColour),
        ),
      ),
    );
  }
}
