import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_text_style.dart';

// ignore: must_be_immutable
class BlueContainers extends StatefulWidget {
  int? buttoninteger;
  String? value;
  bool noball;
  final void Function()? onTap;

  BlueContainers(
      {this.noball = false,
      this.value,
      this.buttoninteger,
      Key? key,
      this.onTap})
      : super(key: key);

  @override
  State<BlueContainers> createState() => _BlueContainersState();
}

class _BlueContainersState extends State<BlueContainers> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: widget.onTap,
      child: widget.noball
          ? GestureDetector(
              onTap: widget.onTap,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: _screenheight * 0.0872,
                width: _screenwidth * 0.179,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.whiteColour),
                ),
                child: Text(
                  "${widget.value}",
                  textAlign: TextAlign.center,
                  style:AppTextStyle.blueContainerStyle,
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: _screenheight * 0.081,
              width: _screenwidth * 0.166,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.buttonEnableColour),
                color: AppColor.whiteColour,
              ),
              child: Text(
                "${widget.buttoninteger}",
                textAlign: TextAlign.center,
                style:AppTextStyle.blueContainerStyle,
              ),
            ),
    );
  }
}
