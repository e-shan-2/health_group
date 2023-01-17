import 'package:flutter/material.dart';
import 'package:health_group/model/quick_reply_update.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class EditQuickReply extends StatefulWidget {
  const EditQuickReply({Key? key}) : super(key: key);

  @override
  State<EditQuickReply> createState() => _EditQuickReplyState();
}

class _EditQuickReplyState extends State<EditQuickReply> {
  late TextEditingController _messageController;
  late final GlobalKey<FormState> _formKey;
  final Bool _colour = Bool(false);
  late final List<TextEditingController> _controller;
  @override
  void initState() {
    _messageController = TextEditingController();
    _formKey = GlobalKey();
    _controller = [_messageController];

    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AppBarClass(
          appBarString: AppStrings.editQuickReply,
          leading: IconButton(
            icon: Image.asset(
              AppAssetImagesFile.backbutton,
              scale: 3,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          widget: Consumer2<AppFormProvider, ApiServiceProvider>(
            builder: (context, _providerAppForm, _providerApiServices, child) {
              return Container(
                  color: AppColor.veryLightPink,
                  padding:  EdgeInsets.symmetric(
                      horizontal: 13.5, vertical: _screenheight * 0.06),
                  child: Form(
                    key: _formKey,
                    onChanged: () {
                      _colour.value = _providerAppForm.onchanging(_controller);
                    },
                    child: Column(
                      children: [
                        TextFormFieldClass(
                            enable: true,
                            labelName: AppStrings.enterMessage,
                            controller: _messageController,
                            obscureText: false),
                        SizedBox(
                          height: _screenheight * 0.065,
                        ),
                        AppButtonClass(
                            buttonColorString: AppColor.whiteColour,
                           width: _screenwidth * 0.748,
                    height: _screenheight * 0.065,
                            buttonColour: _colour.value
                                ? AppColor.buttonEnableColour
                                : AppColor.buttonDisableColour,
                            buttonString: AppStrings.save,
                            onPressed: () async {
                              List<String> data = [_messageController.text];
                              QuickReplyUpdateDataModel _dataModel =
                                  QuickReplyUpdateDataModel(
                                old: "",
                                newData: data,
                                position: data.length - 2,
                              );
                                                        Map<String,dynamic>? response ;
                                                        try{response = await _providerApiServices.patchQuickReplyUpdate(context,_dataModel);


                                  
                              if (200<=response![AppStrings.statusCode] &&response[AppStrings.statusCode] <= 300) {
                                Navigator.pushNamed(
                                    context, Routing.quickReply);
                              }
                              else{

                              }
                                                        }
                                                        // ignore: empty_catches
                                                        catch(e){

                                                        }
                            },
                            indicator: false)
                      ],
                    ),
                  ));
            },
          ),
        ));
  }
}
