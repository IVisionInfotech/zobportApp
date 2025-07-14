import 'package:flutter/widgets.dart';
import 'package:gotilo_job/Utils/responsive.dart';

// class ScreenSizeConfig {
//   static late double fontSize;
//   static late double padding;
//   static late double imageHeight;
//   static late double buttonWidth;

//   static late String screenCategory;

//   static void init(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth <= 360) {
//       screenCategory = 'small';
//       fontSize = 14;
//       padding = 12;
//       imageHeight = 220;
//       buttonWidth = 0.2 * screenWidth; // Adjust button width for small screens
//     } else if (screenWidth <= 414) {
//       screenCategory = 'medium';
//       fontSize = 16;
//       padding = 16;
//       imageHeight = 260;
//       buttonWidth = 0.2 * screenWidth; // Adjust button width for medium screens
//     } else {
//       screenCategory = 'large';
//       fontSize = 18;
//       padding = 20;
//       imageHeight = 300;
//       buttonWidth = 0.2 * screenWidth; // Adjust button width for large screens
//     }
//   }
// }

// import 'package:flutter/widgets.dart';

// class ScreenSizeConfig {
//   static late double fontSize;
//   static late double padding;
//   static late double imageHeight;
//   static late double buttonWidth;

//   static late String screenCategory;

//   // This function returns the screen category based on width
//   static String getScreenCategory(double screenWidth) {
//     if (screenWidth <= 360) {
//       return 'small';
//     } else if (screenWidth <= 414) {
//       return 'medium';
//     } else {
//       return 'large';
//     }
//   }

//   static void init(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     // Set screenCategory based on the screen width
//     screenCategory = getScreenCategory(screenWidth);

//     if (screenCategory == 'small') {
//       fontSize = 14;
//       padding = 12;
//       imageHeight = 220;
//       buttonWidth = 0.2 * screenWidth;
//     } else if (screenCategory == 'medium') {
//       fontSize = 16;
//       padding = 16;
//       imageHeight = 260;
//       buttonWidth = 0.2 * screenWidth;
//     } else {
//       fontSize = 18;
//       padding = 20;
//       imageHeight = 300;
//       buttonWidth = 0.2 * screenWidth;
//     }
//   }
// }

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

// import 'package:flutter/widgets.dart';

// class ScreenSizeConfig {
//   static late double fontSize;
//   static late double titleFontSize; // Title font size
//   static late double padding;
//   static late double spacing; // New variable for dynamic spacing
//   static late double imageHeight;
//   static late double buttonWidth;

//   static late String screenCategory;

//   // Determine screen category based on width
//   static String getScreenCategory(double screenWidth) {
//     if (screenWidth <= 360) {
//       return 'small';
//     } else if (screenWidth <= 414) {
//       return 'medium';
//     } else {
//       return 'large';
//     }
//   }

//   static void init(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     // Set screenCategory based on screen width
//     screenCategory = getScreenCategory(screenWidth);

//     if (screenCategory == 'small') {
//       fontSize = 14;
//       titleFontSize = 21; // Title font size for small screens
//       padding = 12;
//       spacing = 12; // Small spacing
//       imageHeight = 220;
//       buttonWidth = 0.8 * screenWidth;
//     } else if (screenCategory == 'medium') {
//       fontSize = 16;
//       titleFontSize = 22; // Title font size for medium screens
//       padding = 16;
//       spacing = 16; // Medium spacing
//       imageHeight = 260;
//       buttonWidth = 0.8 * screenWidth;
//     } else if (screenCategory == "large") {
//       fontSize = 18;
//       titleFontSize = 24; // Title font size for large screens
//       padding = 28;
//       spacing = 20; // Large spacing
//       imageHeight = 300;
//       buttonWidth = 0.8 * screenWidth;
//     }
//   }
// }

// import 'package:flutter/widgets.dart';

// class ScreenSizeConfig {
//   static late double fontSize;
//   static late double titleFontSize;
//   static late double padding;
//   static late double spacing;
//   static late double imageHeight;
//   static late double buttonWidth;
//   static late double buttonHeight; // New property for button height

//   static late String screenCategory;

//   static String getScreenCategory(double screenWidth) {
//     if (screenWidth <= 360) {
//       return 'small';
//     } else if (screenWidth <= 414) {
//       return 'medium';
//     } else {
//       return 'large';
//     }
//   }

//   static void init(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     screenCategory = getScreenCategory(screenWidth);

//     if (screenCategory == 'small') {
//       fontSize = 14;
//       titleFontSize = 21;
//       padding = 12;
//       spacing = 12;
//       imageHeight = 220;
//       buttonWidth = 0.2 * screenWidth;
//       buttonHeight = 40; // Small screen button height
//     } else if (screenCategory == 'medium') {
//       fontSize = 16;
//       titleFontSize = 22;
//       padding = 16;
//       spacing = 16;
//       imageHeight = 260;
//       buttonWidth = 0.8 * screenWidth;
//       buttonHeight = 48; // Medium screen button height
//     } else if (screenCategory == "large") {
//       fontSize = 18;
//       titleFontSize = 24;
//       padding = 28;
//       spacing = 20;
//       imageHeight = 300;
//       buttonWidth = 0.2 * screenWidth;
//       buttonHeight = 56; // Large screen button height
//     }
//   }
// }
