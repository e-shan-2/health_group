import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';

// ignore: must_be_immutable
class TextFieldEvent extends StatefulWidget {
  String?hint;
  TextEditingController controller;
  
  TextFieldEvent({required this.controller,this.hint, Key? key }) : super(key: key);

  @override
  State<TextFieldEvent> createState() => _TextFieldEventState();
}

class _TextFieldEventState extends State<TextFieldEvent> {
  @override
  Widget build(BuildContext context) {
    

    return TextField(
      controller: widget.controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: widget.hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.redColor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.redColor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
  }
