import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_group/model/edit_profile.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/image_picker_alert_dialog.dart';
import 'package:health_group/widget/image_picker_methods.dart';
import 'package:health_group/widget/phone_number.dart';
import 'package:health_group/widget/radio.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _codePicker;
  late final TextEditingController _aboutController;

  File? imageFile;
  String? value = "";
  String? emailValue;
  ImageProvider<Object>? backgroundImage;
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();

  void getemail() async {
    emailValue = await _localStorage.getEmail();
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _nameController.text =
        Provider.of<ApiServiceProvider>(context, listen: false)
            .name![AppStrings.firstName];

    _phoneNumberController = TextEditingController();
    _phoneNumberController.text =
        Provider.of<ApiServiceProvider>(context, listen: false)
            .name![AppStrings.mobileNUmberSmallCase];
    _codePicker = TextEditingController();
    _codePicker.text = Provider.of<ApiServiceProvider>(context, listen: false)
        .name![AppStrings.countryCode];

    _aboutController = TextEditingController();
    _aboutController.text =
        Provider.of<ApiServiceProvider>(context, listen: false)
            .name![AppStrings.aboutSmallCase];

    getemail();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    backgroundImage = NetworkImage(
      Provider.of<ApiServiceProvider>(context, listen: false)
          .name![AppStrings.profilePicUrl],
    );
  }
  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _phoneNumberController.dispose();
  //   _codePicker.dispose();
  //   _aboutController.dispose();
  //   _emailController.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      AppFormProvider _providerAppForm = Provider.of(context, listen: false);
      _providerAppForm.changevalue(AppStrings.acceptingPatients.toString());
    });

    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AppBarClass(
        appBarString: AppStrings.editProfile,
        actions: [
          IconButton(
              onPressed: () async {
                String? data =
                    Provider.of<AppFormProvider>(context, listen: false)
                        .randomData;

                EditProfileDataModel _dataModel = EditProfileDataModel(
                    about: _aboutController.text,
                    mobileNumber: _phoneNumberController.text,
                    countryCode: _codePicker.text,
                    lastName: _nameController.text,
                    firstName: _nameController.text,
                    profilePicUrl: data ??
                        Provider.of<ApiServiceProvider>(context, listen: false)
                            .name![AppStrings.profilePicUrl],
                    status: AppStrings.acceptingPatients);
                Map<String, dynamic>? response;
                try {
                  response = await Provider.of<ApiServiceProvider>(context,
                          listen: false)
                      .editUserProfileData(context, _dataModel);
                  if (200 <= response[AppStrings.statusCode] &&
                      response[AppStrings.statusCode] <= 300) {
                    Navigator.pop(context, Routing.settingsRoute);
                    setState(() {
                      Provider.of<AppFormProvider>(context).imageFile == null;
                    });
                  } else {}
                  // ignore: empty_catches
                } catch (e) {}
              },
              icon: const Icon(
                Icons.check,
                color: AppColor.greyColour,
                size: 25,
              )),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.blackColour,
              size: 25,
            )),
        widget: Consumer2<AppFormProvider, ApiServiceProvider>(
            builder: (context, _providerAppForm, _providerApiServices, child) {
          return FutureBuilder(
            future:
                Provider.of<ApiServiceProvider>(context).getUserProfileData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.symmetric(vertical: _screenheight * 0.03),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _screenwidth * 0.034),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(),
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                  radius: 37.5,
                                  backgroundImage: backgroundImage,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.camera_enhance_sharp,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ImagePickerClass(
                                              onPressedCamera: () async {
                                                File? x;
                                                x = await PickerMehthod()
                                                    .imageFromCamera(context);
                                                setState(() {
                                                  backgroundImage =
                                                      FileImage(x!);
                                                });

                                                Navigator.pop(context);
                                              },
                                              onPressedGallery: () async {
                                                File? x;
                                                x = await PickerMehthod()
                                                    .imageFromGallery(context);
                                                setState(() {
                                                  backgroundImage =
                                                      FileImage(x!);
                                                });

                                                Navigator.pop(context);
                                              },
                                            );
                                          });
                                    },
                                  )),
                            ),
                            SizedBox(height: _screenheight * 0.0526),
                            Text(AppStrings.details,
                                style: AppTextStyle.editProfileStyle),
                            SizedBox(height: _screenheight * 0.0315),
                            TextFormFieldClass(
                                enable: true,
                                labelName: AppStrings.name,
                                controller: _nameController,
                                obscureText: false,
                                validator: AppValidator().isEmailValidator),
                            SizedBox(
                              height: _screenheight * 0.03,
                            ),
                            Text(
                              AppStrings.status,
                              style: AppTextStyle.editProfileStyle
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: _screenheight * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RadioWidgetClass(
                                    onChanged: (value) {
                                      _providerAppForm
                                          .changevalue(value.toString());

                                      // _provider1.storeSocValue(_provider1
                                      //     .changevalue(value.toString()));
                                    },
                                    width: _screenwidth * 0.021,
                                    value: AppStrings.acceptingPatients),
                                SizedBox(
                                  width: _screenwidth * 0.102,
                                ),
                                RadioWidgetClass(
                                    onChanged: (value) {
                                      _providerAppForm
                                          .changevalue(value.toString());

                                      // _provider1.storeSocValue(_provider1
                                      //     .changevalue(value.toString()));
                                    },
                                    width: _screenwidth * 0.021,
                                    value: AppStrings.notAccepting)
                              ],
                            ),
                            SizedBox(
                              height: _screenheight * 0.0364,
                            ),
                            PhoneNumber(
                                name: AppStrings.phoneNumber,
                                controller: _phoneNumberController),
                            SizedBox(
                              height: _screenheight * 0.05,
                            ),
                            TextFormFieldClass(
                                enable: true,
                                labelName: AppStrings.about,
                                controller: _aboutController,
                                obscureText: false,
                                validator: AppValidator().isEmailValidator),
                            SizedBox(
                              height: _screenheight * 0.019,
                            )
                          ]),
                    ),
                    Container(
                      height: _screenheight * 0.015,
                      color: AppColor.veryLightPink,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13.5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: _screenheight * 0.02),
                            Text(AppStrings.email),
                            SizedBox(height: _screenheight * 0.013),
                            Text(
                              emailValue!,
                              style: AppTextStyle.emailTextStyle,
                            ),
                          ]),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        }),
      ),
    );
  }
}
