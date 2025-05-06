import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/auth/Pages/signup.dart';

import '../widgets/custom_text-field.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  late TextEditingController countryNameController;
  late TextEditingController phoneCodeController;
  late TextEditingController phoneNumberController;
  late Country _country;

  @override
  void initState() {
    _country = CountryParser.parseCountryCode('US');
    _setControllers();
    super.initState();
  }

  @override
  void dispose() {
    phoneCodeController.dispose();
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
            style: TextStyle(color: Color(0xFFE9EDEF),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              splashColor: Colors.transparent,
              splashRadius: 22,
              iconSize: 22,
              padding: EdgeInsets.zero,
              color: context.customTheme.langBtnBgColor,
              constraints: const BoxConstraints(minWidth: 40),
              icon: Icon(Icons.more_vert)
          )
        ],
      ),
      body: Center(
        child: Container(
          width: 500,
          child: Column(
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
                          color: Coloors.blueLight,
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
                  onTap: _pickCountry,
                  controller: countryNameController,
                  readOnly: true,
                  suffixIcon:  const Icon(Icons.arrow_drop_down,
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
                        controller:phoneCodeController,
                        prefixText: '+',
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: CustomTextField(
                       controller:phoneNumberController,
                       hintText: 'phone number',
                       textAlign:TextAlign.left,
                       keyboardType :TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text('Carrier charge may apply', style: TextStyle(color: context.customTheme.circleImageColor),)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: (){
          Get.to(() => Signup(phone: '${_country.phoneCode}${phoneNumberController.text}',), transition: Transition.rightToLeft);
        },
        text: 'Next',
        buttonWidth: 90,
      ),
    );
  }
  void _pickCountry()async{
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context)
    );
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: context.customTheme.langBtnBgColor,
        bottomSheetHeight: 500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
          inputDecoration:  InputDecoration(
            hintText: "🔎 Search for your country here",
            border: inputBorder,
            isDense: true,
            fillColor: Coloors.greyDark,
            contentPadding: const EdgeInsets.all(10),
          )
      ),
      onSelect: (Country country) {
        _country = country;
        _setControllers();
      },
    );
  }

  void _setControllers(){
    setState(() {
      countryNameController = TextEditingController(text: _country.name);
      phoneCodeController = TextEditingController(text: _country.phoneCode);
      phoneNumberController = TextEditingController();

    });
  }
}

