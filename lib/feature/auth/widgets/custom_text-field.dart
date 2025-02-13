import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(this.controller,
      this.hintText, this.readOnly,
      this.textAlign, this.KeyboardType,
      this.prefixText, this.onTap,
      this.suffixActIcon, this.onChanged,
      );
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? KeyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixActIcon;
  final  Function (String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly?? false,
      textAlign: TextAlign.center,
      keyboardType: readOnly == null?KeyboardType: null,
      onChanged: onChanged,
      decoration:InputDecoration(
        isDense: true,
        prefixText: prefixText,
        suffix: suffixActIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Coloors.greyLight),
        enabledBorder:  const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark),
        ),
    focusedBorder:  const UnderlineInputBorder(
    borderSide: BorderSide(color: Coloors.greenDark, width: 2),
      ),
    ),
      );
  }
}
