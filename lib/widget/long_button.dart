// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:health_group/utils/app_color.dart';

class AppButtonClass extends StatefulWidget {
  String buttonString;
  Color buttonColour;
  double width;
  double height;
  bool indicator;
  bool isInit;
  bool isDone;
  Color buttonColorString;
  void Function() onPressed;
  AppButtonClass(
      {required this.buttonColorString,
      required this.width,
      required this.height,
      required this.buttonColour,
      required this.buttonString,
      required this.onPressed,
      this.isInit = true,
      this.isDone = false,
      required this.indicator,
      Key? key})
      : super(key: key);

  @override
  State<AppButtonClass> createState() => _AppButtonClassState();
}

enum ButtonState { intialStage, loading, completed }

class _AppButtonClassState extends State<AppButtonClass> {
  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    return widget.isInit
        ? ElevatedButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonString,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: widget.buttonColorString),
            ),
            style: ButtonStyle(
                // side:  MaterialStateBorderSide<BorderSide>(),
                fixedSize: MaterialStateProperty.all<Size>(
                    Size(widget.width, widget.height)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColor.whiteColour),
                backgroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonColour),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ))))
        : Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isDone
                    ? AppColor.buttonEnableColour
                    : AppColor.whiteColour),
            child: Center(
              child: widget.isDone
                  ? const Icon(Icons.done, size: 50, color: Colors.white)
                  : const CircularProgressIndicator(
                      color: AppColor.buttonEnableColour),
            ),
          );
  }
}
