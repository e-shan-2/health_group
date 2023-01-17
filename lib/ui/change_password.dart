import 'package:flutter/material.dart';
import 'package:health_group/model/change_password.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class Bool {
  bool value;
  Bool(this.value);
}

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

enum ButtonState { intialStage, loading, completed }

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  late final GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _controller;

  final Bool _oldPasswordText = Bool(true);
  final Bool _newPasswordText = Bool(true);
  final Bool _confirmPasswordText = Bool(true);

  final Bool _colour = Bool(false);
  bool indicator = false;
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();
  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _controller = [
      _oldPasswordController,
      _newPasswordController,
      _confirmPasswordController
    ];
  }

  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;

    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;

    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;
    return AppBarClass(
      appBarString: AppStrings.changePassword,
      leading: IconButton(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppAssetImagesFile.backbutton,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      widget: Consumer2<AppFormProvider, ApiServiceProvider>(
          builder: (context, _providerAppForm, _providerApiServices, child) {
        return Form(
          key: _formKey,
          onChanged: () {
            _colour.value = _providerAppForm.onchanging(_controller);
          },
          child: ListView(
              padding: EdgeInsets.only(
                  left: 14.5, right: 12.5, top: _screenheight * 0.06),
              children: [
                TextFormFieldClass(
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                  enable: true,
                  labelName: AppStrings.oldPassword,
                  controller: _oldPasswordController,
                  obscureText: _oldPasswordText.value,
                  validator: AppValidator().isPassWordValidator,
                  icon: IconButton(
                      onPressed: () {
                        //  _oldPasswordText =
                        _providerAppForm.ontoggle(_oldPasswordText);
                      },
                      icon: Icon(
                        _oldPasswordText.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColor.buttonEnableColour,
                      )),
                ),
                SizedBox(
                  height: _screenheight * 0.06,
                ),
                TextFormFieldClass(
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: AppValidator().isPassWordValidator,
                  enable: true,
                  labelName: AppStrings.newpassword,
                  controller: _newPasswordController,
                  obscureText: _newPasswordText.value,
                  icon: IconButton(
                      onPressed: () {
                        //  _newPasswordText =
                        _providerAppForm.ontoggle(_newPasswordText);
                      },
                      icon: Icon(
                        _newPasswordText.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColor.buttonEnableColour,
                      )),
                ),
                SizedBox(
                  height: _screenheight * 0.06,
                ),
                TextFormFieldClass(
                  onSubmitted: (_) {
                    FocusScope.of(context).nextFocus();
                  },
                  validator: AppValidator().isPassWordValidator,
                  enable: true,
                  labelName: AppStrings.confirmPassword,
                  controller: _confirmPasswordController,
                  obscureText: _confirmPasswordText.value,
                  icon: IconButton(
                      onPressed: () {
                        //  _confirmPasswordText =
                        _providerAppForm.ontoggle(_confirmPasswordText);
                      },
                      icon: Icon(
                        _confirmPasswordText.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColor.buttonEnableColour,
                      )),
                ),
                SizedBox(
                  height: _screenheight * 0.065,
                ),
                Center(
                  child: AppButtonClass(
                      isDone: isDone,
                      isInit: isInit,
                      buttonColorString: AppColor.whiteColour,
                      width: _screenwidth * 0.748,
                      height: _screenheight * 0.065,
                      buttonColour: _colour.value
                          ? AppColor.buttonEnableColour
                          : AppColor.buttonDisableColour,
                      buttonString: AppStrings.save,
                      onPressed: () async {
                        setState(() {
                          state = ButtonState.loading;
                        });

                        if (_formKey.currentState!.validate()) {
                          ChangePasswordDataModel _dataModel =
                              ChangePasswordDataModel(
                            oldPassword: _oldPasswordController.text,
                            newPassword: _newPasswordController.text,
                            confirmPassword: _confirmPasswordController.text,
                          );

                          Map<String, dynamic>? response;

                          try {
                            response = await _providerApiServices
                                .changePasswordSettingScereen(
                                    context, _dataModel);
                            if (200 <= response![AppStrings.statusCode] &&
                                response[AppStrings.statusCode] <= 300) {
                              _localStorage.setpassword(
                                  AppStrings.passwordSmallCase,
                                  _confirmPasswordController.text);
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
                        } else {
                          setState(() {
                            state = ButtonState.intialStage;
                          });
                        }
                        setState(() {
                          state = ButtonState.intialStage;
                        });
                      },
                      indicator: true),
                )
              ]),
        );
      }),
    );
  }
}
