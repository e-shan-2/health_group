import 'dart:io';

import 'package:flutter/material.dart';
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

// ignore: must_be_immutable
class AppAlertDialogBox extends StatefulWidget {
  bool? image;
  bool delete;
  String? routingName;
  String? token;
  bool? imagePicker;
  String? heading;
  String? messsage;
  // bool ? textFormFields;
  AppAlertDialogBox({
    this.imagePicker,
    this.token,
    this.routingName,
    this.image,
    this.messsage,
    this.heading,
    this.delete = false,
    Key? key,
  }) : super(key: key);

  @override
  State<AppAlertDialogBox> createState() => _AppAlertDialogBoxState();
}

class _AppAlertDialogBoxState extends State<AppAlertDialogBox> {
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final List<TextEditingController> _controller;
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();
  Bool text1 = Bool(true);

  final Bool _colour = Bool(false);

  File? imageFile;
  String? email;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _controller = [_passwordController];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppFormProvider, ApiServiceProvider>(
      builder: (context, _provider1, _provider2, child) {
        return AlertDialog(
          content: widget.imagePicker == false
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(widget.heading!),
                      Text(widget.messsage!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        AppButtonClass(
                            buttonColorString: AppColor.buttonEnableColour,
                            width: 100,
                            height: 40,
                            indicator: false,
                            buttonColour: AppColor.whiteColour,
                            buttonString: AppStrings.cancel,
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        const Spacer(),
                        AppButtonClass(
                            buttonColorString: AppColor.whiteColour,
                            width: 100,
                            height: 40,
                            buttonColour: AppColor.buttonEnableColour,
                            buttonString: AppStrings.ok,
                            onPressed: widget.delete
                                ? () async {
                                    var response =
                                        await _provider2.logOut(context);

                                    if (200 <=
                                            response[AppStrings.statusCode] &&
                                        response[AppStrings.statusCode] <=
                                            300) {
                                      await _localStorage
                                          .clearKeyData(AppStrings.email);
                                      await _localStorage
                                          .clearKeyData(AppStrings.password);
                                      await _localStorage
                                          .clearKeyData(AppStrings.token);

                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          widget.routingName!,
                                          (Route<dynamic> route) => false);
                                    } else {}
                                  }
                                : () async {},
                            indicator: false)
                      ])
                    ])
              : widget.image == false
                  ? Consumer2<AppFormProvider, ApiServiceProvider>(builder:
                      (context, _providerAppForm, _providerApi, child) {
                      return Form(
                        key: _formKey,
                        onChanged: () async {
                          _colour.value =
                              _providerAppForm.onchanging(_controller);
                        },
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.pleaseEnterYourPassword,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  AppStrings.myEmail,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.alertDialogTextStyle,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              TextFormFieldClass(
                                validator: AppValidator().isPassWordValidator,
                                labelName: AppStrings.password,
                                controller: _passwordController,
                                obscureText: text1.value,
                                enable: true,
                                icon: IconButton(
                                    onPressed: () async {
                                      _providerAppForm.ontoggle(text1);
                                    },
                                    icon: Icon(
                                      text1.value
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off_rounded,
                                      color: AppColor.buttonEnableColour,
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 35),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      AppStrings.forgotPassword,
                                      style: AppTextStyle.alertDialogTextStyle
                                          .copyWith(
                                              color:
                                                  AppColor.buttonEnableColour,
                                              fontWeight: FontWeight.w600),
                                    )),
                              ),
                              AppButtonClass(
                                  buttonColorString: AppColor.whiteColour,
                                  indicator: false,
                                  width: 148.5,
                                  height: 50,
                                  buttonColour: (_colour.value
                                      ? AppColor.buttonEnableColour
                                      : AppColor.buttonDisableColour),
                                  buttonString: AppStrings.submitString,
                                  onPressed: () async {
                                    String? email =
                                        await _localStorage.getEmail();

                                    if (_formKey.currentState!.validate()) {
                                      var data =
                                          await _providerApi.postForgotPin(
                                              context,
                                              email ?? AppStrings.myEmail,
                                              _passwordController.text);

                                      if (200 <= data![AppStrings.statusCode] &&
                                          data[AppStrings.statusCode] <= 300) {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          Routing.pinLock,
                                        );
                                      }
                                    }
                                  }),
                            ]),
                      );
                    })
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            AppAssetImagesFile.forgotPassword,
                            height: 51,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(AppStrings.resetPasswordInstruction,
                              style: AppTextStyle.alertDialogTextStyle),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(AppStrings.resetPasswordDescription,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.alertDialogTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackColour,
                                wordSpacing: 2,
                              )),
                          const SizedBox(
                            height: 18,
                          ),
                          AppButtonClass(
                            buttonColorString: AppColor.whiteColour,
                            indicator: false,
                            width: 128.5,
                            height: 45,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, widget.routingName!,
                                  arguments: widget.token!);
                            },
                            buttonColour: AppColor.buttonEnableColour,
                            buttonString: AppStrings.ok,
                          ),
                        ]),
        );
      },
    );
  }
}
