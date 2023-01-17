import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_group/model/add_patient.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_constants.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/image_picker_alert_dialog.dart';
import 'package:health_group/widget/image_picker_methods.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/phone_number.dart';
import 'package:health_group/widget/radio.dart';
import 'package:health_group/widget/textformfield_widget.dart';

import 'package:provider/provider.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}

enum ButtonState { intialStage, loading, completed }

class _AddPatientState extends State<AddPatient> {
  late TextEditingController _patientFirstNameController;
  late TextEditingController _patientLastNameController;
  late TextEditingController _patientDobController;
  late TextEditingController _patientPhoneNumberController;
  late TextEditingController _patientemailAddressController;
  late TextEditingController _patientaboutController;
  late TextEditingController _patientAddressController;
  late TextEditingController _patientCountryController;
  late TextEditingController _patientStateController;
  late TextEditingController _patientZipCodeController;
  late TextEditingController _patientCityController;
  late TextEditingController _patientCountryCodeController;
  late TextEditingController _physicianNameController;
  late TextEditingController _physicianCountryCodeController;
  late TextEditingController _physicianPhoneNumberController;
  late TextEditingController _caregiverNameController;
  late TextEditingController _caregiverCountryCodeController;
  late TextEditingController _caregiverPhoneNumberController;
  late TextEditingController _pharmacyNameController;
  late TextEditingController _pharmacyCountryCodeController;
  late TextEditingController _pharmacyPhoneNumberController;
  ButtonState state = ButtonState.intialStage;
  bool indicator = false;
  String? uploadedMedia;
  ImageProvider<Object> profileImage =
      const NetworkImage("https://picsum.photos/200/300/?blur");

  @override
  void initState() {
    super.initState();
    _patientFirstNameController = TextEditingController();
    _patientLastNameController = TextEditingController();
    _patientDobController = TextEditingController();
    _patientPhoneNumberController = TextEditingController();
    _patientemailAddressController = TextEditingController();
    _patientaboutController = TextEditingController();
    _patientAddressController = TextEditingController();
    _patientCountryController = TextEditingController();
    _patientStateController = TextEditingController();
    _patientZipCodeController = TextEditingController();
    _patientCityController = TextEditingController();
    _physicianNameController = TextEditingController();
    _physicianPhoneNumberController = TextEditingController();
    _caregiverNameController = TextEditingController();
    _caregiverPhoneNumberController = TextEditingController();
    _pharmacyNameController = TextEditingController();
    _pharmacyPhoneNumberController = TextEditingController();
    _patientCityController = TextEditingController();
    _patientCountryCodeController = TextEditingController();
    _physicianCountryCodeController = TextEditingController();
    _caregiverCountryCodeController = TextEditingController();
    _pharmacyCountryCodeController = TextEditingController();
    _patientLastNameController = TextEditingController();
  }

  @override
      void dispose() {
        _patientFirstNameController.dispose();
        _patientLastNameController.dispose();
        _patientDobController.dispose();
        _patientPhoneNumberController.dispose();
        _patientemailAddressController.dispose();
        _patientaboutController.dispose();
        _patientAddressController.dispose();
        _patientCountryController.dispose();
        _patientStateController.dispose();
        _patientZipCodeController.dispose();
        _patientCityController.dispose();
        _physicianNameController.dispose();
        _physicianPhoneNumberController.dispose();
        _caregiverNameController.dispose();
        _caregiverPhoneNumberController.dispose();
        _pharmacyNameController.dispose();
        _pharmacyPhoneNumberController.dispose();
        _patientCityController.dispose();
        _patientCountryCodeController.dispose();
        _physicianCountryCodeController.dispose();
        _caregiverCountryCodeController.dispose();
        _pharmacyCountryCodeController.dispose();
        _patientLastNameController.dispose();
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
    

      AppFormProvider _providerAppForm = Provider.of(context, listen: false);
      _providerAppForm.changevalue(AppStrings.sn.toString());
    });
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AppBarClass(
          appBarString: AppStrings.addPatientAppBar,
          leading: IconButton(
            icon: Image.asset(
              AppAssetImagesFile.backbutton,
              height: _screenheight * 0.025,
              width: _screenwidth * 0.031,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          widget: Consumer2<AppFormProvider, ApiServiceProvider>(
            builder: (context, _providerAppForm, _providerApiService, child) {
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13.5),
                    child: Column(children: [
                      SizedBox(
                        height: _screenheight * 0.03,
                      ),
                      CircleAvatar(
                        radius: 37.5,
                        backgroundImage: profileImage,
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
                                      File? x = await PickerMehthod()
                                          .imageFromCamera(context);

                                      setState(() {
                                        profileImage = FileImage(x!);
                                      });

                                      Navigator.pop(context);
                                    },
                                    onPressedGallery: () async {
                                      File? x = await PickerMehthod()
                                          .imageFromGallery(context);

                                      setState(() {
                                        profileImage = FileImage(x!);
                                      });

                                      Navigator.pop(context);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      TextFormFieldClass(
                          enable: true,
                          labelName: AppStrings.patientFirstName,
                          controller: _patientFirstNameController,
                          obscureText: false),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      TextFormFieldClass(
                          enable: true,
                          labelName: AppStrings.patientLastName,
                          controller: _patientLastNameController,
                          obscureText: false),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      TextFormFieldClass(
                          enable: true,
                          labelName: AppStrings.patientDob,
                          controller: _patientDobController,
                          obscureText: false,
                          icon: const Icon(
                            Icons.calendar_today,
                            color: AppColor.buttonEnableColour,
                          )),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      TextFormFieldClass(
                          enable: true,
                          labelName: AppStrings.emailAddressTextFormField,
                          controller: _patientemailAddressController,
                          obscureText: false),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      TextFormFieldClass(
                          enable: true,
                          labelName: AppStrings.about,
                          controller: _patientaboutController,
                          obscureText: false),
                      SizedBox(
                        height: _screenheight * 0.05,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(AppStrings.whoWillDoSoc,
                            style: AppTextStyle.whoWillDoSocTextStyle),
                      ),
                      SizedBox(
                        height: _screenheight * 0.02,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RadioWidgetClass(
                              onChanged: (value) {
                                _providerAppForm.changevalue(value.toString());

                                // _provider1.storeSocValue(
                                //     _provider1.changevalue(value.toString()));
                              },
                              width: _screenwidth * 0.0258,
                              value: AppStrings.sn),
                          SizedBox(
                            width: _screenwidth * 0.103,
                          ),
                          RadioWidgetClass(
                              onChanged: (value) {
                                _providerAppForm.changevalue(value.toString());

                                // _provider1.storeSocValue(
                                //     _provider1.changevalue(value.toString()));
                              },
                              width: _screenwidth * 0.0258,
                              value: AppStrings.pt),
                          SizedBox(
                            width: _screenwidth * 0.103,
                          ),
                          RadioWidgetClass(
                              onChanged: (value) {
                                _providerAppForm.changevalue(value.toString());

                                // _provider1.storeSocValue(
                                //     _provider1.changevalue(value.toString()));
                              },
                              width: _screenwidth * 0.0258,
                              value: AppStrings.slp),
                          SizedBox(
                            width: _screenwidth * 0.103,
                          ),
                          RadioWidgetClass(
                              onChanged: (value) {
                                _providerAppForm.changevalue(value.toString());

                                // _provider1.storeSocValue(
                                //     _provider1.changevalue(value.toString()));
                              },
                              width: _screenwidth * 0.0258,
                              value: AppStrings.slp),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
                  ),
                  Container(
                      height: _screenheight * 0.015,
                      decoration:
                          const BoxDecoration(color: AppColor.veryLightPink)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _screenheight * 0.02,
                          ),
                          Text(
                            AppStrings.patientInfo,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: _screenheight * 0.0254,
                          ),
                          PhoneNumber(
                            onInt: (code) {
                              _patientCountryCodeController.text =
                                  _providerAppForm
                                      .countryCodeValue(code.toString())!;
                            },
                            onChanged: (code) {
                              _patientCountryCodeController.text =
                                  _providerAppForm
                                      .countryCodeValue(code.toString())!;
                            },
                            name: AppStrings.phoneNumber,
                            controller: _patientPhoneNumberController,
                          ),
                          SizedBox(
                            height: _screenheight * 0.03,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.patientAddress,
                              controller: _patientAddressController,
                              icon: IconButton(
                                icon: const Icon(
                                  Icons.location_pin,
                                  color: AppColor.buttonEnableColour,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routing.googleMap);
                                },
                              ),
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.country,
                              controller: _patientCountryController,
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.state,
                              controller: _patientStateController,
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormFieldClass(
                                    enable: true,
                                    labelName: AppStrings.zipCode,
                                    controller: _patientZipCodeController,
                                    obscureText: false),
                              ),
                              SizedBox(
                                width: _screenwidth * 0.051,
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormFieldClass(
                                    enable: true,
                                    labelName: AppStrings.city,
                                    controller: _patientCityController,
                                    obscureText: false),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.physicianName,
                              controller: _physicianNameController,
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          PhoneNumber(
                              onInt: (code) {
                                _physicianCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              onChanged: (code) {
                                _physicianCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              name: AppStrings.physicianNumber,
                              controller: _physicianPhoneNumberController),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.caregiverName,
                              controller: _caregiverNameController,
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          PhoneNumber(
                              onInt: (code) {
                                _caregiverCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              onChanged: (code) {
                                _caregiverCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              name: AppStrings.caregiverNumber,
                              controller: _caregiverPhoneNumberController),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          TextFormFieldClass(
                              enable: true,
                              labelName: AppStrings.pharmacyName,
                              controller: _pharmacyNameController,
                              obscureText: false),
                          SizedBox(
                            height: _screenheight * 0.05,
                          ),
                          PhoneNumber(
                              onInt: (code) {
                                _pharmacyCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              onChanged: (code) {
                                _pharmacyCountryCodeController.text =
                                    _providerAppForm
                                        .countryCodeValue(code.toString())!;
                              },
                              name: AppStrings.pharmacyNumber,
                              controller: _pharmacyPhoneNumberController)
                        ]),
                  ),
                  Container(
                      height: _screenheight * 0.015,
                      decoration:
                          const BoxDecoration(color: AppColor.veryLightPink)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13.5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _screenheight * 0.02,
                          ),
                          Text(
                            AppStrings.attachMediaDocuments,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: _screenheight * 0.02,
                          ),
                          Text(
                            AppStrings.tapToAddMediaDocuments,
                          ),
                          SizedBox(
                            height: _screenheight * 0.03,
                          ),
                          Container(
                            width: _screenwidth * 0.191,
                            height: _screenheight * 0.094,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: AppColor.buttonEnableColour),
                            child: Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: () async {
                                  uploadedMedia =
                                      await PickerMehthod().pickFile();
                                },
                                icon: Image.asset(
                                  AppAssetImagesFile.addMediaDocuments,
                                  height: _screenheight * 0.05,
                                  width: _screenwidth * 0.103,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _screenheight * 0.081,
                          ),
                          Center(
                            child: AppButtonClass(
                                buttonColorString: AppColor.whiteColour,
                                width: AppConstants.widthLongButton,
                                height: AppConstants.heightLongButton,
                                buttonColour: AppColor.buttonEnableColour,
                                buttonString: AppStrings.addPatient,
                                onPressed: () async {
                                  setState(() {
                                    state = ButtonState.loading;
                                  });
                                  // String? data = Provider.of<AppFormProvider>(
                                  //         context,
                                  //         listen: false)
                                  //     .picUrl;
                                  String? data = Provider.of<AppFormProvider>(
                                          context,
                                          listen: false)
                                      .randomData;
                                  AddPatientDataModel _dataModel = AddPatientDataModel(
                                      profilePicUrl: data,
                                      url: uploadedMedia,
                                      patientFirstName:
                                          _patientFirstNameController.text,
                                      patientLastName:
                                          _patientLastNameController.text,
                                      patientDOB: _patientDobController.text,
                                      patientEmail:
                                          _patientemailAddressController.text,
                                      patientAbout:
                                          _patientaboutController.text,
                                      patientPhnNumber:
                                          _patientPhoneNumberController.text,
                                      patientCountryCode:
                                          _patientCountryCodeController.text,
                                      patientAddress:
                                          _patientAddressController.text,
                                      patientCountry:
                                          _patientCountryController.text,
                                      patientState:
                                          _patientStateController.text,
                                      zipCode: _patientZipCodeController.text,
                                      city: _patientCityController.text,
                                      physicianName:
                                          _physicianNameController.text,
                                      physicianCountryCode:
                                          _physicianCountryCodeController.text,
                                      physicianPhnNum:
                                          _pharmacyPhoneNumberController.text,
                                      caregiverName:
                                          _caregiverNameController.text,
                                      caregiverCountryCode:
                                          _caregiverCountryCodeController.text,
                                      caregiverPhoneNumber:
                                          _caregiverPhoneNumberController.text,
                                      pharmacyName:
                                          _pharmacyNameController.text,
                                      pharmacyCountryCode:
                                          _pharmacyCountryCodeController.text,
                                      pharmacyPhnNum:
                                          _pharmacyPhoneNumberController.text,
                                      patientDetailsSOC: AppStrings.sn);
                                  Map<String, dynamic>? response;

                                  try {
                                    response = await _providerApiService
                                        .addPatientProfile(context, _dataModel);
                                    if (response![AppStrings.statusCode] ==
                                        201) {
                                      setState(() {
                                        state = ButtonState.completed;
                                      });
                                      Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        state = ButtonState.intialStage;
                                      });
                                    }
                                  } catch (e) {
                                    setState(() {
                                      state = ButtonState.intialStage;
                                    });
                                  }

                                  setState(() {
                                    state = ButtonState.intialStage;
                                  });
                                },
                                isInit: isInit,
                                isDone: isDone,
                                indicator: true),
                          )
                        ]),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
