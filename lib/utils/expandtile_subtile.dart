import 'package:flutter/material.dart';

import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';

// ignore: must_be_immutable
class ExpandSubTile extends StatefulWidget {
  String image;
  bool acknowledge;
  bool referal;
  Widget imageIcon;
  Widget imageIcon2;
  ExpandSubTile(
      {
      required this.imageIcon2,
      required this.imageIcon,
      this.referal = false,
      this.acknowledge = false,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  State<ExpandSubTile> createState() => _ExpandSubTileState();
}

class _ExpandSubTileState extends State<ExpandSubTile> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.image,
                  height: _screenheight * 0.063, width: _screenwidth * 0.11),
              const SizedBox(
                width: 8.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.rohitShetty,
                      style: AppTextStyle.alertNameStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(),
                      Text(
                        AppStrings.sn,
                        style: AppTextStyle.snOt,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        AppStrings.pt,
                        style: AppTextStyle.pt,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        AppStrings.otAlertScreen,
                        style: AppTextStyle.snOt,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        AppStrings.slpAlertScreen,
                        style: AppTextStyle.snOt,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        AppStrings.hhaAlertScreen,
                        style: AppTextStyle.snOt,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        AppStrings.rdAlertScreen,
                        style: AppTextStyle.snOt,
                      ),
                      // const SizedBox(
                      //   width: 8,
                      // ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    AppStrings.time,
                    style: AppTextStyle.yseterdaySize,
                  ),
                  widget.referal
                      ? Row(
                          children: [
                            widget.acknowledge
                                ? widget.imageIcon
                                // const Icon(

                                //     Icons.warning,
                                //     color: AppColor.redColor,
                                //   )
                                : SizedBox(width: _screenwidth * 0.055),
                            SizedBox(
                              width: _screenwidth * 0.079,
                            ),
                            widget.acknowledge
                                ? widget.imageIcon2
                                : Container(),
                          ],
                        )
                      : SizedBox(
                          height: _screenheight * 0.055,
                        ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
