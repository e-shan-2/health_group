import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_text_style.dart';

// ignore: must_be_immutable
class ListTileClass extends StatefulWidget {
  String title;
  String image1;

  bool dnd;
  bool alert;
  bool value;
  void Function()? onTap;
  void Function(bool)? onChanged;

  ListTileClass(
      {this.onChanged,
      this.value = false,
      this.dnd = false,
      this.alert = false,
      this.onTap,
      required this.image1,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<ListTileClass> createState() => _ListTileClassState();
}

class _ListTileClassState extends State<ListTileClass> {
  @override
  Widget build(BuildContext context) {
    // double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return ListTile(
      leading: widget.dnd
          ? CircleAvatar(radius: 17, backgroundImage: AssetImage(widget.image1))
          : Image.asset(
              widget.image1,
              height: _screenheight * 0.045,
            ),
      title: Text(
        widget.title,
        style: AppTextStyle.settingScreen,
      ),
      trailing: widget.alert
          ? CupertinoSwitch(
              activeColor: AppColor.buttonEnableColour,
              value: widget.value,
              onChanged: widget.onChanged)
          : Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(AppAssetImagesFile.reverseBackArrow),
            ),
      onTap: widget.onTap,
    );
  }
}
