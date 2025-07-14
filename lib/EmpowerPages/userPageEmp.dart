import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Screens/edit_profile_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Userpageemp extends StatelessWidget {
  Userpageemp({super.key});

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
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: getHeight * 0.35,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(Assets.profilePageHeaderBg),
              //     fit: BoxFit.contain,
              //   ),
              // ),
              child: Column(
                children: [
                  commonSpace(20, 0),
                  Row(
                    children: [
                      Text("My Profile", style: CustomTextStyle.title),
                      Spacer(),
                      GestureDetector(
                        child: Container(
                          width: getWidth * 0.3,
                          height: getHeight * 0.05,
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image: AssetImage(Assets.profilePageLogoutBtn),
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          // alignment: Alignment.centerRight,
                          child: Padding(
                            padding: AppDimensions.getPaddingOnly(
                              left: 40,
                              top: 10,
                            ),
                            child: Text(
                              "Logout",
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: Colors.white,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showLogoutDialog(context);
                        },
                      ),
                    ],
                  ),
                  commonSpace(40, 0),
                  Row(
                    children: [
                      // Image.asset(
                      //   Assets.profilePageProfilePhoto,
                      //   height: 55,
                      //   width: 55,
                      // ),
                      commonSpace(0, 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Felipe A. Cothran",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              color: AppColors.TxtOrangeColor,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                          Text(
                            "felipe@gmail.com",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: AppColors.TxtblueColor,
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(EditProfileScreen());
                      //   },
                      //   child: Image.asset(
                      //     Assets.profilePageEditIcon,
                      //     width: 40,
                      //     height: 40,
                      //   ),
                      // ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "20",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                          Text(
                            "Job Applied",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                          ),
                        ],
                      ),
                      commonSpace(0, 10),
                      Container(
                        height: getHeight * 0.07,
                        color: Colors.black,
                        width: 1,
                      ),
                      commonSpace(0, 10),
                      Column(
                        children: [
                          Text(
                            "14/04/2028",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                          Text(
                            "Membership Expired",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                          ),
                        ],
                      ),
                      commonSpace(0, 10),
                      Container(
                        height: getHeight * 0.07,
                        color: Colors.black,
                        width: 1,
                      ),
                      commonSpace(0, 10),
                      Column(
                        children: [
                          Text(
                            "20",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                          Text(
                            "Job Applied",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 2,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ).marginAll(18),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.TxtblueColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor: Colors.orange[300],
                              //   child: Icon(Icons.person, color: Colors.white),
                              // ),
                              // Image.asset(
                              //   Assets.profilePageAboutmeIcon,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              commonSpace(0, 10),
                              Text(
                                "About Me",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: Colors.black,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                            ],
                          ),
                          commonSpace(16, 0),
                          aboutMeTextBox("Contact", "+91 12345 12345"),
                          aboutMeTextBox("Category", "Non-Skilled"),
                          aboutMeTextBox("City", "Mehsana"),
                        ],
                      ),
                    ).marginAll(18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.TxtblueColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor: Colors.orange[300],
                              //   child: Icon(Icons.person, color: Colors.white),
                              // ),
                              // Image.asset(
                              //   Assets.profilePageWorkbagIcon,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              commonSpace(0, 10),
                              Text(
                                "Total Jobs Posted",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: Colors.black,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width:
                                    AppDimensions.getScreenWidth(context) *
                                    0.08,
                                height:
                                    AppDimensions.getScreenHeight(context) *
                                    0.05,

                                decoration: BoxDecoration(
                                  color: Color(0xffF26824).withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text("20")),
                              ),
                            ],
                          ),
                          commonSpace(16, 0),
                          totAppjobTextBox(
                            "User Experience Designer",
                            "Slack | Remote",
                          ),
                          totAppjobTextBox(
                            "User Experience Designer",
                            "Slack | Remote",
                          ),
                        ],
                      ),
                    ).marginAll(18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.TxtblueColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor: Colors.orange[300],
                              //   child: Icon(Icons.person, color: Colors.white),
                              // ),
                              // Icon(CupertinoIcons.heart,color: AppColors.TxtblueColor,),
                              // Image.asset(Assets.empExp,height: 30,width: 30,),
                              commonSpace(0, 10),
                              Text(
                                "Expired Jobs",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: Colors.black,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width:
                                    AppDimensions.getScreenWidth(context) *
                                    0.08,
                                height:
                                    AppDimensions.getScreenHeight(context) *
                                    0.05,

                                decoration: BoxDecoration(
                                  color: Color(0xff242A62).withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "04",
                                    style: CustomTextStyle.normalBluecustom(
                                      fontSize: ScreenSizeConfig.fontSize,
                                      color: Colors.black,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          commonSpace(16, 0),
                          favJobTextBox(
                            "User Experience Designer",
                            "Slack | Remote",
                          ),
                          favJobTextBox(
                            "User Experience Designer",
                            "Slack | Remote",
                          ),
                        ],
                      ),
                    ).marginAll(18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.TxtblueColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor: Colors.orange[300],
                              //   child: Icon(Icons.person, color: Colors.white),
                              // ),
                              Icon(
                                CupertinoIcons.question_circle,
                                color: AppColors.TxtblueColor,
                              ),
                              // Image.asset(Assets.profilePage,height: 30,width: 30,),
                              commonSpace(0, 10),
                              Text(
                                "Help & Support",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: Colors.black,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width:
                                    AppDimensions.getScreenWidth(context) *
                                    0.08,
                                height:
                                    AppDimensions.getScreenHeight(context) *
                                    0.03,
                                decoration: BoxDecoration(
                                  color: Color(0xfff242A62).withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    color: AppColors.TxtblueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).marginAll(18),
                    commonSpace(80, 0),
                  ],
                ),
              ),
            ),
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
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 4, // Softness of the shadow
            spreadRadius: 1, // How much the shadow spreads
            offset: Offset(0, 0), // Position: X (horizontal), Y (vertical)
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
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 4, // Softness of the shadow
            spreadRadius: 1, // How much the shadow spreads
            offset: Offset(0, 0), // Position: X (horizontal), Y (vertical)
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
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 30, // Softness of the shadow
            spreadRadius: 1, // How much the shadow spreads
            offset: Offset(0, 5), // Position: X (horizontal), Y (vertical)
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
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 30, // Softness of the shadow
            spreadRadius: 1, // How much the shadow spreads
            offset: Offset(0, 5), // Position: X (horizontal), Y (vertical)
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
}
