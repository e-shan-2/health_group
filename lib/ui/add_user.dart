import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_group/model/add_user.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/image_picker_alert_dialog.dart';
import 'package:health_group/widget/image_picker_methods.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/phone_number.dart';
import 'package:health_group/widget/textformfield_widget.dart';

import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

enum ButtonState { intialStage, loading, completed }

class _AddUserState extends State<AddUser> {
  File? imageFile;
  ImageProvider<Object>? backgroundImage =
      const NetworkImage("https://picsum.photos/200/300/?blur");
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _designationController;
  late final TextEditingController _departmentController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _aboutController;
  late final TextEditingController _codePickerController;
  late final TextEditingController _emailAddressController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _codePickerController = TextEditingController();
    _lastNameController = TextEditingController();
    _designationController = TextEditingController();
    _departmentController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _aboutController = TextEditingController();
    _emailAddressController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   _firstNameController.dispose();
  //   _codePickerController.dispose();
  //   _lastNameController.dispose();
  //   _designationController.dispose();
  //   _departmentController.dispose();
  //   _phoneNumberController.dispose();
  //   _aboutController.dispose();
  //   _emailAddressController.dispose();

  //   super.dispose();
  // }

  final bool _indicator = false;

  ButtonState _state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    bool _isInit = _indicator || _state == ButtonState.intialStage;
    bool _isDone = _state == ButtonState.completed;
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return AppBarClass(
        appBarString: AppStrings.addUserAppBar,
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
            builder: (context, _providerAppForm, _providerApiServices, child) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 13.5, vertical: 24),
            children: [
              SizedBox(
                height: _screenheight * 0.03,
              ),
              CircleAvatar(
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
                                  backgroundImage = FileImage(x!);
                                });
                                Navigator.pop(context);
                              },
                              onPressedGallery: () async {
                                File? x;
                                x = await PickerMehthod()
                                    .imageFromGallery(context);
                                setState(() {
                                  backgroundImage = FileImage(x!);
                                });
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                  )),
              SizedBox(height: _screenheight * 0.0624),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.firstNameNotRequired,
                  controller: _firstNameController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.lastNameNotRequired,
                  controller: _lastNameController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.emailAddressTextFormField,
                  controller: _emailAddressController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              PhoneNumber(
                  onInt: (code) {
                    _codePickerController.text =
                        _providerAppForm.countryCodeValue(code.toString())!;
                  },
                  onChanged: (code) {
                    _codePickerController.text =
                        _providerAppForm.countryCodeValue(code.toString())!;
                  },
                  name: AppStrings.phoneNumber,
                  controller: _phoneNumberController),
              SizedBox(
                height: _screenheight * 0.05,
              ),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.department,
                  controller: _departmentController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.designation,
                  controller: _designationController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              TextFormFieldClass(
                  enable: true,
                  labelName: AppStrings.about,
                  controller: _aboutController,
                  obscureText: false),
              SizedBox(height: _screenheight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.088),
                child: AppButtonClass(
                    buttonColorString: AppColor.whiteColour,
                    width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                    buttonColour: AppColor.buttonEnableColour,
                    buttonString: AppStrings.addUser,
                    isInit: _isInit,
                    isDone: _isDone,
                    onPressed: () async {
                      setState(() {
                        _state = ButtonState.loading;
                      });
                      String? data =
                          Provider.of<AppFormProvider>(context, listen: false)
                              .picUrl;

                      AddUserDataModel _dataModel = AddUserDataModel(
                        profilePicUrl: data,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailAddressController.text,
                        countryCode: _codePickerController.text,
                        mobileNumber: _phoneNumberController.text,
                        department: _departmentController.text,
                        designation: _designationController.text,
                        about: _aboutController.text,
                      );

                      try {
                        var response = await _providerApiServices
                            .addUserProfile(context, _dataModel);
                        if (200 <= response![AppStrings.statusCode] &&
                            response[AppStrings.statusCode] <= 300) {
                          setState(() {
                            _state = ButtonState.completed;
                          });
                          Navigator.pop(context);
                        } else {
                          setState(() {
                            _state = ButtonState.intialStage;
                          });
                        }
                      } catch (e) {
                        setState(() {
                          _state = ButtonState.intialStage;
                        });
                      }
                      setState(() {
                        _state = ButtonState.intialStage;
                      });
                    },
                    indicator: true),
              )
            ],
          );
        }));
  }
}
