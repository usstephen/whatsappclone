
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappclone/Common/extension/custom_theme_extension.dart';

import '../Utils/Coloors.dart';

ThemeData Light_theme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    dialogBackgroundColor: Coloors.backgroundLight,
    scaffoldBackgroundColor: Coloors.backgroundLight,
    extensions: [
      CustomThemeExtension.lightMode
    ],
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.lightDark,
        foregroundColor: Coloors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Coloors.backgroundLight,
        modalBackgroundColor: Coloors.backgroundLight,
        shape: RoundedRectangleBorder
          (borderRadius:
        BorderRadius.vertical
          (top: Radius.circular(20)
        )
        )
    ),
  );
}