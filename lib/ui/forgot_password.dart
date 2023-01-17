
import 'package:flutter/material.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_constants.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/alert_dailog.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

enum ButtonState { intialStage, loading, completed }

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _controloler;

  final Bool _colour = Bool(false);
  bool indicator = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _controloler = [_emailController];
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  ButtonState state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    bool isInit = indicator || state == ButtonState.intialStage;
    bool isDone = state == ButtonState.completed;
    // Size _size = MediaQuery.of(context).size;z

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
              key: _formKey,
              onChanged: () {
                _colour.value = _providerAppForm.onchanging(_controloler);
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                children: [
                  SizedBox(height: _screenwidth * 0.20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppColor.blackColour,
                      ),
                    ),
                  ),
                  SizedBox(height: _screenwidth * 0.1069),
                  Text(
                    AppStrings.forgotPassword,
                    style: AppTextStyle.appheadings.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    AppStrings.forgotPasswordScreenText,
                    style: AppTextStyle.appSubHeading.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: _screenwidth * 0.134),
                  TextFormFieldClass(
                      enable: true,
                      validator: AppValidator().isEmailValidator,
                      labelName: AppStrings.emailAddressTextFormField,
                      controller: _emailController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AppButtonClass(
                        buttonColorString: AppColor.whiteColour,
                        indicator: true,
                        isDone: isDone,
                        isInit: isInit,
                        width: AppConstants.widthLongButton,
                        height: AppConstants.heightLongButton,
                        buttonColour: _colour.value
                            ? AppColor.buttonEnableColour
                            : AppColor.buttonDisableColour,
                        buttonString: AppStrings.submitString,
                        onPressed: () async {
                          setState(() {
                            state = ButtonState.loading;
                          });
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic>? response;

                            try {
                              response =
                                  await _providerApi.patchForgotDataRequest(
                                      context, _emailController.text);
                              if (200 <= response![AppStrings.statusCode] &&
                                  response[AppStrings.statusCode] <= 300) {
                                String? tokenvalue =
                                    response[AppStrings.data][AppStrings.token];
                                setState(() {
                                  state = ButtonState.completed;
                                });

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AppAlertDialogBox(
                                        image: true,
                                        routingName: Routing.resetPasswordRoute,
                                        token: tokenvalue,
                                      );
                                    });

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
                          } else {
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
              ),
            );
          },
        ),
      ),
    );
  }
}
