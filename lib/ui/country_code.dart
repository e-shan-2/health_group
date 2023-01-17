// import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:health_group/utils/app_color.dart';
// import 'package:health_group/utils/app_string.dart';
//  class CountryCodePickers extends StatefulWidget {
//   const CountryCodePickers({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CountryCodePickers> createState() => _CountryCodePickersState();
// }

// class _CountryCodePickersState extends State<CountryCodePickers> {
//   late final TextEditingController _codePicker;

//   @override
//   void initState() {
//     _codePicker = TextEditingController();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _screenwidth = MediaQuery.of(context).size.width;
//     const InputBorder _border = OutlineInputBorder(
//       borderSide: BorderSide(),
//     );
//     return CountryCodePicker(
//       flagWidth: 32,
//       enabled: true,
//       padding: EdgeInsets.zero,
//       showDropDownButton: true,
//       // textOverflow: TextOverflow.fade,
//       showFlag: false,
//       closeIcon: const Icon(
//         Icons.close,
//         color: AppColor.blackColour,
//         textDirection: TextDirection.rtl,
//       ),
//       onChanged: (code) {
//         _codePicker.text = code.toString();
//       },
//       dialogTextStyle: const TextStyle(color: Colors.black),
//       // dialogSize: const Size(),
//       searchDecoration: InputDecoration(
//         prefixIcon: const Icon(
//           Icons.search,
//           color: AppColor.buttonEnableColour,
//         ),
//         hintText: AppStrings.searchCountry,
//         border: _border,
//         focusedBorder: _border,
//         errorBorder: _border,
//         focusedErrorBorder: _border,
//         enabledBorder: _border,
//         disabledBorder: _border,
//         hoverColor: AppColor.greyColour,
//         fillColor: AppColor.greyColour,
//         focusColor: AppColor.greyColour,
//       ),
//       searchStyle: TextStyle(color: AppColor.blackColour),
//       boxDecoration: const BoxDecoration(
//         shape: BoxShape.rectangle,
//       ),
//       initialSelection: 'US',
//       backgroundColor: AppColor.whiteColour,
//       textStyle: TextStyle(color: AppColor.blackColour),
//     );
//   }
// }
