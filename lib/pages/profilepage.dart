import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Profilepage extends StatelessWidget {
  Profilepage({super.key});

  List<String> skills = [
    "Leadership",
    "Team",
    "Visioner",
    "Target Oriented",
    "Target Oriented",
    "Team",
  ];
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    context,
                    icon: Icons.work_outline,
                    label: "Jobs Applied",
                    value: "20",
                    color: AppColors.TxtblueColor,
                    iconBg: AppColors.TxtblueColor.withOpacity(0.1),
                  ),
                  SizedBox(width: AppDimensions.getScreenWidth(context) * 0.04),
                  _buildStatCard(
                    context,
                    icon: Icons.favorite_border,
                    label: "Favorites",
                    value: "8",
                    color: AppColors.TxtOrangeColor,
                    iconBg: AppColors.TxtOrangeColor.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "About Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    aboutMeTextBox("Contact", "+91 12345 12345"),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    aboutMeTextBox("Category", "Non-Skilled"),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    aboutMeTextBox("City", "Mehsana"),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            //Skilled Profile Widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "Education Information",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.09,
                          height: AppDimensions.getScreenWidth(context) * 0.09,
                          decoration: BoxDecoration(
                            color: AppColors.TxtOrangeColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.plus,
                              color: AppColors.TxtOrangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    educationTextBox("SSC-Xyz school", "12 Aug 2020"),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    educationTextBox("HSC-Abc school", "18 Aug 2022"),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    educationTextBox("HSC-Abc school", "18 Aug 2022"),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            //Skilled Profile Widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "Skills",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.09,
                          height: AppDimensions.getScreenWidth(context) * 0.09,
                          decoration: BoxDecoration(
                            color: AppColors.TxtOrangeColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.plus,
                              color: AppColors.TxtOrangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          skills.map((category) {
                            return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.TxtblueColor.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: AppColors.TxtblueColor,
                                    fontSize: ScreenSizeConfig.fontSize - 1,
                                    fontFamily: TextFont.PoppinsRegular,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "Total Applied Jobs",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.09,
                          height: AppDimensions.getScreenWidth(context) * 0.09,
                          decoration: BoxDecoration(
                            color: AppColors.TxtOrangeColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "20",
                              style: TextStyle(
                                color: AppColors.TxtOrangeColor,
                                fontSize: ScreenSizeConfig.fontSize - 1,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    totAppjobTextBox(
                      "User Experience Designer",
                      "Slack | Remote",
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    totAppjobTextBox(
                      "User Experience Designer",
                      "Slack | Remote",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "Favorite Jobs",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.09,
                          height: AppDimensions.getScreenWidth(context) * 0.09,
                          decoration: BoxDecoration(
                            color: AppColors.TxtblueColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "20",
                              style: TextStyle(
                                color: AppColors.TxtblueColor,
                                fontSize: ScreenSizeConfig.fontSize - 1,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    favJobTextBox("User Experience Designer", "Slack | Remote"),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    favJobTextBox("User Experience Designer", "Slack | Remote"),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: AppColors.TxtOrangeColor,
                          size: 28,
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.02,
                        ),
                        Text(
                          "Help & Support",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSizeConfig.fontSize + 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset(
                //   Assets.editProfileLogoutImg,
                //   width: 100,
                //   height: 100,
                // ),
                commonSpace(10, 0),
                Text(
                  "Are You Sure You Want To Logout ?",
                  style: CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize + 2,
                    color: Colors.black,
                    fontFamily: TextFont.PoppinsSemiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                commonSpace(10, 0),
                Text(
                  "You have successfully logged out. See you again soon! Stay connected and come back anytime.",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize - 1,
                    color: Color(0xff878787),
                    fontFamily: TextFont.PoppinsRegular,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                commonSpace(20, 0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xf242A62),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                        },
                        child: Text(
                          "Cancel",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: AppColors.TxtblueColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ),
                    ),

                    // Logout Button
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.TxtblueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Logged out successfully")),
                          );
                        },
                        child: Text(
                          "Logout",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: AppColors.whiteColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget aboutMeTextBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        "$title:- $value",
        style: CustomTextStyle.normalBluecustom(
          fontSize: ScreenSizeConfig.fontSize - 1,
          color: Colors.black,
          fontFamily: TextFont.PoppinsMedium,
        ),
      ),
    );
  }

  Widget educationTextBox(String edicationName, String date) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "$edicationName",
            style: CustomTextStyle.normalBluecustom(
              fontSize: ScreenSizeConfig.fontSize - 1,
              color: Colors.black,
              fontFamily: TextFont.PoppinsMedium,
            ),
          ),
          Spacer(),
          Text(
            "$date",
            style: CustomTextStyle.normalBluecustom(
              fontSize: ScreenSizeConfig.fontSize - 1,
              color: AppColors.TxtOrangeColor,
              fontFamily: TextFont.PoppinsMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget totAppjobTextBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xf192845),
              borderRadius: BorderRadius.circular(
                8,
              ), // Rounded corners like the reference
            ),
            // child: Image.asset(
            //   Assets.activityPageCompnyIcon,
            //   width: 30,
            //   height: 30,
            //   color: AppColors.TxtOrangeColor, // Adjust if needed
            // ),
          ),
          commonSpace(0, 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: Colors.black,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
              Text(
                value,
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize - 2,
                  color: Color(0xff878787),
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget favJobTextBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xf192845),
              borderRadius: BorderRadius.circular(
                8,
              ), // Rounded corners like the reference
            ),
            // child: Image.asset(
            //   Assets.activityPageCompnyIcon,
            //   width: 30,
            //   height: 30,
            //   color: AppColors.TxtOrangeColor, // Adjust if needed
            // ),
          ),
          commonSpace(0, 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Experience Designer",
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: Colors.black,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
              Text(
                "Slack | Remote",
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize - 2,
                  color: Color(0xff878787),
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget for the stat cards at the top
  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color iconBg,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: color,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
