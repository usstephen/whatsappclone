
import 'package:flutter/material.dart';
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.lightDark,
        foregroundColor: Coloors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
  );
}