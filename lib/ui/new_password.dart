import 'package:flutter/material.dart';



// ignore: must_be_immutable
class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {


  late final TextEditingController _newpasswordController;
  late final TextEditingController _confirmPasswordController;
  late final List<TextEditingController> controller;

  @override
  void initState() {
    super.initState();
    _newpasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    controller = [_newpasswordController, _confirmPasswordController];
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _newpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    //     double _screenwidth = MediaQuery.of(context).size.width;
    // double _screenheight = MediaQuery.of(context).size.height;
    // return GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: AppColor.whiteColour,
    //       leading: IconButton(
    //         icon:const Icon(
    //           Icons.arrow_back_ios_outlined,
    //           color: AppColor.blackColour,
    //           size: 30,
    //         ),
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //       ),
    //     ),
    //     body: Center(
    //       child:
    //           Consumer<AppFormProvider>(builder: ((context, _provider, child) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16.5),
    //           child: Form(
    //             key: _formKey,
    //             onChanged: () {
    //             _colour.value=  _provider.onchanging(
    //                 controller,
    //               );
    //             },
    //             child: ListView(
    //               physics:const NeverScrollableScrollPhysics(),
    //               children: [
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 Text(
    //                   AppStrings.newpassword,
    //                   style: AppTextStyle.appheadings.copyWith( fontSize: 33),
                      
                    
    //                 ),
    //                 const SizedBox(
    //                   height: 19.4,
    //                 ),
    //                 Text(
    //                   AppStrings.pleaseEnterNewPassword,
    //                   style: const TextStyle(fontSize: 15),
    //                 ),
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //                 RichText(
    //                     text: TextSpan(children: [
    //                   TextSpan(
    //                       text: AppStrings.passwordMustContain,
    //                       style: TextStyle(
    //                         color: AppColor.blackColour,
    //                         fontSize: 14.332,
    //                       )),
    //                   TextSpan(
    //                       text: AppStrings.oneUpperCase,
    //                       style: TextStyle(
    //                           color: AppColor.buttonEnableColour,
    //                           fontSize: 14.9))
    //                 ])),
    //                SizedBox(
    //                   height: _screenheight *0.05,
    //                 ),
    //                 TextFormFieldClass(
    //                   enable: true,
    //                   validator: AppValidator().isPassWordValidator,
    //                   labelName: AppStrings.newpassword,
    //                   controller: _newpasswordController,
    //                   obscureText: _newPasswordValue.value,
    //                   icon: IconButton(
    //                       onPressed: () {
    //                         // _text4 = 
    //                         _provider.ontoggle(_newPasswordValue);
    //                       },
    //                       icon: Icon(
    //                         _newPasswordValue.value
    //                             ? Icons.visibility_rounded
    //                             : Icons.visibility_off_rounded,
    //                         color: AppColor.buttonEnableColour,
    //                       )),
    //                 ),
    //                SizedBox(height: _screenheight *0.06),
    //                 TextFormFieldClass(
    //                   enable: true,
    //                   validator: AppValidator().isPassWordValidator,
    //                   labelName: AppStrings.confirmPassword,
    //                   controller: _confirmPasswordController,
    //                   obscureText: _confirmPasswordValue.value,
    //                   icon: IconButton(
    //                       onPressed: () {
    //                         // _text3 = 
    //                         _provider.ontoggle(_confirmPasswordValue);
    //                       },
    //                       icon: Icon(
    //                         _confirmPasswordValue.value
    //                             ? Icons.visibility_rounded
    //                             : Icons.visibility_off_rounded,
    //                         color: AppColor.buttonEnableColour,
    //                       )),
    //                 ),
    //                 const SizedBox(
    //                   height: 83,
    //                 ),
    //                 Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child: AppButtonClass(
    //                        buttonColorString: AppColor.whiteColour,
    //                       indicator: false,
    //                       width: 321,
    //                       height: 49.7,
    //                       buttonColour: _colour.value
    //                           ? AppColor.buttonEnableColour
    //                           : AppColor.buttonDisableColour,
    //                       buttonString: AppStrings.submitString,
    //                       onPressed: () {
    //                         if (!_formKey.currentState!.validate()) {
    //                           if (_newpasswordController.text ==
    //                               _confirmPasswordController.text) {
    //                             Navigator.pushNamed(
    //                                 context, Routing.organizationRoute);
    //                             _newpasswordController.clear();
    //                             _confirmPasswordController.clear();
    //                           } else {
    //                             // print("Password are not Matchin");
    //                           }
    //                         }
    //                       }),
    //                 )
    //               ],
    //             ),
    //           ),
    //         );
    //       })),
    //     ),
    //   ),
    // );
  }
}
