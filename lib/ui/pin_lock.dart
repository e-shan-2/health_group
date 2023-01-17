import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';

import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/pinlock_button.dart';
import 'package:health_group/widget/small_button.dart';
import 'package:provider/provider.dart';

class PinLockClass extends StatefulWidget {
  const PinLockClass({Key? key}) : super(key: key);

  @override
  State<PinLockClass> createState() => _PinLockClassState();
}

class _PinLockClassState extends State<PinLockClass> {
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

  

    if (data.length == 6) {
      for (int i = 0; i < data.length; i++) {
        pin = pin + data[i].toString();
      }

      Provider.of<AppFormProvider>(context, listen: false).setPin(pin);


      setState(() {
        screen = true;
        colourValue = colourValue.map((e) => false).toList();
        
        pin = "";
      });

      
 
    }
    if (screen) {
       Future.delayed(const Duration(seconds: 1));
   setState(() {
      data.removeRange(0, data.length);
     
   });
     
         Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, Routing.resetPinLock);
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

  bool color = false;
  @override
  Widget build(BuildContext context) {
      // double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return AppBarClass(
      appBarString: AppStrings.pinLock,
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: GestureDetector(
          onTap: () {},
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(AppStrings.setPin),
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
              height: _screenheight * 0.0461,
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
                    value: "",
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
    );
  }
}
