import 'package:flutter/material.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_color.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RadioWidgetClass extends StatefulWidget {
  String value;
  double width;
  void Function(String?)? onChanged;

  RadioWidgetClass(
      {required this.width, required this.value, this.onChanged, Key? key})
      : super(key: key);

  @override
  State<RadioWidgetClass> createState() => _RadioWidgetClassState();
}

class _RadioWidgetClassState extends State<RadioWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppFormProvider>(
      builder: (context, _provider1, child) {
        return GestureDetector(
          onTap: () {
            // widget.onChanged;
          },

          // () {

          // _provider1.storeSocValue ( _provider1.changevalue(widget.value.toString()));
          // },
          child: Row(
            children: [
              SizedBox(
                height: 5,
                width: 18,
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: AppColor.greyColour),
                  child: Radio(
                    activeColor: AppColor.buttonEnableColour,
                    value: widget.value,
                    groupValue: _provider1.val,
                    onChanged: widget.onChanged,

                    // (value) {
                    //   _provider1.changevalue(value.toString());

                    //  _provider1.storeSocValue(_provider1.changevalue(value.toString()));

                    // }
                  ),
                ),
              ),
              SizedBox(
                width: widget.width,
              ),
              Text(
                widget.value,
              ),
            ],
          ),
        );
      },
    );
  }
}
