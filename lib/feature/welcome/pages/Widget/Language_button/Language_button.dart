import 'package:flutter/material.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/Common/Utils/widgets/custom_icon_button.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';
import 'package:whatsappclone/feature/welcome/pages/Widget/Language_button/Language_button.dart';


class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});
showButtonSheet(context){
  return showModalBottomSheet
    (context: context,
      builder: (context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column (
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
              width: 30,
            decoration: BoxDecoration(
              color: context.customTheme.greyColor!.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5),
            ),

          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width: 20),
              CustomIconButton(
                  onTap: () => Navigator.of(context).pop(),
                  icon: Icons.close_outlined,
              ),
              const SizedBox(width: 20),
              const Text(
                'App Language',
              style:
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              )
            ],

          ),
          const SizedBox(height: 10),
          Divider( color: context.customTheme.greyColor!.withOpacity(0.3),
            thickness: .5,
          ),
          RadioListTile(
            value: true,
            groupValue: true,
            onChanged: (value){},
            activeColor: Coloors.greenDark,
            title: const Text('English'),
            subtitle: Text("Phone's Language",
              style:TextStyle(
                color: context.customTheme.greyColor,
              ) ,
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: false,
            onChanged: (value){},
            activeColor: Coloors.greenDark,
            title: const Text('amˈharɪk'),
            subtitle: Text('Amharic',
              style:TextStyle(
                color: context.customTheme.greyColor,

              ) ,
            ),
          )
        ],
      ),
    );
  },
  );
}



  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.customTheme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
      onTap: ()=> showButtonSheet(context) ,
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.customTheme.langBtnHighlightColor,
        child: Padding(
            padding:
            EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
           child: Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               Icon(
                 Icons.language,
               color: Coloors.greenDark,
               ),
               SizedBox(width: 10,),
               Text('English',
                 style: TextStyle(
                   color: Coloors.greenDark,
                 ),
               ),
               Icon(Icons.keyboard_arrow_down,color:  Coloors.greenDark)
             ],
           ),
        ),
      ),
    );
  }
}
