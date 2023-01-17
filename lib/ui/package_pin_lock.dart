// String _name2 = AppStrings.reEnterThePin;
//     String _name3 = AppStrings.pinEnter;
//     final inputController = InputController();
//     AppFormProvider _provider = Provider.of(context, listen: false);
//     ApiServiceProvider _provider2 = Provider.of(context, listen: false);
//     WidgetsBinding.instance!.addPostFrameCallback((_) async {
//       widget.value["answer"] == 1
//           // ?
//           // This Screen lock  is  for  Forget Pin ,The Pin receieved on email will be entered here
//           screenLock(
//               context: context,
//               inputController: inputController,
//               digits: 6,
//               correctString: " ",
//               confirmation: true,
//               screenLockConfig: ScreenLockConfig(
//                 backgroundColor: AppColor.whiteColour,
//               ),
//               secretsConfig: SecretsConfig(
//                   secretConfig: SecretConfig(
//                 borderColor: AppColor.blackColour,
//                 enabledColor: AppColor.buttonEnableColour,
//               )),
//               inputButtonConfig: InputButtonConfig(
//                   textStyle:
//                       InputButtonConfig.getDefaultTextStyle(context).copyWith(
//                     color: AppColor.buttonEnableColour,
//                   ),
//                   buttonStyle: OutlinedButton.styleFrom(
//                     backgroundColor: AppColor.whiteColour,
//                     side: BorderSide(color: AppColor.buttonEnableColour),
//                   )),
//               title: Text(
//                 _name,
//                 style: TextStyle(color: AppColor.blackColour),
//               ),
//               deleteButton: Text(AppStrings.delete,
//                   style: TextStyle(
//                       fontSize: 10, color: AppColor.buttonEnableColour)),
//               cancelButton: TextButton(
//                 onPressed: () async {
//                   /*This screen lock is used when the user Enter wrong pin receieved from the mail
//               and he want to got back to the previous ScreenLOck
//               */

//                   screenLock(
//                       context: context,
//                       digits: 6,
//                       correctString: await _localStorage.getpassword("pin"),
//                       screenLockConfig: ScreenLockConfig(
//                         backgroundColor: AppColor.whiteColour,
//                       ),
//                       secretsConfig: SecretsConfig(
//                           secretConfig: SecretConfig(
//                         borderColor: AppColor.blackColour,
//                         enabledColor: AppColor.buttonEnableColour,
//                       )),
//                       inputButtonConfig: InputButtonConfig(
//                           textStyle:
//                               InputButtonConfig.getDefaultTextStyle(context)
//                                   .copyWith(
//                             color: AppColor.buttonEnableColour,
//                           ),
//                           buttonStyle: OutlinedButton.styleFrom(
//                             backgroundColor: AppColor.whiteColour,
//                             side:
//                                 BorderSide(color: AppColor.buttonEnableColour),
//                           )),
//                       title: Text(
//                         _name,
//                         style: TextStyle(color: AppColor.blackColour),
//                       ),
//                       deleteButton: Text(AppStrings.delete,
//                           style: TextStyle(
//                               fontSize: 10,
//                               color: AppColor.buttonEnableColour)),
//                       cancelButton: TextButton(
//                         onPressed: () {},
//                         child: Text(AppStrings.delete,
//                             style: TextStyle(
//                                 fontSize: 10,
//                                 color: AppColor.buttonEnableColour)),
//                       ),
//                       customizedButtonChild: Text(
//                         AppStrings.forgotPin,
//                         style: TextStyle(
//                             fontSize: 10, color: AppColor.buttonEnableColour),
//                       ),
//                       customizedButtonTap: () {
//                         return showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AppAlertDialogBox(
//                                 image: false,
//                               );
//                             });
//                       });
//                 },
//                 child: Text(AppStrings.delete,
//                     style: TextStyle(
//                         fontSize: 10, color: AppColor.buttonEnableColour)),
//               ),
//               didConfirmed: (matchedText) async {
//                 VerifyPinModel _data = VerifyPinModel(otp: matchedText);
//                 int? statusCode = await _provider2.verifyPinLock(_data);
//                 print(statusCode);

//                 if (statusCode == 200) {
//                   //When the  user enters the correct pin from the email it will navigate user to set pin

//                   screenLock(
//                     context: context,
//                     digits: 6,
//                     confirmation: true,
//                     correctString: '',
//                     didConfirmed: (matchedText) {
//                       _provider.saveValue(matchedText);
//                       _localStorage.setpassword("pin", matchedText);
//                       Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           Routing.homePageRoute,
//                           (Route<dynamic> route) => false);
//                     },
//                     screenLockConfig: ScreenLockConfig(
//                       backgroundColor: AppColor.whiteColour,
//                     ),
//                     secretsConfig: SecretsConfig(
//                         secretConfig: SecretConfig(
//                       borderColor: AppColor.blackColour,
//                       enabledColor: AppColor.buttonEnableColour,
//                     )),
//                     inputButtonConfig: InputButtonConfig(
//                         textStyle:
//                             InputButtonConfig.getDefaultTextStyle(context)
//                                 .copyWith(
//                           color: AppColor.buttonEnableColour,
//                         ),
//                         buttonStyle: OutlinedButton.styleFrom(
//                           backgroundColor: AppColor.whiteColour,
//                           side: BorderSide(color: AppColor.buttonEnableColour),
//                         )),
//                     title: Text(
//                       "Set pin",
//                       style: TextStyle(color: AppColor.blackColour),
//                     ),
//                     confirmTitle: Text(_name2,
//                         style: TextStyle(color: AppColor.blackColour)),
//                     deleteButton: Text(AppStrings.delete,
//                         style: TextStyle(
//                             fontSize: 10, color: AppColor.buttonEnableColour)),
//                     cancelButton: Text(AppStrings.delete,
//                         style: TextStyle(
//                             fontSize: 10, color: AppColor.buttonEnableColour)),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(AppStrings.pinOtpDosentMatch),
//                       duration: const Duration(seconds: 2)));
//                   await Future.delayed(Duration(seconds: 1));

//                   screenLock(
//                       context: context,
//                       digits: 6,
//                       correctString: await _localStorage.getpassword("pin"),
//                       screenLockConfig: ScreenLockConfig(
//                         backgroundColor: AppColor.whiteColour,
//                       ),
//                       secretsConfig: SecretsConfig(
//                           secretConfig: SecretConfig(
//                         borderColor: AppColor.blackColour,
//                         enabledColor: AppColor.buttonEnableColour,
//                       )),
//                       inputButtonConfig: InputButtonConfig(
//                           textStyle:
//                               InputButtonConfig.getDefaultTextStyle(context)
//                                   .copyWith(
//                             color: AppColor.buttonEnableColour,
//                           ),
//                           buttonStyle: OutlinedButton.styleFrom(
//                             backgroundColor: AppColor.whiteColour,
//                             side:
//                                 BorderSide(color: AppColor.buttonEnableColour),
//                           )),
//                       title: Text(
//                         _name,
//                         style: TextStyle(color: AppColor.blackColour),
//                       ),
//                       deleteButton: Text(AppStrings.delete,
//                           style: TextStyle(
//                               fontSize: 10,
//                               color: AppColor.buttonEnableColour)),
//                       cancelButton: TextButton(
//                         onPressed: () {},
//                         child: Text(AppStrings.delete,
//                             style: TextStyle(
//                                 fontSize: 10,
//                                 color: AppColor.buttonEnableColour)),
//                       ),
//                       customizedButtonChild: Text(
//                         AppStrings.forgotPin,
//                         style: TextStyle(
//                             fontSize: 10, color: AppColor.buttonEnableColour),
//                       ),
//                       customizedButtonTap: () {
//                         return showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AppAlertDialogBox(
//                                 image: false,
//                               );
//                             });
//                       });
//                 }
//               },
//             )
//           // This is the default pin lock which will appear on the homeScreen
//           : screenLock(
//               context: context,
//               digits: 6,
//               correctString: await _localStorage.getpassword("pin"),
//               screenLockConfig: ScreenLockConfig(
//                 backgroundColor: AppColor.whiteColour,
//               ),
//               secretsConfig: SecretsConfig(
//                   secretConfig: SecretConfig(
//                 borderColor: AppColor.blackColour,
//                 enabledColor: AppColor.buttonEnableColour,
//               )),
//               inputButtonConfig: InputButtonConfig(
//                   textStyle:
//                       InputButtonConfig.getDefaultTextStyle(context).copyWith(
//                     color: AppColor.buttonEnableColour,
//                   ),
//                   buttonStyle: OutlinedButton.styleFrom(
//                     backgroundColor: AppColor.whiteColour,
//                     side: BorderSide(color: AppColor.buttonEnableColour),
//                   )),
//               title: Text(
//                 _name,
//                 style: TextStyle(color: AppColor.blackColour),
//               ),
//               deleteButton: Text(AppStrings.delete,
//                   style: TextStyle(
//                       fontSize: 10, color: AppColor.buttonEnableColour)),
//               cancelButton: TextButton(
//                 onPressed: () {},
//                 child: Text(AppStrings.delete,
//                     style: TextStyle(
//                         fontSize: 10, color: AppColor.buttonEnableColour)),
//               ),
//               customizedButtonChild: Text(
//                 AppStrings.forgotPin,
//                 style:
//                     TextStyle(fontSize: 10, color: AppColor.buttonEnableColour),
//               ),
//               customizedButtonTap: () {
//                 return showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AppAlertDialogBox(
//                         image: false,
//                       );
//                     });
//               });
//     });
