import 'package:flutter/material.dart';
import 'package:health_group/model/build_model.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';

import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';

import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/phone_number.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class BuildProfiel extends StatefulWidget {
  const BuildProfiel({Key? key}) : super(key: key);

  @override
  State<BuildProfiel> createState() => _BuildProfielState();
}

enum ButtonState { intialStage, loading, completed }

class _BuildProfielState extends State<BuildProfiel> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _designationController;
  late final TextEditingController _departmentController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _codePickerController;
  late final GlobalKey<FormState> _formKey;
  bool indicator = false;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _codePickerController = TextEditingController();
    _lastNameController = TextEditingController();
    _designationController = TextEditingController();
    _designationController.text =
        Provider.of<AppFormProvider>(context, listen: false).departmentName![0];

    _departmentController = TextEditingController();
    _departmentController.text =
        Provider.of<AppFormProvider>(context, listen: false).departmentName![1];

    _phoneNumberController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _designationController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  ButtonState state = ButtonState.intialStage;

  @override
  Widget build(BuildContext context) {
     double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColour,
        appBar: AppBar(
            backgroundColor: AppColor.whiteColour,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.blackColour,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Consumer2<AppFormProvider, ApiServiceProvider>(
          builder: (context, _providerAppForm, _providerApi, child) {
            return Form(
              key: _formKey,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: _screenheight * 0.0267,
                    vertical: _screenheight * 0.0346),
                children: [
                  Image.asset(
                    AppAssetImagesFile.heartLogo,
                    height: _screenheight * 0.0749,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: _screenheight * 0.0267),
                  Text(
                    AppStrings.buildProfile,
                    style: AppTextStyle.appheadings,
                  ),
                  SizedBox(height: _screenheight * 0.038),
                  TextFormFieldClass(
                    enable: true,
                    labelName: AppStrings.firstNamerequired,
                    controller: _firstNameController,
                    obscureText: false,
                    validator: AppValidator().isNameValidator,
                  ),
                  SizedBox(height: _screenheight * 0.0437),
                  TextFormFieldClass(
                    onSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                    enable: true,
                    validator: AppValidator().isNameValidator,
                    labelName: AppStrings.lastnamerequired,
                    controller: _lastNameController,
                    obscureText: false,
                  ),
                  SizedBox(height: _screenheight * 0.038),
                  TextFormFieldClass(
                    buildProfile: true,
                    labelName: '',
                    controller: _designationController,
                    obscureText: false,
                    enable: false,
                    border: const UnderlineInputBorder(),
                  ),
                  SizedBox(height: _screenheight * 0.0437),
                  TextFormFieldClass(
                    onSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                    buildProfile: true,
                    labelName: '',
                    controller: _departmentController,
                    obscureText: false,
                    enable: false,
                    border: const UnderlineInputBorder(),
                  ),
                  SizedBox(height: _screenheight * 0.05),
                  PhoneNumber(
                      divider: false,
                      onInt: (code) {
                        _codePickerController.text =
                            _providerAppForm.countryCodeValue(code.toString())!;
                      },
                      onChanged: (code) {
                        _codePickerController.text =
                            _providerAppForm.countryCodeValue(code.toString())!;
                      },
                      name: "",
                      controller: _phoneNumberController),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _screenheight * 0.0630,
                        left: _screenheight * 0.022,
                        right: _screenheight * 0.022),
                    child: AppButtonClass(
                        buttonColorString: AppColor.whiteColour,
                        isDone: isDone,
                        isInit: isInit,
                        indicator: true,
                           width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                        buttonColour: AppColor.buttonEnableColour,
                        buttonString: AppStrings.create,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              state = ButtonState.loading;
                            });

                            BuildDataModel _data = BuildDataModel(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              mobileNumber: [
                                _providerAppForm.countryCode,
                                "  ",
                                _phoneNumberController.text,
                              ].join(),
                              department: _departmentController.text,
                              designation: _designationController.text,
                              countryCode: _codePickerController.text,
                            );

                            setState(() {
                              state = ButtonState.completed;
                            });

                            Navigator.pushNamed(
                                context, Routing.reviewProfileRoute,
                                arguments: _data);

                            setState(() {
                              state = ButtonState.intialStage;
                            });
                          }
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
