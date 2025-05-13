import 'package:flutter/material.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final bool? obscureText;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixActIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;

  const CustomTextField({
    this.controller,
    this.hintText,
    this.readOnly,
    this.obscureText,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTap,
    this.suffixActIcon,
    this.onChanged,
    this.fontSize,
    this.autoFocus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: readOnly == null ? keyboardType : null,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize),
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText,
        suffix: suffixActIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Coloors.greyLight),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark, width: 2),
        ),
      ),
    );
  }
}
