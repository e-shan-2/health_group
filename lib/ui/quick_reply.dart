import 'package:flutter/material.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/alert_dailog.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:provider/provider.dart';

class QuickRepkly extends StatefulWidget {
  const QuickRepkly({Key? key}) : super(key: key);

  @override
  State<QuickRepkly> createState() => _QuickRepklyState();
}

bool readOnly = true;
bool physics = false;

class _QuickRepklyState extends State<QuickRepkly> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return AppBarClass(
      appBarString: AppStrings.quickReply,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            AppAssetImagesFile.backbutton,
            width: 12.3,
          )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routing.addQuickReplyhRoute);
            },
            icon: Image.asset(
              AppAssetImagesFile.addMediaDocuments,
              color: AppColor.blackColour,
              width: 21.3,
            ))
      ],
      widget: FutureBuilder(
        future: Provider.of<ApiServiceProvider>(context, listen: false)
            .getQuickReplyUSer(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {

            WidgetsBinding.instance!.addPostFrameCallback((_) async {});
            return ListView.builder(

                itemCount: snapshot
                    .data[AppStrings.data][AppStrings.quickReplySmallCase]
                    .length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      SizedBox(
                        height: _screenheight * 0.09,
                        child: GestureDetector(
                          onHorizontalDragStart: (details) {
                            // setState(() {
                            //   physics = true;
                            // });
                          },
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    decoration: BoxDecoration(
                                     
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppColor.blackColour,
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(snapshot.data[AppStrings.data]
                                              [AppStrings.quickReplySmallCase]
                                          [index]),
                                    ),
                                    
                                  )

    
                                  ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routing.editQuickReplyRoute);
                                },
                                child: Container(
                                    height: _screenheight * 0.065,
                                    color: AppColor.buttonEnableColour,
                                    child: Image.asset(
                                        AppAssetImagesFile.quickReplyedit)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AppAlertDialogBox(
                                          image: false,
                                        );
                                      });
                                },
                                child: Container(
                                  height: _screenheight * 0.065,
                                  color: AppColor.maroonColour,
                                  child: Image.asset(
                                    AppAssetImagesFile.quickReplyDeleteButton,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );
                }));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
