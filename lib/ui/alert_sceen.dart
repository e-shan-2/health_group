import 'package:flutter/material.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/expandtile_subtile.dart';
import 'package:health_group/widget/appbar.dart';

class AlertScrenn extends StatefulWidget {
  const AlertScrenn({Key? key}) : super(key: key);

  @override
  State<AlertScrenn> createState() => _AlertScrennState();
}

class _AlertScrennState extends State<AlertScrenn> {
  @override
  Widget build(BuildContext context) {
        double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return AppBarClass(
        appBarString: AppStrings.alert,
        leading: IconButton(
          icon: Image.asset(
            AppAssetImagesFile.logo,
            height: 30,
          ),
          onPressed: () {},
        ),
        widget: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Container(
                        height: _screenheight * 0.05,
                        width: _screenwidth * 0.026,
                        decoration: const BoxDecoration(
                          color: AppColor.redColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        AppStrings.urgetPriority,
                        style: AppTextStyle.expandTileAlert,
                      ),
                    ],
                  ),
                  children: [
                    const Divider(),
                    ExpandSubTile(
                      image: AppAssetImagesFile.homelogo,
                      referal: true,
                      imageIcon: const Icon(
                        Icons.warning,
                        color: AppColor.redColor,
                      ),
                      acknowledge: true,
                      imageIcon2: Stack(alignment: Alignment.center, children: [
                        Container(
                          height: _screenheight * 0.05,
                          width: _screenwidth * 0.052,
                          decoration: const BoxDecoration(
                            color: AppColor.buttonEnableColour,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          AppStrings.three,
                          style: AppTextStyle.numberTextStyle,
                        ),
                      ]),
                    ),
                    const Divider(),
                    ExpandSubTile(
                      image: AppAssetImagesFile.homelogo,
                      referal: true,
                      acknowledge: true,
                      imageIcon: const Icon(
                        Icons.warning,
                        color: AppColor.redColor,
                      ),
                      imageIcon2: Stack(alignment: Alignment.center, children: [
                        Container(
                          height: _screenheight * 0.05,
                          width: _screenwidth * 0.052,
                          decoration: const BoxDecoration(
                            color: AppColor.buttonEnableColour,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          AppStrings.three,
                          style: AppTextStyle.numberTextStyle,
                        ),
                      ]),
                    ),
                    const Divider(),
                    ExpandSubTile(
                      image: AppAssetImagesFile.homeLogoCross,
                      referal: true,
                      acknowledge: true,
                      imageIcon: const Icon(
                        Icons.warning,
                        color: AppColor.redColor,
                      ),
                      imageIcon2: Stack(alignment: Alignment.center, children: [
                        Container(
                          height: _screenheight * 0.05,
                          width: _screenwidth * 0.052,
                          decoration: const BoxDecoration(
                            color: AppColor.buttonEnableColour,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.three,
                            style: AppTextStyle.numberTextStyle,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Container(
                        height: _screenheight * 0.05,
                        width: _screenwidth * 0.026,
                        decoration: const BoxDecoration(
                          color: AppColor.mutedGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        AppStrings.acknowledge,
                        style: AppTextStyle.expandTileAlert,
                      ),
                    ],
                  ),
                  children: [
                    const Divider(),
                    ExpandSubTile(
                      imageIcon: const SizedBox(width: 30),
                      image: AppAssetImagesFile.homelogo,
                      referal: true,
                      acknowledge: true,
                      imageIcon2: Image.asset(AppAssetImagesFile.greenThumsUp),
                    ),
                    const Divider(),
                    ExpandSubTile(
                      imageIcon2: Image.asset(AppAssetImagesFile.greenThumsUp),
                      imageIcon: const SizedBox(width: 30),
                      image: AppAssetImagesFile.homelogo,
                      referal: true,
                      acknowledge: true,
                    ),
                    const Divider(),
                    ExpandSubTile(
                      imageIcon2: Stack(alignment: Alignment.center, children: [
                        Container(
                          height: _screenheight * 0.05,
                          width:_screenwidth * 0.052,
                          decoration: const BoxDecoration(
                            color: AppColor.buttonEnableColour,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          AppStrings.three,
                          style: AppTextStyle.numberTextStyle,
                        ),
                      ]),
                      imageIcon: Image.asset(AppAssetImagesFile.greenThumsUp),
                      image: AppAssetImagesFile.homeLogoCross,
                      referal: true,
                      acknowledge: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Container(
                        height:_screenheight * 0.05,
                        width: _screenwidth * 0.026,
                        decoration: const BoxDecoration(
                          color: AppColor.buttonEnableColour,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        AppStrings.referral,
                        style: AppTextStyle.expandTileAlert,
                      ),
                    ],
                  ),
                  children: [
                    const Divider(),
                    ExpandSubTile(
                      imageIcon2: Container(),
                      imageIcon: Container(),
                      image: AppAssetImagesFile.homelogo,
                    ),
                    const Divider(),
                    ExpandSubTile(
                      imageIcon2: Container(),
                      imageIcon: Container(),
                      image: AppAssetImagesFile.homelogo,
                    ),
                    const Divider(),
                    ExpandSubTile(
                      imageIcon2: Container(),
                      imageIcon: Container(),
                      image: AppAssetImagesFile.homeLogoCross,
                    ),
                  ],
                ),
              ),
            ]));
  }
}
