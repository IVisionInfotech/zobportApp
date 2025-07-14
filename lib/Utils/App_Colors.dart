import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart' show ScreenSizeConfig;

class AppColors {
  static Color blackColor = Colors.black;
  static Color whiteColor = Colors.white;
  static Color TxtblueColor = Color(0xff242A62);
  static Color TxtOrangeColor = Color(0xffF26824);
  static Color TxtIntroColor = Color(0xff6A6A6A);
  static Color TxtWelColor = Color(0xff1E3E62);
  static Color BackgroundColor = Color(0xffF3F4FF);
}

Widget commonSpace(double heightCus, double widthCus) {
  return SizedBox(height: heightCus, width: widthCus);
}

class TextFont {
  static const String PoppinsBold = "Poppins_Bold";
  static const String PoppinsRegular = "Poppins_Regular";
  static const String PoppinsSemiBold = "Poppins_SemiBold";
  static const String PoppinsMedium = "Poppins_Medium";
}

class CustomTextStyle {
  static TextStyle customStyle({
    required double fontSize,
    required Color color,
    FontWeight fontWeight = FontWeight.w500,
    String fontFamily = TextFont.PoppinsRegular,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  // ✅ Now, easy-to-read & consistent names
  static TextStyle introBlue = customStyle(
    fontSize: ScreenSizeConfig.fontSize + 12,
    color: AppColors.TxtblueColor,
    fontFamily: TextFont.PoppinsSemiBold,
  );

  static TextStyle normalBlue = customStyle(
    fontSize: ScreenSizeConfig.fontSize - 1,
    color: AppColors.TxtblueColor,
    fontFamily: TextFont.PoppinsMedium,
  );
  static TextStyle normalBluecustom({
    required double fontSize,
    required Color color,
    final FontWeight? fontWeight,
    final String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight.isNull ? FontWeight.normal : fontWeight,
      fontFamily: fontFamily!.isEmpty ? TextFont.PoppinsRegular : fontFamily,
      decoration: decoration,
    );
  }

  static TextStyle introOrange = customStyle(
    fontSize: ScreenSizeConfig.fontSize + 12,
    color: AppColors.TxtOrangeColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    fontFamily: TextFont.PoppinsBold,
  );

  static TextStyle introSubtitle = customStyle(
    fontSize: ScreenSizeConfig.fontSize - 1,
    color: AppColors.TxtIntroColor,
    fontFamily: TextFont.PoppinsRegular,
  );

  static TextStyle buttonText = customStyle(
    fontSize: ScreenSizeConfig.fontSize,
    color: AppColors.whiteColor,
    fontFamily: TextFont.PoppinsSemiBold,
  );

  static TextStyle title = customStyle(
    fontSize: ScreenSizeConfig.fontSize + 1,
    color: AppColors.TxtblueColor,
    fontFamily: TextFont.PoppinsMedium,
  );

  static TextStyle formHint = customStyle(
    fontSize: ScreenSizeConfig.fontSize,
    color: const Color.fromARGB(255, 153, 153, 153),
    fontFamily: TextFont.PoppinsMedium,
  );

  static TextStyle formError = customStyle(
    fontSize: ScreenSizeConfig.fontSize + 1,
    color: Colors.red,
  );
}

class CommonWidget {
  static Widget cusAppBarWidget(String title, int spaceBtw) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: TextFont.PoppinsMedium,
        fontSize: ScreenSizeConfig.fontSize + 3,
        color: Colors.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  static Widget cusComSequere(VoidCallback onTap, String buttonText) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: ScreenSizeConfig.buttonHeight,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(Assets.registerComRegnexbtn),
        //     fit: BoxFit.contain,
        //   ),
        // ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenSizeConfig.fontSize + 1,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    ).marginOnly(top: 5);
  }
}
