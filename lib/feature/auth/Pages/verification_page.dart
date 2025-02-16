

import 'package:flutter/material.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/auth/widgets/custom_text-field.dart';

import '../../../Common/Utils/widgets/custom_icon_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();

}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController codeController;
  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();

  }
  @override
  void dispose() {
    codeController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:context.customTheme.greyColor,
        elevation: 0,
        title: Text('verify your number ',
        style: TextStyle(
          color: context.customTheme.authAppbarTextColor,
        ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: (){},
            icon:Icons.more_vert,

          )
        ],
      ) ,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text:
            TextSpan(
              style: TextStyle(
                  color: context.customTheme.greyColor,
                  height: 1.5,
              ),
              children: [
               const TextSpan(
                  text: 'you have try to register +254786739262.before requesting an SMS or call with your code',

                ),
                TextSpan(
                  text: 'Wrong number?',
                  style: TextStyle(
                    color: context.customTheme.blueColor,
                  ),
                ),
              ]

            )
            ),
              ),
            const  SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                controller: codeController,
                hintText: '-------',
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20,),
            Text('Enter 6-digit code',
            style: TextStyle(
              color: context.customTheme.greyColor,
            ),
            ),
            const SizedBox(
              height: 30),
            Row(
              children: [
                Icon(Icons.message, color: context.customTheme.greyColor,
                ),
                const SizedBox(width: 20),
                Text('Resend SMS',
                style: TextStyle(
                  color: context.customTheme.greyColor,
                ),
                )
              ],
            ),

            const SizedBox(height: 10),
            Divider(color: context.customTheme.blueColor!.withOpacity(0.2),
            ),
            Row(
              children: [
                Icon(Icons.phone, color: context.customTheme.greyColor,
                ),
                const SizedBox(height: 10),
                Text('Call me',
                  style: TextStyle(
                    color: context.customTheme.greyColor,
                  ),
                )
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
