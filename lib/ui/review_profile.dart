import 'package:flutter/material.dart';

import 'package:health_group/model/build_model.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_constants.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReviewProfile extends StatefulWidget {
  BuildDataModel dataItem;
 ReviewProfile({required this.dataItem, Key? key}) : super(key: key);

  @override
  State<ReviewProfile> createState() => _ReviewProfileState();
}

enum ButtonState { intialStage, loading, completed }

class _ReviewProfileState extends State<ReviewProfile> {
  late final TextEditingController _firstNameController;

  late final TextEditingController _lastNameController;

  late final TextEditingController _designationController;

  late final TextEditingController _departmentController;

  late final TextEditingController _mobNoController;

  final SharedPreferenceClass _localStorage = SharedPreferenceClass();
 
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _firstNameController.text = widget.dataItem.firstName!;
    _lastNameController = TextEditingController();
    _lastNameController.text = widget.dataItem.lastName!;
    _designationController = TextEditingController();
    _designationController.text = widget.dataItem.designation!;
    _departmentController = TextEditingController();
    _departmentController.text = widget.dataItem.department!;
    _mobNoController = TextEditingController();
    _mobNoController.text = widget.dataItem.mobileNumber!;
   
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _designationController.dispose();
    _departmentController.dispose();
    _mobNoController.dispose();

    super.dispose();
  }

  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {

    final isInit = indicator || state == ButtonState.intialStage;
    final isDone = state == ButtonState.completed;

    
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onDoubleTap: () { return;},
      child: Scaffold(
        body: Consumer2<AppFormProvider, ApiServiceProvider>(
          builder: (context, _providerAppForm, _providerAppService, child) {
            return ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: _screenheight * 0.02,
                  vertical: _screenheight * 0.091),
              children: [
                Image.asset(
                  AppAssetImagesFile.logo,
                  height: _screenheight * 0.093,
                  width: _screenwidth * 0.18,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: _screenheight * 0.025,
                ),
                Text(AppStrings.reviewProfile, style: AppTextStyle.appheadings),
                SizedBox(height: _screenheight * 0.075),
                TextFormFieldClass(
                    labelName: AppStrings.firstNamerequired,
                    controller: _firstNameController,
                    obscureText: false,
                    enable: false,
                    validator: AppValidator().isEmailValidator),
                SizedBox(height: _screenheight * 0.044),
                TextFormFieldClass(
                    labelName: AppStrings.lastnamerequired,
                    controller: _lastNameController,
                    obscureText: false,
                    enable: false,
                    validator: AppValidator().isEmailValidator),
                SizedBox(height: _screenheight * 0.044),
                TextFormFieldClass(
                  labelName: AppStrings.designation,
                  controller: _designationController,
                  obscureText: false,
                  validator: AppValidator().isEmailValidator,
                  enable: false,
                ),
                SizedBox(height: _screenheight * 0.044),
                TextFormFieldClass(
                  labelName: AppStrings.department,
                  controller: _departmentController,
                  obscureText: false,
                  validator: AppValidator().isEmailValidator,
                  enable: false,
                ),
                SizedBox(height: _screenheight * 0.044),
                TextFormFieldClass(
                  enable: false,
                  labelName: AppStrings.mobileNumber,
                  controller: _mobNoController,
                  obscureText: false,
                ),
                SizedBox(height: _screenheight * 0.08),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: _screenheight * 0.025),
                  child: AppButtonClass(
                      buttonColorString: AppColor.whiteColour,
                      indicator: true,
                      width: AppConstants.widthLongButton,
                      height: AppConstants.heightLongButton,
                      buttonColour: AppColor.buttonEnableColour,
                      buttonString: AppStrings.next,
                      isInit: isInit,
                      isDone: isDone,
                      onPressed: () async {
                      
                        setState(() {
                          state = ButtonState.loading;
                        });

                        BuildDataModel _data = BuildDataModel(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          mobileNumber: [
                            _mobNoController.text,
                          ].join(),
                          department: _departmentController.text,
                          designation: _designationController.text,
                          countryCode: _providerAppForm.countryCode,
                        );
                        try {
                          var _apiData = await _providerAppService.editProfile(
                              context, _data);

                          if (200 <= _apiData![AppStrings.statusCode] &&
                              _apiData[AppStrings.statusCode] <= 300) {
                            setState(() {
                              state = ButtonState.completed;
                            });
                            _localStorage.setScreen(
                                Routing.reviewProfileRoute, true);
                            Navigator.pushNamed(context, Routing.pinLock);
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
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
