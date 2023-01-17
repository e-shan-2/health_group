import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PhoneNumber extends StatefulWidget {
  String name;
  bool divider;
  CountryCode? countryCode;
  TextEditingController controller;
  void Function(CountryCode? code)? onInt;
  void Function(CountryCode? code)? onChanged;
  PhoneNumber(
      {this.divider = true,
      this.onInt,
      this.countryCode,
      this.onChanged,
      required this.name,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return Consumer<AppFormProvider>(
        builder: (context, _providerAppForm, child) {
      return Row(
        children: [
          Stack(alignment: Alignment.centerRight, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2.4),
              decoration: widget.divider == true
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1),
                      ),
                    )
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.veryLightPikTwo,
                        ),
                      ),
                    ),
              child: CountryCodePicker(
                  showCountryOnly: true,
                  padding: widget.divider == true
                      ? const EdgeInsets.only(bottom: 2)
                      : EdgeInsets.only(right: _screenwidth * 0.055),
                  showFlag: false,
                  onInit: widget.onInt,
                  onChanged: widget.onChanged,
                  dialogTextStyle: const TextStyle(color: Colors.black),
                  searchDecoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.buttonEnableColour,
                    ),
                    hintText: AppStrings.searchCountry,
                  ),
                  searchStyle: const TextStyle(color: AppColor.blackColour),
                  boxDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  initialSelection: 'US',
                  backgroundColor: AppColor.whiteColour,
                  textStyle: widget.divider == true
                      ? AppTextStyle.phoneNumberScreen
                      : AppTextStyle.phoneNumberScreen),
            ),
            widget.divider == true
                ? Image.asset(
                    AppAssetImagesFile.countryCodeArrow,
                    height: 15,
                    width: 12,
                  )
                : Image.asset(
                    AppAssetImagesFile.builProfileArrowButton,
                    width: _screenwidth * 0.055,
                    height: _screenheight * 0.03,
                  ),
          ]),
          widget.divider == true
              ? SizedBox(
                  height: _screenheight * 0.075,
                  child: VerticalDivider(
                    thickness: 1,
                    width: _screenwidth * 0.055,
                    color: Colors.black,
                    indent: 2,
                    endIndent: 5,
                  ),
                )
              : SizedBox(width: _screenwidth * 0.055),
          Flexible(
            child: TextFormFieldClass(
              enable: true,
              labelName: widget.name,
              controller: widget.controller,
              obscureText: false,
            ),
          ),
        ],
      );
    });
  }
}
