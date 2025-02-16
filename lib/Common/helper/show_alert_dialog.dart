
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';

showAlertDialog(
{
  required BuildContext context,
  required String message,
  String? btnText,
}){
  return showDialog(
      context: context,
      builder: (context){
      return AlertDialog(
        content: Text('Message',
          style: TextStyle(
            color: context.customTheme.greyColor,
            fontSize: 15,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text
                (
                btnText?? "OK",
                style: TextStyle(
                  color: context.customTheme.circleImageColor,
                ),
              ),
          ),
        ],
      );
  },
  );

}