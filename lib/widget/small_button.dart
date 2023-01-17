import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

// ignore: must_be_immutable
class SmallButton extends StatefulWidget {
  bool colour;
  SmallButton({required this.colour, Key? key}) : super(key: key);

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(11),
      height: _screenheight * 0.02,
      width: _screenwidth * 0.041,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.buttonEnableColour),
        color: widget.colour == true
            ? AppColor.buttonEnableColour
            : AppColor.whiteColour,
      ),
    );
  }
}
