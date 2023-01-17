
import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class Organization extends StatefulWidget {
  const Organization({Key? key}) : super(key: key);

  @override
  State<Organization> createState() => _OrganizationState();
}

class _OrganizationState extends State<Organization> {
  @override
  Widget build(BuildContext context) {
        double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColour,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: IconButton(
            icon: Image.asset(
              AppAssetImagesFile.icSettingIcon,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          AppStrings.organization,
          style:  AppTextStyle.organizationStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
                onPressed: () {
                 

                                            
                    // inputDecoration: InputDecoration(
                    //   // focusColor: Colors.black,
                    //   // fillColor:Colors.black ,
                    //   // hoverColor: Colors.black,
                    // ),

                  
 
                },
                icon:const Icon(
                  Icons.check,
                  color: AppColor.buttonEnableColour,
                  size: 40,
                )),
          )
        ],
      ),
      body: Consumer<AppFormProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssetImagesFile.logo,
                    height:_screenheight * 0.06,
                  ),
                 SizedBox(
                    width: _screenwidth * 0.054
                  ),
                  Text(
                    AppStrings.homeHealthNotify,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Radio(
                      value: AppStrings.homeHealthNotify,
                      groupValue: provider.val,
                      onChanged: (value) {
                        provider.changevalue(value.toString());
                      })
                ],
              ),
               SizedBox(
                height: _screenheight * 0.045
              ),
              Row(
                children: [
                  Image.asset(
                    AppAssetImagesFile.appinventivLogo,
                    height: _screenheight *0.06,
                  ),
                 SizedBox(
                    width: _screenwidth * 0.054
                  ),
                  Text(
                    AppStrings.appinventiv,
                    style:const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Radio(
                      value: AppStrings.appinventiv,
                      groupValue: provider.val,
                      onChanged: (val) {
                        provider.changevalue(val.toString());
                      }),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
