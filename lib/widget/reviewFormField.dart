// ignore: file_names

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ReViewFormField extends StatelessWidget {
  TextEditingController controller;
   ReViewFormField({required this.controller, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:const TextStyle(fontWeight: FontWeight.bold),
      controller: controller,
      decoration: const InputDecoration(
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none

      ),
      
    );
  }
}