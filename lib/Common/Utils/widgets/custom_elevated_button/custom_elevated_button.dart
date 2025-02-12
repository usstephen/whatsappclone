import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text; 
  
  const CustomElevatedButton(
      {Key? key, 
        this.buttonWidth, 
        required this.onPressed,
        required this.text,
    }): super (key: key) ;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 42,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Coloors.greenDark,
          foregroundColor: Coloors.backgroundDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(text),
      ),
    );
  }
}
