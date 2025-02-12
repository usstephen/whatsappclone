import 'package:flutter/material.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';

import '../../../../Common/Utils/Coloors.dart';

class  PrivacyAndTerm extends StatelessWidget {
  const PrivacyAndTerm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: RichText(
        textAlign: TextAlign.center,
          text:
      TextSpan(
          text: 'Read our ',
          style: TextStyle(
            color: context.theme.greyColor,
            height: 1.5,
          ),
          children: [
            WidgetSpan(
                child: InkWell(
                  onTap: (){},
                  child: Text(
                      'Privacy Policy ',
                      style: TextStyle(color: context.theme.blueColor)
                  ),
                ),
            ),
            TextSpan(
                text:
                'Tap "Agree and Continue" to accept the ',
              style: TextStyle(color: context.theme.greyColor)
            ),
            WidgetSpan(
              child: InkWell(
                onTap: (){},
                child: Text(
                    'Term Of Service. ',
                    style: TextStyle(color: context.theme.blueColor)
                ),
              ),

            ),
          ]
      )
      ),
    );
  }
}


