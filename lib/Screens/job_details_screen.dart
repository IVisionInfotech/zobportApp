import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final List<String> jobShift = ["Fulltime", "Remote", "Day Shift"];
  final List<String> mustNeed = [
    "Conduct user research to understand customer needs and behaviors.",
    "Analyze feedback, data, and usability testing results to enhance designs.",
    "Create wireframes, mockups, and interactive prototypes.",
    "Work closely with product managers, developers, and stakeholders.",
    "Conduct usability testing and iterate designs based on user feedback.",
  ];
  String education =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  String jobDec =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  List<String> requiredSkills = [
    "Technology & IT",
    "Engineering",
    "Medical",
    "Construction",
    "Finance",
    "Creative & Design",
  ];
  final Map<String, Color> skillColors = {
    "Technology & IT": Colors.amberAccent,
    "Engineering": Colors.green.shade200,
    "Medical": Colors.orange.shade100,
    "Construction": Colors.purple.shade100,
    "Finance": Colors.blueGrey.shade100,
    "Creative & Design": Colors.red.shade100,
  };
  final Map<String, Color> skillTextColors = {
    "Technology & IT": Colors.white,
    "Engineering": Colors.green.shade900,
    "Medical": Colors.orange.shade900,
    "Construction": Colors.purple.shade900,
    "Finance": Colors.blueGrey.shade900,
    "Creative & Design": Colors.red.shade900,
  };
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Job Details",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: InkWell(
              onTap: () {
                // Handle favorite action
              },
              borderRadius: BorderRadius.circular(8),
              child: Center(
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.TxtblueColor,
                  size: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: InkWell(
              onTap: () {
                // Handle share action
              },
              borderRadius: BorderRadius.circular(8),
              child: Center(
                child: Icon(
                  Icons.share,
                  color: AppColors.TxtblueColor,
                  size: 22,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimensions.getScreenWidth(context) * 0.02),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.business,
                      size: 40,
                      color: AppColors.TxtblueColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xyz Private LTD.",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 3,
                              color: AppColors.blackColor,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Senior Machine Engineer Ahmedabad",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: Color(0xff878787),
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    jobShift
                        .map(
                          (tag) => Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                // horizontal: 16,
                                vertical: 8,
                              ),
                              // margin: EdgeInsets.symmetric(horizontal: 5),
                              margin:
                                  tag != jobShift.last
                                      ? EdgeInsets.only(right: 8)
                                      : EdgeInsets.zero,
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor.withOpacity(0.1),
                                // border: Border.all(
                                //   color: Color(0xff8286A9),
                                //   width: 1.5,
                                // ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.TxtblueColor,
                                  fontFamily: TextFont.PoppinsMedium,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.attach_money,
                      size: 32,
                      color: AppColors.TxtblueColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salary",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 2,
                          color: Color(0xff6F6F6F),
                          fontFamily: TextFont.PoppinsRegular,
                        ),
                      ),
                      commonSpace(5, 0),
                      Text(
                        "\$500 - \$1,000/monthly",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: Colors.black,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: AppColors.TxtblueColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 2,
                          color: Color(0xff6F6F6F),
                          fontFamily: TextFont.PoppinsRegular,
                        ),
                      ),
                      commonSpace(5, 0),
                      Text(
                        "Medan, Indonesia",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: Colors.black,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy_outlined,
                    color: AppColors.TxtblueColor,
                    size: 24,
                  ),
                  commonSpace(0, 10),
                  Text("Must Needed", style: CustomTextStyle.title),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    mustNeed
                        .map(
                          (task) => Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.TxtblueColor,
                                  size: 24,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    task,
                                    style: CustomTextStyle.normalBluecustom(
                                      fontSize: ScreenSizeConfig.fontSize,
                                      color: Color(0xff313131),
                                      fontFamily: TextFont.PoppinsRegular,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: AppColors.TxtblueColor,
                    size: 24,
                  ),
                  commonSpace(0, 10),
                  Text("Required Education", style: CustomTextStyle.title),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                education,
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: Color(0xff313131),
                  fontFamily: TextFont.PoppinsRegular,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: AppColors.TxtblueColor,
                    size: 24,
                  ),
                  commonSpace(0, 10),
                  Text("Required Skills", style: CustomTextStyle.title),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.016),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    requiredSkills.map((category) {
                      return GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 14,
                          ),
                          decoration: BoxDecoration(
                            color: skillColors[category],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: skillTextColors[category],
                              // fontFamily: Assets.fontsPoppinsMedium,
                              fontSize: ScreenSizeConfig.fontSize,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Image.asset(
                  //   Assets.jobDetailsJobDecIcon,
                  //   height: 20,
                  //   width: 20,
                  // ),
                  commonSpace(0, 10),
                  Text("Job Description", style: CustomTextStyle.title),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                jobDec,
                style: CustomTextStyle.normalBluecustom(
                  fontSize: ScreenSizeConfig.fontSize,
                  color: Color(0xff313131),
                  fontFamily: TextFont.PoppinsRegular,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFE0E0E0), // Light gray color
                height: 1,
                thickness: 0.7, // Reduced thickness
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: AppColors.TxtblueColor,
                    size: 24,
                  ),
                  commonSpace(0, 10),
                  Text("Interviewer Details", style: CustomTextStyle.title),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
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
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    // Image.asset(
                    //   Assets.jobDetailsCompnyDetailIcon,
                    //   height: 60,
                    //   width: 60,
                    // ),
                    commonSpace(0, 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xyz Private LTD.",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              fontFamily: TextFont.PoppinsMedium,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "+91 1234 1234",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              fontFamily: TextFont.PoppinsRegular,
                              color: Color(0xff878787),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Call Button
                    // Image.asset(
                    //   Assets.jobDetailsPhoneIcon,
                    //   height: 35,
                    //   width: 35,
                    // ),
                  ],
                ),
              ),
            ),
            // commonSpace(50, 0),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.all(16),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Handle filter apply action
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: AppColors.TxtblueColor,
            //       padding: EdgeInsets.symmetric(vertical: 12),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //     child: Text(
            //       "Apply This Job",
            //       style: TextStyle(
            //         fontSize: ScreenSizeConfig.fontSize,
            //         fontFamily: Assets.fontsPoppinsSemiBold,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  // Handle apply job action
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: ScreenSizeConfig.buttonHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.TxtblueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Apply This Job",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSizeConfig.fontSize,
                      fontFamily: TextFont.PoppinsMedium,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
          ],
        ),
      ),
    );
  }

  Widget cusAppBarWidget(String title, int spaceBtw) {
    return Container(
      height: AppDimensions.getScreenHeight(context) * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 4, // Blur intensity
            spreadRadius: 1, // Spread radius
            offset: Offset(0, 1), // Shadow position (X, Y)
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          // GestureDetector(
          //   onTap: () {
          //     // Get.back();
          //     Navigator.pop(context);
          //   },
          //   child: Image.asset(
          //     Assets.registerComBackbtn,
          //     width: AppDimensions.getScreenWidth(context) * 0.1,
          //   ),
          // ),
          SizedBox(width: spaceBtw.toDouble()),
          Text(
            title,
            style: CustomTextStyle.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          // GestureDetector(
          //   onTap: () {},
          //   child: Image.asset(
          //     Assets.homeScreenFavoriteAppbar,
          //     height: 30,
          //     width: 30,
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Image.asset(
          //     Assets.homeScreenShareAppbar,
          //     height: 30,
          //     width: 30,
          //   ),
          // ),
        ],
      ),
    );
  }
}
