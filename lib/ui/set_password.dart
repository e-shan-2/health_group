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

class SetPassword extends StatefulWidget {
  const SetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

enum ButtonState { intialStage, loading, completed }

class _SetPasswordState extends State<SetPassword> {
  late final TextEditingController _newPassword;
  late final TextEditingController _confirmPassword;
  late final GlobalKey<FormState> _formkey;
  late final List<TextEditingController> _controller;

  final Bool _color = Bool(false);
  bool indicator = false;
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();

  @override
  void initState() {
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    _formkey = GlobalKey<FormState>();
    _controller = [_newPassword, _confirmPassword];

    super.initState();
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _confirmPassword.dispose();

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
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Consumer2<AppFormProvider, ApiServiceProvider>(
          builder: (context, _providerAppForm, _providerApi, child) {
            return Form(
              key: _formkey,
                       autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                _color.value = _providerAppForm.onchanging(
                  _controller,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: _screenheight * 0.024,
                    right: _screenheight * 0.024,
                    top: _screenheight * 0.175),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Text(
                      AppStrings.setPassword,
                      style: AppTextStyle.appheadings.copyWith(fontSize: 25),
                    ),
                    SizedBox(height: _screenheight * 0.019),
                    Text(AppStrings.pleaseEnterPasswordResetPassword),
                    SizedBox(height: _screenheight * 0.113),
                    TextFormFieldClass(
                        enable: true,
                        labelName: AppStrings.newpassword,
                        controller: _newPassword,
                        obscureText: false,
                        validator: AppValidator().isPassWordValidator),
                    SizedBox(height: _screenheight * 0.05),
                    TextFormFieldClass(
                        enable: true,
                        labelName: AppStrings.confirmPassword,
                        controller: _confirmPassword,
                        obscureText: false,
                        onSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        validator: AppValidator().isPassWordValidator),
                    SizedBox(height: _screenheight * 0.18),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 27.5),
                      child: AppButtonClass(
                          buttonColorString: AppColor.whiteColour,
                          indicator: true,
                          isDone: isDone,
                          isInit: isInit,
                           width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                          buttonColour: _color.value
                              ? AppColor.buttonEnableColour
                              : AppColor.buttonDisableColour,
                          buttonString: AppStrings.submitString,
                          onPressed: () async {
                          
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                state = ButtonState.loading;
                              });

                              try {
                                var response =
                                    await _providerApi.patchDataRequest(
                                        context,
                                        _newPassword.text,
                                        _confirmPassword.text);
                                if (200 <= response![AppStrings.statusCode] &&
                                    response[AppStrings.statusCode] <= 300) {
                                  setState(() {
                                    state = ButtonState.completed;
                                  });
                                  _localStorage.setpassword(
                                      AppStrings.passwordSmallCase,
                                      _newPassword.text);
                                  Navigator.pushNamed(
                                    context,
                                    Routing.buildProfileRoute,
                                  );
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
                              _confirmPassword.clear();
                              _newPassword.clear();
                              setState(() {
                                state = ButtonState.intialStage;
                              });
                            }
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
