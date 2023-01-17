import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_group/provider/api_service_provider.dart';

import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/alert_dailog.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/listtile_widget.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController _emailController;
  late TextEditingController _organizationController;
  late TextEditingController _statusController;
  late TextEditingController _aboutController;
  bool _valuationDnD = false;
  bool _valuationAlertSound = false;
  // late Future _getData;

  @override
  void initState() {
    _emailController = TextEditingController();
    _organizationController = TextEditingController();
    _statusController = TextEditingController();
    _aboutController = TextEditingController();
    // _getData= _providerApiServices.getUserProfileData(),
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _aboutController.dispose();
    _statusController.dispose();
    _organizationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {});

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                AppStrings.closeApp,
                // style: AppTextStyle.nunitoNormal
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    AppStrings.yes,
                    // style: AppTextStyle.nunitoNormal
                    //     .copyWith(color: AppColors.lipstick
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.no,
                    // style: AppTextStyle.nunitoNormal
                    //     .copyWith(color: AppColors.lipstick),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: AppBarClass(
        appBarString: AppStrings.settings,
        leading: IconButton(
          icon: Image.asset(
            AppAssetImagesFile.logo,
            height: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routing.calenderRoute);
              },
              icon: const Icon(
                Icons.calendar_today_rounded,
                color: AppColor.blackColour,
              ))
        ],
        widget: Container(
          color: AppColor.veryLightPink,
          child: ListView(
            children: [
              Consumer<ApiServiceProvider>(
                builder: (context, _providerApiServices, child) {
                  return FutureBuilder(
                      future: _providerApiServices.getUserProfileData(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          _emailController.text = snapshot.data[AppStrings.data]
                              [AppStrings.emailSmallCase];
                          _organizationController.text =
                              snapshot.data[AppStrings.data]
                                      [AppStrings.departmentSmallCase] ??
                                  AppStrings.nullvalue;

                          _statusController.text =
                              snapshot.data[AppStrings.data]
                                      [AppStrings.statusSmallCase] ??
                                  AppStrings.nullvalue;

                          _aboutController.text = snapshot.data[AppStrings.data]
                                  [AppStrings.aboutSmallCase] ??
                              AppStrings.nullvalue;
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.buttonEnableColour,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: AppColor.whiteColour,
                                        backgroundImage: NetworkImage(snapshot
                                                    .data[AppStrings.data]
                                                [AppStrings.profilePicUrl] ??
                                            "https://picsum.photos/200/300/?blur"),
                                        maxRadius: 20,
                                      ),
                                      title: Text(
                                          snapshot.data[AppStrings.data]
                                              [AppStrings.firstName],
                                          style:
                                              AppTextStyle.settingProfileName),
                                      subtitle: Text(
                                        snapshot.data[AppStrings.data]
                                            [AppStrings.departmentSmallCase],
                                        style: AppTextStyle.settingProfileName,
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: AppColor.whiteColour,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              Routing.editProfileRoute);
                                        },
                                      )),
                                  const Divider(
                                    color: AppColor.whiteColour,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 20),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormFieldClass(
                                            settings: true,
                                            labelName: AppStrings
                                                .emailAddressTextFormField,
                                            controller: _emailController,
                                            obscureText: false,
                                            enable: false,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormFieldClass(
                                            settings: true,
                                            labelName: AppStrings.organization,
                                            controller: _organizationController,
                                            obscureText: false,
                                            enable: false,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormFieldClass(
                                            settings: true,
                                            labelName: AppStrings.status,
                                            controller: _statusController,
                                            obscureText: false,
                                            enable: false,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormFieldClass(
                                            settings: true,
                                            labelName: AppStrings.about,
                                            controller: _aboutController,
                                            obscureText: false,
                                            enable: false,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    Routing.knowMeMore);
                                              },
                                              style: ButtonStyle(
                                                  alignment: Alignment.center,
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          const Size(150, 50)),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  5.0),
                                                          side: const BorderSide(
                                                              color: AppColor
                                                                  .whiteColour)))),
                                              child: Text(
                                                  AppStrings.settingsButtonName,
                                                  style: AppTextStyle.knowMeMoreButton)),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ]),
                                  ),
                                ]),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      });
                },
              ),
              Container(
                height: 60,
                color: AppColor.whiteColour,
                // margin: const EdgeInsets.symmetric(vertical: 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routing.addUserRoute);
                      },
                      child: Text(AppStrings.addUser,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.addUserPatient),
                    ),
                    const VerticalDivider(
                      width: 6,
                      color: AppColor.veryLightPink,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routing.addPatientRoute);
                      },
                      child: Text(
                        AppStrings.addPatient,
                        style: AppTextStyle.addUserPatient,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                color: AppColor.whiteColour,
                child: Column(
                  children: [
                    ListTileClass(
                      image1: AppAssetImagesFile.doNotDisturb,
                      title: AppStrings.doNotDisturb,
                      dnd: true,
                      alert: true,
                      value: _valuationDnD,
                      onChanged: (value) {
                        setState(() {
                          _valuationDnD = value;
                        });
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.alertSound,
                      title: AppStrings.alertSound,
                      alert: true,
                      value: _valuationAlertSound,
                      onChanged: (value) {
                        setState(() {
                          _valuationAlertSound = value;
                        });
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.alertTone,
                      title: AppStrings.alertTone,
                      onTap: () {
                        Navigator.pushNamed(context, Routing.alertToneRoute);
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.organizationMedia,
                      title: AppStrings.organizationMedia,
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.securitySettings,
                      title: AppStrings.securitySettings,
                      onTap: () {
                        Navigator.pushNamed(context, Routing.securitySettings);
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.organization,
                      title: AppStrings.organization,
                      onTap: () {
                        Navigator.pushNamed(context, Routing.organizationRoute);
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.quickReply,
                      title: AppStrings.quickReply,
                      onTap: () {
                        Navigator.pushNamed(context, Routing.quickReply);
                      },
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.about,
                      title: AppStrings.about,
                    ),
                    ListTileClass(
                        image1: AppAssetImagesFile.help,
                        title: AppStrings.help),
                    ListTileClass(
                      image1: AppAssetImagesFile.termsAndCondition,
                      title: AppStrings.termsCondition,
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.privacyPolicy,
                      title: AppStrings.privacyPolicy,
                    ),
                    ListTileClass(
                      image1: AppAssetImagesFile.icSettingIcon,
                      title: AppStrings.logOut,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AppAlertDialogBox(
                                imagePicker: false,
                                heading: AppStrings.logOut,
                                messsage: AppStrings.areYouSureYouWantToLogOut,
                                routingName: Routing.loginPageRoute,
                                delete: true,
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
