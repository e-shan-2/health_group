import 'package:flutter/material.dart';

import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_color.dart';

import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

enum ButtonState { intialStage, loading, completed }

class _ResetPasswordState extends State<ResetPassword> {
  late final TextEditingController _newPasswordController;

  late final TextEditingController _confirmPasswordController;

  late final TextEditingController _otpController;
  late final GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _controller;
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();
  final Bool _text1 = Bool(true);
  final Bool _text2 = Bool(true);
  final Bool _colour = Bool(false);
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    _confirmPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _otpController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _controller = [
      _otpController,
      _confirmPasswordController,
      _newPasswordController
    ];
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColour,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColor.whiteColour),
      body: Consumer2<AppFormProvider, ApiServiceProvider>(
        builder: (context, _providerAppForm, _providerApi, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: _formKey,
              onChanged: () {
                _colour.value = _providerAppForm.onchanging(_controller);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ListView(
                  children: [
                    SizedBox(height: _screenheight * 0.03),
                    Text(
                      AppStrings.resetPassword,
                      style: AppTextStyle.appheadings,
                    ),
                    SizedBox(height: _screenheight * 0.021),
                    Text(
                      AppStrings.pleaseEnterPasswordResetPassword,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: _screenheight * 0.063),
                    TextFormFieldClass(
                      onSubmitted: (_) {
                        FocusScope.of(context).nextFocus();
                      },
                      enable: true,
                      validator: AppValidator().isPassWordValidator,
                      labelName: AppStrings.newpassword,
                      controller: _confirmPasswordController,
                      obscureText: _text1.value,
                      icon: IconButton(
                          onPressed: () {
                            // _text1 =
                            _providerAppForm.ontoggle(_text1);
                          },
                          icon: Icon(
                            _text1.value
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
                      enable: true,
                      validator: AppValidator().isPassWordValidator,
                      labelName: AppStrings.confirmPassword,
                      controller: _newPasswordController,
                      obscureText: _text2.value,
                      icon: IconButton(
                          onPressed: () {
                            // _text2 =
                            _providerAppForm.ontoggle(_text2);
                          },
                          icon: Icon(
                            _text2.value
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: AppColor.buttonEnableColour,
                          )),
                    ),
                    SizedBox(
                      height: _screenheight * 0.06,
                    ),
                    TextFormFieldClass(
                      enable: true,
                      labelName: AppStrings.otp,
                      controller: _otpController,
                      obscureText: false,
                    ),
                    SizedBox(height: _screenheight * 0.12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: AppButtonClass(
                          buttonColorString: AppColor.whiteColour,
                          indicator: true,
                          isDone: isDone,
                          isInit: isInit,
                           width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                          buttonColour: _colour.value
                              ? AppColor.buttonEnableColour
                              : AppColor.buttonDisableColour,
                          buttonString: AppStrings.submitString,
                          onPressed: () async {
                            setState(() {
                              state = ButtonState.loading;
                            });

                            if (_formKey.currentState!.validate()) {
                              String? _data = await _localStorage.getToken();
                              Map<String, dynamic>? response;
                              try {
                                response = await _providerApi
                                    .patchForgotPasswordVerify(
                                  context,
                                  _data,
                                  _newPasswordController.text,
                                  _confirmPasswordController.text,
                                  _otpController.text,
                                );
                                if (200 <= response![AppStrings.statusCode] &&
                                    response[AppStrings.statusCode] <= 300) {
                                  _localStorage.setScreen(
                                      Routing.resetPasswordRoute, true);
                                  setState(() {
                                    state = ButtonState.completed;
                                  });

                                  Navigator.pushReplacementNamed(
                                      context, Routing.loginPageRoute);
                                  setState(() {
                                    state = ButtonState.intialStage;
                                  });
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
                            }
                            setState(() {
                              state = ButtonState.intialStage;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
