import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';

import '../widgets/custom_text-field.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    countryNameController= TextEditingController(text: 'Ethiopia');
    countryCodeController = TextEditingController(text: '251)');
    phoneNumberController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text('Enter Your Phone Number',style: TextStyle(color: Color(0xFFE9EDEF),
        ),
        ),
          centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
              splashColor: Colors.transparent,
              splashRadius: 22,
              iconSize: 22,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 40),
              icon: Icon(Icons.more_vert, color: Coloors.blueLight,)
          )
        ],

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
            child: RichText(
              textAlign: TextAlign.center,
                text:
            TextSpan(
              text: 'Whatsapp will need you to verify your phone number. ',
              style: TextStyle(
                color: Colors.blueGrey,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "what is my number?",
                  style: TextStyle(
                    color: context.theme.primaryColorDark,
                  )
                )
              ]
            )
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: (){},
              controller: countryNameController,
              readOnly: true,
              SuffixIcon:  const Icon(Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: (){},
                    controller:countryCodeController,
                    prefixText: '+',
                    readOnly: true,

                  ),
                ),
                const SizedBox(height: 10,)
                Expanded(
                  child: CustomTextField(
                   controller:phoneNumberController,
                   hintText: 'phone number',
                    textAlign:TextAlign.left,
                    keyBoardType:TextInputType.number,


                ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text('Carrier charge may apply', style: TextStyle(color: context.theme.primaryColorDark),)

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(onPressed: (){},
          text:
          'Next',
        buttonWidth: 90,
      ),

    );
  }
}
