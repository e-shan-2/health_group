// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:health_group/services/shared_preferences.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/alert_dailog.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/pinlock_button.dart';
import 'package:health_group/widget/small_button.dart';

// ignore: must_be_immutable
class CurrentPinLock extends StatefulWidget {
  String route;
  CurrentPinLock({this.route = Routing.tabBarRoute, Key? key})
      : super(key: key);

  @override
  State<CurrentPinLock> createState() => _CurrentPinLockState();
}

class _CurrentPinLockState extends State<CurrentPinLock> {
  final SharedPreferenceClass _localStorage = SharedPreferenceClass();
  List<int> data = [];
  List<bool> colourValue = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  bool screen = false;
  int k = 0;
  String pin = "";
  void removeData() {
    if (k == 0) {
      return;
    }
   
    data.removeAt(k - 1);

    setState(() {
      colourValue[k - 1] = false;
    });

    --k;
  }

  void addData(int datavalue) async {
    data.add(datavalue);
    if (k > 5) {
      k = 0;
    }
    k++;
    // print(k.toString() + 'k value');
    // if (data.length > 6) {
    //   setState(() {
    //     print('Working');
    //     colourValue = colourValue.map((e) => false).toList();
    //   });
    // }

    if (data.length == 6) {
      for (int i = 0; i < data.length; i++) {
        pin = pin + data[i].toString();
      }
      String _pinLocalStorage = await _localStorage.getpassword("pin");
      if (pin == _pinLocalStorage) {
        widget.route == Routing.tabBarRoute
            ? Navigator.pushNamed(context, Routing.tabBarRoute)
            : Navigator.pushNamed(context, widget.route);
      }

      setState(() {
        screen = true;
        colourValue = colourValue.map((e) => false).toList();
        data.removeRange(0, data.length);
        pin = "";
        
      });

      // addData(0);
      //  data.addData(0);

    }

    for (int i = 0; i < data.length; i++) {
      if (data.length == 7) {
       
        break;
      // ignore: unnecessary_null_comparison
      } else if (data[i] != null) {
      
        setState(() {
          colourValue[i] = true;
        });
      } else {
        setState(() {
          colourValue[i] = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                AppStrings.closeApp,
                // style: AppTextStyle.nunitoNormal
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    AppStrings.yes,
                    // style: AppTextStyle.nunitoNormal
                    //     .copyWith(color: AppColors.lipstick
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.no,
                    // style: AppTextStyle.nunitoNormal
                    //     .copyWith(color: AppColors.lipstick),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: AppBarClass(
        appBarString: AppStrings.pinLock,
        leading: IconButton(
          icon: Image.asset(
            AppAssetImagesFile.backbutton,
            scale: 3,
          ),
          onPressed: widget.route == Routing.tabBarRoute
              ? () {
                  return;
                }
              : () {
                  Navigator.pop(context);
                },
        ),
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: GestureDetector(
            onTap: () {},
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppStrings.pinEnter),
              Wrap(
                spacing: 1,
                direction: Axis.horizontal,
                children: [
                  SmallButton(
                    colour: colourValue[0],
                  ),
                  SmallButton(
                    colour: colourValue[1],
                  ),
                  SmallButton(colour: colourValue[2]),
                  SmallButton(colour: colourValue[3]),
                  SmallButton(colour: colourValue[4]),
                  SmallButton(colour: colourValue[5]),
                ],
              ),
         SizedBox(
               height: _screenheight * 0.0461
              ),
              Wrap(
                  spacing: 15,
                  direction: Axis.horizontal,
                  runSpacing: 15,
                  children: [
                    BlueContainers(
                      onTap: (() {
                        addData(1);
                      }),
                      buttoninteger: 1,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(2);
                      }),
                      buttoninteger: 2,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(3);
                      }),
                      buttoninteger: 3,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(4);
                      }),
                      buttoninteger: 4,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(5);
                      }),
                      buttoninteger: 5,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(6);
                      }),
                      buttoninteger: 6,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(7);
                      }),
                      buttoninteger: 7,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(8);
                      }),
                      buttoninteger: 8,
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(9);
                      }),
                      buttoninteger: 9,
                    ),
                    BlueContainers(
                      noball: true,
                      value: AppStrings.forgotPin,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AppAlertDialogBox(
                                image: false,
                              );
                            });
                      },
                    ),
                    BlueContainers(
                      onTap: (() {
                        addData(0);
                      }),
                      buttoninteger: 0,
                    ),
                    BlueContainers(
                      noball: true,
                      value: AppStrings.delete,
                      onTap: () {
                        removeData();
                      },
                    )
                  ]),
            ]),
          ),
        ),
      ),
    );
  }
}
