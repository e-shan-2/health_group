import 'package:flutter/material.dart';
import 'package:health_group/model/quick_reply.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/ui/change_password.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_validator.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class AddQuickReply extends StatefulWidget {
  const AddQuickReply({Key? key}) : super(key: key);

  @override
  State<AddQuickReply> createState() => _AddQuickReplyState();
}

class _AddQuickReplyState extends State<AddQuickReply> {
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
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AppBarClass(
          appBarString: AppStrings.addQuickReply,
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
            builder: (context, _provider1, _provider2, child) {
              return Container(
                  color: AppColor.veryLightPink,
                  padding: EdgeInsets.symmetric(
                      horizontal: 13.5, vertical: _screenheight * 0.06),
                  child: Form(
                    key: _formKey,
                    onChanged: () {
                      _colour.value = _provider1.onchanging(_controller);
                    },
                    child: Column(
                      children: [
                        TextFormFieldClass(
                            enable: true,
                            labelName: AppStrings.enterMessage,
                            controller: _messageController,
                            validator: AppValidator().isNameValidator,
                            obscureText: false),
                        SizedBox(height: _screenheight * 0.068),
                        AppButtonClass(
                            buttonColorString: AppColor.whiteColour,
                            width: _screenwidth * 0.748,
                            height: _screenheight * 0.065,
                            buttonColour: _colour.value
                                ? AppColor.buttonEnableColour
                                : AppColor.buttonDisableColour,
                            buttonString: AppStrings.add,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                QuickReplyDataModel _datmodel =
                                    QuickReplyDataModel(
                                        msg: _messageController.text);

                                int? response = await _provider2
                                    .patchQuickReplyadd(_datmodel);
                                if (response == 200) {
                                  Navigator.pop(context);
                                }
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
