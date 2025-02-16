import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixActIcon;
  final  Function (String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;

  const CustomTextField({
    this.controller,
    this.hintText, this.readOnly,
    this.textAlign, this.keyboardType,
    this.prefixText, this.onTap,
    this.suffixActIcon, this.onChanged, this.fontSize, this.autoFocus,

  });

  const CustomTextField({
    this.controller,
    this.hintText, this.readOnly,
    this.textAlign, this.keyboardType,
    this.prefixText, this.onTap,
    this.suffixActIcon, this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly?? false,
      textAlign: TextAlign.center,
      keyboardType: readOnly == null?keyboardType: null,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize),
      autofocus: autoFocus?? false,
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
