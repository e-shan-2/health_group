import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

// ignore: must_be_immutable
class TextFormFieldClass extends StatelessWidget {
  String labelName;
  TextEditingController controller;
  bool enable;
  bool settings;
  bool obscureText;
  Function()? onTap;
  bool buildProfile;
  InputBorder? border;
  void Function(String)? onSubmitted;
  TextInputAction? textInputAction;

  String? Function(String?)? validator;
  Widget? icon;
  TextFormFieldClass({
    this.settings = false,
    this.icon,
    this.border,
    this.textInputAction,
    this.buildProfile = false,
    required this.enable,
    required this.labelName,
    required this.controller,
    required this.obscureText,
    this.onSubmitted,
    this.onTap,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // It is for Enabled and disabled TextFormField  in build and Review Profile
      style: enable
          ? const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            )
          : TextStyle(
              fontWeight: FontWeight.bold,
              color: settings ? AppColor.whiteColour : AppColor.blackColour),
      onTap: onTap,

      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: enable
          ? InputDecoration(
              labelText: labelName,
              labelStyle: const TextStyle(
                fontSize: 15, color: AppColor.blackColour,
                // settings?AppColor.whiteColour:
              ),
              enabled: enable,
              suffixIcon: icon,
              contentPadding: const EdgeInsets.only(
                bottom: 12,
              ),
              // isCollapsed: true,
              isDense: true)
          : InputDecoration(
              labelText: labelName,
              labelStyle: TextStyle(
                  fontSize: 15,
                  color:
                      settings ? AppColor.whiteColour : AppColor.blackColour),
              enabled: enable,
              border: border == null
                  ? const OutlineInputBorder(borderSide: BorderSide.none)
                  : null,
              contentPadding: const EdgeInsets.only(
                bottom: 0,
              ),
            ),
      onFieldSubmitted: onSubmitted,

      validator: validator,
    );
  }
}
