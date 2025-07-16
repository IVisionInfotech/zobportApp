import 'package:flutter/widgets.dart';
import 'package:gotilo_job/Utils/responsive.dart';

class ScreenSizeConfig {
  static late double fontSize;
  static late double titleFontSize; // New variable for title font size
  static late double padding;
  static late double imageHeight;
  static late double buttonWidth;
  static late double spacing;
  static late double buttonHeight;
  static late double popuppadding;
  static late double textfieldVerticalPedding;

  static late String screenCategory;

  // This function returns the screen category based on width
  static String getScreenCategory(double screenWidth) {
    if (screenWidth <= 360) {
      return 'small';
    } else if (screenWidth <= 414) {
      return 'medium';
    } else {
      return 'large';
    }
  }

  static void init(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Set screenCategory based on the screen width
    screenCategory = getScreenCategory(screenWidth);

    if (screenCategory == 'small') {
      fontSize = 14;
      titleFontSize = 21; // Set title font size for small screens
      padding = 12;
      imageHeight = 220;
      buttonWidth = 0.2 * screenWidth;
      spacing = 12;
      buttonHeight = 50;
      popuppadding = 10;
      textfieldVerticalPedding = AppDimensions.getScreenHeight(context) * 0.016;
    } else if (screenCategory == 'medium') {
      fontSize = 16;
      titleFontSize = 22; // Set title font size for medium screens
      padding = 14;
      imageHeight = 260;
      buttonWidth = 0.2 * screenWidth;
      spacing = 12;
      buttonHeight = 52;
      popuppadding = 11;
      textfieldVerticalPedding = AppDimensions.getScreenHeight(context) * 0.018;
    } else if (screenCategory == "large") {
      fontSize = 18;
      titleFontSize = 24; // Set title font size for large screens
      padding = 16;
      imageHeight = 300;
      buttonWidth = 0.2 * screenWidth;
      spacing = 12;
      buttonHeight = 54;
      popuppadding = 12;
      textfieldVerticalPedding = AppDimensions.getScreenHeight(context) * 0.020;
    }
  }
}
