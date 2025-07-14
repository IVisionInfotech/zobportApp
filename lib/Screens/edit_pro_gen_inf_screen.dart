import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Screens/edit_profile_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Activity/activitypage.dart';

class EditProGenInfScreen extends StatefulWidget {
  const EditProGenInfScreen({super.key});

  @override
  State<EditProGenInfScreen> createState() => _EditProGenInfScreenState();
}

class _EditProGenInfScreenState extends State<EditProGenInfScreen> {
  int selectedIndex = 0;

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
              //     image: DecorationImage(image: AssetImage(Assets.profilePageHeaderBg),fit: BoxFit.contain)
              // ),
              child: Column(
                children: [
                  commonSpace(20, 0),
                  Center(
                    child: Text("My Profile", style: CustomTextStyle.title),
                  ),
                  commonSpace(40, 0),
                  Row(
                    children: [
                      // Image.asset(Assets.profilePageProfilePhoto,height: 55,width: 55,),
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
                      //   child: Image.asset(Assets.profilePageEditIcon,width: 40,height: 40,),
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
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTabButton(0, Icons.info_outline, "General Info"),
                        commonSpace(0, 10),
                        _buildTabButton(1, Icons.work_outline, "Applied Jobs"),
                        commonSpace(0, 10),
                        _buildTabButton(2, Icons.favorite_border, "Favorites"),
                      ],
                    ).marginOnly(right: 15, left: 15),
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: selectedIndex,
                      children: [
                        buildGeneralInfo().marginOnly(
                          left: 15,
                          right: 15,
                          top: 15,
                        ),
                        buildAppliedJobs().marginOnly(top: 15),
                        buildFavorites().marginOnly(top: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(int index, IconData icon, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.TxtblueColor
                  : AppColors.TxtblueColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.white54),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGeneralInfo() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: AppColors.TxtOrangeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.TxtblueColor),
          ),
          child: Row(
            children: [
              // Image.asset(Assets.editProfileCategoryIcon,height: 25,width: 25,),
              commonSpace(0, 10),
              Text(
                "Category: Non-Skilled",
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: AppColors.TxtOrangeColor,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ],
          ),
        ),
        commonSpace(10, 0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Color(0xf99ABC6),
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: AppColors.TxtblueColor)
          ),
          child: Row(
            children: [
              Icon(Icons.phone, color: Colors.black),
              commonSpace(0, 10),
              Text(
                "Contact: +91 12345 12345",
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: AppColors.blackColor,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ],
          ),
        ),
        commonSpace(10, 0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Color(0xf99ABC6),
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: AppColors.TxtblueColor)
          ),
          child: Row(
            children: [
              Icon(Icons.location_city, color: Colors.black),
              commonSpace(0, 10),
              Text(
                "City: Mehsana",
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: AppColors.blackColor,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAppliedJobs() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        JobCard(
          isApplied: true,
          appliedDate: "12/02/2026",
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xffE3F2FD),
          iconColor: Color(0xffffffff),
          textColor: Color(0xff0D47A1),
        ),
        commonSpace(12, 0),
        JobCard(
          isApplied: true,
          appliedDate: "12/02/2026",
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xffE8F5E9),
          iconColor: Color(0xff1B5E20),
          textColor: Color(0xff1B5E20),
        ),
        commonSpace(80, 0),
      ],
    );
  }

  Widget buildFavorites() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        JobCard(
          isApplied: false,
          appliedDate: "12/02/2026",
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xffE3F2FD),
          iconColor: Color(0xffffffff),
          textColor: Color(0xff0D47A1),
        ),
        commonSpace(12, 0),
        JobCard(
          isApplied: false,
          appliedDate: "12/02/2026",
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xffE8F5E9),
          iconColor: Color(0xff1B5E20),
          textColor: Color(0xff1B5E20),
        ),
        commonSpace(80, 0),
      ],
    );
  }
}
