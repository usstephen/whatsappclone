import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:whatsappclone/feature/auth/Pages/login_pages.dart';
import 'package:whatsappclone/feature/welcome/pages/Widget/privacy_and_term.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';

import 'Widget/Language_button/Language_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Container(
          width: 450,
          child: Column(
            children: [
              Expanded(
                  child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Image.asset(
                      'assets/images/circle.png',
                      color:context.customTheme.circleImageColor,
                    ),
                  ),
                )
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    'Welcome to Whatsapp',
                    style:
                    TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                    ),
                  ),
                  PrivacyAndTerm(),
                  CustomElevatedButton(
                      onPressed: (){
                        Get.to(() => LoginPages(), transition: Transition.rightToLeft);
                      },
                      buttonWidth: 400,
                      text: "Agree and Continue"
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  LanguageButton()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
