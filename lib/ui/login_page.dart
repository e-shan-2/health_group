// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_group/model/model.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';

import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum ButtonState { intialStage, loading, completed }

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailControllor;

  late final TextEditingController _passwordController;

  late final GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _controller;

  final SharedPreferenceClass _localStorage = SharedPreferenceClass();

  final Bool _passwordText = Bool(true);

  final Bool _colour = Bool(false);
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    _emailControllor = TextEditingController();
    _passwordController = TextEditingController();

    _formKey = GlobalKey<FormState>();
    _controller = [_emailControllor, _passwordController];
  }

  @override
  void dispose() {
    _emailControllor.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;

    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;

    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Consumer2<AppFormProvider, ApiServiceProvider>(
            builder: ((context, _providerAppForm, _providerApi, child) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              _colour.value = _providerAppForm.onchanging(_controller);
            },
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: 13.5, right: 13.5, top: 83),
              children: [
                Image.asset(
                  AppAssetImagesFile.logo,
                  alignment: Alignment.topLeft,
                  height: _screenheight * 0.102,
                  // height: 83.5,
                  // width: 70,
                ),
                SizedBox(
                  height: _screenheight * 0.0112,
                ),
                Text(AppStrings.welocome,
                    style: AppTextStyle.appheadings.copyWith(fontSize: 24),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: _screenheight * 0.022,
                ),
                Text(
                  AppStrings.loginToStreamLineCollaboration,
                  style: AppTextStyle.appSubHeading,
                ),
                SizedBox(
                  height: _screenheight * 0.046,
                ),
                TextFormFieldClass(
                    enable: true,
                    validator: AppValidator().isEmailValidator,
                    obscureText: false,
                    labelName: AppStrings.emailAddressTextFormField,
                    controller: _emailControllor),
                SizedBox(
                  height: _screenheight * 0.046,
                ),
                TextFormFieldClass(
                  enable: true,
                  validator: AppValidator().isPassWordValidator,
                  obscureText: _passwordText.value,
                  labelName: AppStrings.passwordTextFormField,
                  controller: _passwordController,
                  icon: IconButton(
                      onPressed: () {
                        _providerAppForm.ontoggle(_passwordText);
                      },
                      icon: Icon(
                        _passwordText.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: AppColor.buttonEnableColour,
                      )),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    //  Navigator.pushNamed(
                    //   context, Routing.setPasswordRoute,
                    //   arguments: data);
                  },
                ),
                SizedBox(height: _screenheight * 0.022),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routing.forgotPasswordRoute);
                      },
                      child: Text(AppStrings.forgotPassword,
                          style: AppTextStyle.loginScreenForgotPassword),
                    )),
                SizedBox(
                  height: _screenheight * 0.11,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppButtonClass(
                    buttonColorString: AppColor.whiteColour,
                    indicator: true,
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          state = ButtonState.loading;
                        });

                        DataModel _data = DataModel(
                            email: _emailControllor.text,
                            password: _passwordController.text);

                        Map<String, dynamic> view;
                        try {
                          view = (await _providerApi.postDataRequest(
                              context, _data))!;

                          if (view[AppStrings.statusCode] == 200) {
                            if (view[AppStrings.data]
                                [AppStrings.setBuildProfile]) {
                              _localStorage.setScreen(
                                  Routing.reviewProfileRoute, true);
                              _localStorage.setScreen(
                                  Routing.setPasswordRoute, true);

                              bool? _applock = await _localStorage
                                  .getapplock(AppStrings.appLock);

                              if (_applock == true) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routing.pinLock,
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routing.tabBarRoute,
                                    (Route<dynamic> route) => false);
                              }
                            } else if (view[AppStrings.data]
                                [AppStrings.setPassword2]) {
                              _localStorage.setScreen(
                                  Routing.setPasswordRoute, true);
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routing.buildProfileRoute,
                                  (Route<dynamic> route) => false);
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routing.setPasswordRoute,
                                  (Route<dynamic> route) => false);
                            }

                            _localStorage.setEmail(_emailControllor.text);
                            List<String>? deaprtment =
                                await _localStorage.getdesignationDepartment();

                            // List<String>? value =
                            _providerAppForm.setDepartment(deaprtment!);

                            _localStorage.setEmail(_emailControllor.text);
                            _localStorage.setpassword(
                                AppStrings.passwordSmallCase,
                                _passwordController.text);

                            setState(() {
                              state = ButtonState.completed;
                            });

                            _localStorage.setScreen(
                                Routing.loginPageRoute, true);
                          } else if (400 <= view[AppStrings.statusCode] ||
                              view[AppStrings.statusCode] <= 406) {
                            setState(() {
                              state = ButtonState.intialStage;
                            });
                          }
                        } catch (e) {
                          setState(() {
                            state = ButtonState.intialStage;
                          });
                          print(e);
                        }
                      } else {
                        setState(() {
                          state = ButtonState.intialStage;
                        });
                      }
                    },
                    width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                    buttonColour: _colour.value
                        ? AppColor.buttonEnableColour
                        : AppColor.buttonDisableColour,
                    buttonString: AppStrings.loginButtonString,
                    isInit: isInit,
                    isDone: isDone,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: AppStrings.bySigningUpString,
                      style: AppTextStyle.appRichText,
                    ),
                    TextSpan(
                      text: AppStrings.termsCondition,
                      style: AppTextStyle.appRichText.copyWith(
                        color: AppColor.buttonEnableColour,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                        style: AppTextStyle.appRichText,
                        text: AppStrings.andString)
                  ])),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.privacyPolicy,
                    style: AppTextStyle.appRichText.copyWith(
                      color: AppColor.buttonEnableColour,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          );
        })),
      ),
    );
  }
}
