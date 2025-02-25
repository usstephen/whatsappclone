import 'package:country_picker/country_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_icon_button.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/Common/helper/show_alert_dialog.dart';
import 'package:whatsappclone/feature/welcome/pages/Widget/app_routes.dart';




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
  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'please enter your phone number',
      );
    } else if (phone.length < 9) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too short for the country: $name.\n\nInclude your area code if you haven't",
      );
    } else if (phone.length > 10) {
      return showAlertDialog(
        context: context,
        message: 'The phone number you entered is too long for the country : $name.\n\nInclude your area code if you haven"t',);
    }

  }


  showCountryCodePicker(){
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ET'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: context.customTheme.blueColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.customTheme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.customTheme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.greenDark,
          ),
          hintText: 'Search country code or name ',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.customTheme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
             borderSide: BorderSide(
              color: Coloors.greenDark,
            ),
          ),
        )
      ),
      onSelect:
          (Country){
        countryNameController.text = Country.name;
        countryCodeController.text = Country.countryCode;
          },
    );
  }



  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Ethiopia');
    countryCodeController = TextEditingController(text: '251');
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
        title: Text(
            'Enter Your Phone Number',
          style:
          TextStyle
            (color:
          Color(0xFFE9EDEF),
          ),
        ),
          centerTitle: true,
        actions: [
         CustomIconButton(
             onTap: (){},
             icon: Icons.more_vert,
         ),
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
                color: context.customTheme.greyColor,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "what is my number?",
                  style: TextStyle(
                    color: context.customTheme.blueColor,
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
              onTap:showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixActIcon:  const Icon(Icons.arrow_drop_down,
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
                    onTap:showCountryCodePicker,
                    controller:countryCodeController,
                    prefixText: '+',
                    readOnly: true,

                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: CustomTextField(
                   controller:phoneNumberController,
                   hintText: 'phone number',
                    textAlign:TextAlign.left,
                    keyboardType:TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text('Carrier charge may apply', style: TextStyle(color:context.customTheme.greyColor),)

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
          text:
          'Next',
        buttonWidth: 90,
      ),

    );
  }
}
