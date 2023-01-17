import 'package:flutter/material.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_constants.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ImagePickerClass extends StatefulWidget {
  void Function() onPressedCamera;
  void Function() onPressedGallery;
  bool loading;
  ImagePickerClass(
      {this.loading = false,
      required this.onPressedGallery,
      required this.onPressedCamera,
      Key? key})
      : super(key: key);

  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}

bool _data = false;

class _ImagePickerClassState extends State<ImagePickerClass> {
  @override
  void didChangeDependencies() {
    _data = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppFormProvider, ApiServiceProvider>(
      builder: (context, _providerAppForm, _providerApiServices, child) {
        return _data
            ? const Center(child: CircularProgressIndicator())
            : AlertDialog(
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(AppStrings.imagePicker),
                    Text(AppStrings.chooseImageFromCamera),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      AppButtonClass(
                        buttonColorString: AppColor.whiteColour,
                        width: AppConstants.widthShortButton,
                        height: AppConstants.heiShortBughttton,
                        indicator: false,
                        buttonColour: AppColor.buttonEnableColour,
                        buttonString: AppStrings.camera,
                        onPressed:(){ 
                            setState(() {
                              _data = true;
                            });
                          
                          widget.onPressedCamera();}
                      ),
                      const Spacer(),
                      AppButtonClass(
                          buttonColorString: AppColor.whiteColour,
                          width: AppConstants.widthShortButton,
                          height: AppConstants.heiShortBughttton,
                          buttonColour: AppColor.buttonEnableColour,
                          buttonString: AppStrings.gallery,
                          onPressed: () async {
                            setState(() {
                              _data = true;
                            });
                            widget.onPressedGallery();
                            // await Future.delayed(Duration(seconds: 1));
                            // setState(() {
                            //   data = false;
                            // });
                          },
                          indicator: false)
                    ])
                  ]));
      },
    );
  }
}
