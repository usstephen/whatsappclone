import 'package:flutter/material.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/auth/widgets/custom_text-field.dart';

class UserInforPage extends StatefulWidget {
  const UserInforPage({super.key});

  @override
  State<UserInforPage> createState() => _UserInforPageState();
}

class _UserInforPageState extends State<UserInforPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
         title: Text('Profile info ',
           style:
           TextStyle(
             color: context.customTheme.authAppbarTextColor,
           )
         ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children: [
            Text('Please provide your name and an optional profile photo',
            textAlign: TextAlign.center,
              style: TextStyle(
              color: context.customTheme.greyColor,
            ),
            ),
            const SizedBox(height: 40),
              Container(
                padding:const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:context.customTheme.photoIconColor ,
                ),
                child: Icon(
                    Icons.add_a_photo_rounded,
                  size: 48,
                  color: context.customTheme.photoIconColor,
                ),


              ),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 20),

                const Expanded(
                    child: const CustomTextField(
                      hintText: 'Type your name here',
                      textAlign: TextAlign.left,
                      autoFocus: true,
                    )
                ),
                const SizedBox(width: 10),
                Icon(Icons.emoji_emotions_outlined,
                color: context.customTheme.photoIconColor,),
                const SizedBox(width: 20)
              ],
            )


          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(onPressed: (){},
        text: 'Next',
        buttonWidth: 90,
      ),
    );
  }
}
