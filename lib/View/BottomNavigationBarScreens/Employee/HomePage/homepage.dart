import 'package:flutter/material.dart';
import 'package:gotilo_job/Screens/job_details_screen.dart';
import 'package:gotilo_job/Screens/resume_builder_next_screen.dart';
import 'package:gotilo_job/Screens/uploadcv_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textEditingController = TextEditingController();

  final PageController _pageController = PageController(viewportFraction: 1);
  ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  List<Map<String, String>> jobListindustrial = [
    {
      'title': 'Welder',
      'company': 'XYZ Pvt Ltd',
      'salary': '₹1,000 - ₹20,000 / Month',
      'location': 'Ahmedabad, GIDC',
    },
    {
      'title': 'Electrician',
      'company': 'ABC Industries',
      'salary': '₹15,000 - ₹30,000 / Month',
      'location': 'Mumbai, Maharashtra',
    },
    {
      'title': 'Mechanical Engineer',
      'company': 'DEF Corporation',
      'salary': '₹25,000 - ₹50,000 / Month',
      'location': 'Bangalore, Karnataka',
    },
  ];

  List<Map<String, String>> jobListFullTime = [
    {
      'title': 'Welder',
      'company': 'XYZ Pvt Ltd',
      'salary': '₹1,000 - ₹20,000 / Month',
      'location': 'Ahmedabad, GIDC',
    },
    {
      'title': 'Electrician',
      'company': 'ABC Industries',
      'salary': '₹15,000 - ₹30,000 / Month',
      'location': 'Mumbai, Maharashtra',
    },
    {
      'title': 'Mechanical Engineer',
      'company': 'DEF Corporation',
      'salary': '₹25,000 - ₹50,000 / Month',
      'location': 'Bangalore, Karnataka',
    },
  ];

  final List<String> imageList = [
    "assets/images/partner.jpg",
    "assets/images/partner.jpg",
    "assets/images/partner.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // This prevents keyboard from pushing up the UI
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: getHeight * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/slider.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_rounded, color: Colors.amberAccent),
                            SizedBox(width: 8),
                            Text(
                              "Top Job In This Month",
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize + 2,
                                color: Colors.white,
                                fontFamily: TextFont.PoppinsSemiBold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              AppDimensions.getScreenHeight(context) * 0.014,
                        ),
                        Text(
                          "Skilled Industrial Machine Operators – Powering Manufacturing Excellence!",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Terms & Condition Apply *",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize - 2,
                                  color: Colors.white70,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 12),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.explore,
                                      color: AppColors.TxtblueColor,
                                      size: 20,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Explore",
                                      style: CustomTextStyle.normalBluecustom(
                                        fontSize: ScreenSizeConfig.fontSize + 1,
                                        color: AppColors.TxtblueColor,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            customSearchBar(textEditingController, () {
              FocusScope.of(context).unfocus();
              showSearchJobPopup(context);
              FocusScope.of(context).unfocus();
            }, context),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.024),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Icon(Icons.category_outlined, color: AppColors.TxtblueColor),
            //       SizedBox(
            //         width: AppDimensions.getScreenWidth(context) * 0.014,
            //       ),
            //       Text(
            //         "Job Categories",
            //         style: TextStyle(
            //           color: AppColors.TxtblueColor,
            //           fontSize: ScreenSizeConfig.fontSize + 2,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        color: AppColors.TxtblueColor,
                      ),
                      SizedBox(
                        width: AppDimensions.getScreenWidth(context) * 0.014,
                      ),
                      Text(
                        "Job Categories",
                        style: TextStyle(
                          color: AppColors.TxtblueColor,
                          fontSize: ScreenSizeConfig.fontSize + 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: _currentPage,
                    builder: (context, currentPage, _) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap:
                                currentPage > 0
                                    ? () {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                    : null,
                            child: Container(
                              alignment: Alignment.center,
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    currentPage > 0
                                        ? AppColors.TxtOrangeColor.withOpacity(
                                          0.15,
                                        )
                                        : Colors.grey.withOpacity(0.1),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 18,
                                color:
                                    currentPage > 0
                                        ? AppColors.TxtOrangeColor
                                        : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap:
                                currentPage < 1
                                    ? () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                    : null,
                            child: Container(
                              alignment: Alignment.center,
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    currentPage < 1
                                        ? AppColors.TxtOrangeColor.withOpacity(
                                          0.15,
                                        )
                                        : Colors.grey.withOpacity(0.1),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color:
                                    currentPage < 1
                                        ? AppColors.TxtOrangeColor
                                        : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.006),
            Container(
              height: getHeight * 0.22, // Increased height for 2 rows
              child: PageView.builder(
                // physics: BouncingScrollPhysics(),
                // itemCount:
                //     2, // Number of pages (adjust if you have more categories)
                // controller: PageController(viewportFraction: 1),
                physics: BouncingScrollPhysics(),
                itemCount: 2,
                controller: _pageController,
                onPageChanged: (index) {
                  _currentPage.value = index;
                },
                itemBuilder: (context, pageIndex) {
                  // Example categories (replace with your actual categories)
                  final List<Map<String, dynamic>> categories = [
                    {"icon": Icons.engineering, "label": "Engineering"},
                    {"icon": Icons.computer, "label": "IT & Software"},
                    {"icon": Icons.local_hospital, "label": "Healthcare"},
                    {"icon": Icons.store, "label": "Retail"},
                    {"icon": Icons.school, "label": "Education"},
                    {"icon": Icons.build, "label": "Construction"},
                    {"icon": Icons.restaurant, "label": "Hospitality"},
                    {"icon": Icons.attach_money, "label": "Finance"},
                  ];

                  // Calculate start and end index for this page
                  int start = pageIndex * 4;
                  int end = (start + 4).clamp(0, categories.length);
                  final pageCategories = categories.sublist(start, end);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: List.generate(2, (i) {
                              if (i >= pageCategories.length ~/ 2)
                                return Expanded(child: SizedBox());
                              final cat = pageCategories[i];
                              // Add right margin for 0th category
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: i == 0 ? 12 : 0,
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.TxtblueColor.withOpacity(
                                      0.08,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.TxtblueColor.withOpacity(
                                        0.13,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors
                                            .TxtblueColor.withOpacity(0.15),
                                        radius: 22,
                                        child: Icon(
                                          cat["icon"],
                                          color: AppColors.TxtblueColor,
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          cat["label"],
                                          style: TextStyle(
                                            fontSize: ScreenSizeConfig.fontSize,
                                            color: AppColors.TxtblueColor,
                                            fontFamily: TextFont.PoppinsMedium,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          Row(
                            children: List.generate(2, (i) {
                              int idx = i + 2;
                              if (idx >= pageCategories.length)
                                return Expanded(child: SizedBox());
                              final cat = pageCategories[idx];
                              // Add right margin for 2nd category (i == 0 means idx == 2)
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: i == 0 ? 12 : 0,
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.TxtblueColor.withOpacity(
                                      0.08,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.TxtblueColor.withOpacity(
                                        0.13,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors
                                            .TxtblueColor.withOpacity(0.15),
                                        radius: 22,
                                        child: Icon(
                                          cat["icon"],
                                          color: AppColors.TxtblueColor,
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          cat["label"],
                                          style: TextStyle(
                                            fontSize: ScreenSizeConfig.fontSize,
                                            color: AppColors.TxtblueColor,
                                            fontFamily: TextFont.PoppinsMedium,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.016),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.history, color: AppColors.TxtblueColor),
                  SizedBox(
                    width: AppDimensions.getScreenWidth(context) * 0.014,
                  ),
                  Text(
                    "Recent Jobs",
                    style: TextStyle(
                      color: AppColors.TxtblueColor,
                      fontSize: ScreenSizeConfig.fontSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            jobCardListindustrial(getHeight, getWidth),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.024),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.apartment_outlined, color: AppColors.TxtblueColor),
                  SizedBox(
                    width: AppDimensions.getScreenWidth(context) * 0.014,
                  ),
                  Text(
                    "Official Partners",
                    style: TextStyle(
                      color: AppColors.TxtblueColor,
                      fontSize: ScreenSizeConfig.fontSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: AppColors.TxtblueColor,
                        fontSize: ScreenSizeConfig.fontSize + 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: getHeight * 0.13, // Adjust height as needed
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: AppDimensions.getScreenWidth(context) * 0.04,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.TxtblueColor,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            imageList[index],
                            width: 150,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            GestureDetector(
              onTap: () {
                showLogoutDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.only(
                    right: AppDimensions.getScreenWidth(context) * 0.04,
                    left: AppDimensions.getScreenWidth(context) * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.TxtblueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  height: getHeight * 0.14,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Hey, Do You Not Have\nAny Resume ?",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.whiteColor,
                                  fontFamily: TextFont.PoppinsMedium,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height:
                                  AppDimensions.getScreenHeight(context) * 0.01,
                            ),
                            Container(
                              child: Text(
                                "Create resume with our resume builder.",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize - 3,
                                  color: AppColors.whiteColor,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/resume.png",
                        width: 56,
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.history, color: AppColors.TxtblueColor),
                  SizedBox(
                    width: AppDimensions.getScreenWidth(context) * 0.014,
                  ),
                  Text(
                    "Recent Jobs",
                    style: TextStyle(
                      color: AppColors.TxtblueColor,
                      fontSize: ScreenSizeConfig.fontSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            jobCardListFullTime(getHeight, getWidth),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                height: getHeight * 0.12,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(Assets.homeScreenRectangleStay),
                //   ),
                // ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.TxtblueColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Stay Connected, We’re Here to Help!",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize + 2,
                          color: AppColors.TxtblueColor,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                      Text(
                        "Let me know if you need more variations!",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 1,
                          color: AppColors.TxtOrangeColor,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
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
                //   Assets.homeScreenResumPopImg,
                //   width: 100,
                //   height: 100,
                // ),
                commonSpace(10, 0),
                Text(
                  "Do You Have Any Resume To Upload ?",
                  style: CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize + 2,
                    color: Colors.black,
                    fontFamily: TextFont.PoppinsSemiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                commonSpace(10, 0),
                Text(
                  "upload your resume for profile more visible in portal. If no then don’t worry our resume builder is here!",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadcvScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 45,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage(Assets.homeScreenUploadBtn),
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                        child: Center(
                          child: Text(
                            "Upload",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 1,
                              color: AppColors.TxtblueColor,
                              fontFamily: TextFont.PoppinsSemiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResumeBuilderNextScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 45,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage(Assets.homeScreenBuildcvBtn),
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                        child: Center(
                          child: Text(
                            "Build CV",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 1,
                              color: AppColors.whiteColor,
                              fontFamily: TextFont.PoppinsSemiBold,
                            ),
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

  Widget jobCardListindustrial(double getHeight, double getWidth) {
    return Container(
      // height: getHeight * 0.28, // Set height to fit content
      height: getHeight * 0.264, // Set height to fit content
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal, // Make it scroll horizontally
          itemCount: jobListindustrial.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobDetailsScreen()),
                );
              },
              child: Container(
                width: getWidth * 0.75,
                margin: EdgeInsets.only(
                  right: AppDimensions.getScreenWidth(context) * 0.04,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(10.0),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.3),
                //       spreadRadius: 1,
                //       blurRadius: 1,
                //       offset: Offset(0, 0),
                //     ),
                //   ],
                //   border: Border.all(color: Color(0xffE0E0E0), width: 1),
                // ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffD9D9D9).withOpacity(0.15),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: Border.all(color: Color(0xffE0E0E0), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   Assets.homeScreenMdiCompany,
                          //   width: 50,
                          //   height: 50,
                          // ),
                          Container(
                            width: AppDimensions.getScreenWidth(context) * 0.15,
                            height:
                                AppDimensions.getScreenWidth(context) * 0.15,
                            decoration: BoxDecoration(
                              color: AppColors.TxtblueColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Icon(
                              Icons.apartment,
                              color: AppColors.TxtblueColor,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welder',
                                  style: CustomTextStyle.normalBluecustom(
                                    fontSize: ScreenSizeConfig.fontSize,
                                    color: AppColors.blackColor,
                                    fontFamily: TextFont.PoppinsSemiBold,
                                  ),
                                ),
                                Text(
                                  'xyz company priva',
                                  style: CustomTextStyle.normalBluecustom(
                                    fontSize: ScreenSizeConfig.fontSize,
                                    color: Color(0xff878787),
                                    fontFamily: TextFont.PoppinsRegular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.01,
                      ),
                      Divider(color: Color(0xffD4D4D4), thickness: 1.5),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            size: 18,
                            color: AppColors.TxtblueColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '1,000 - 20,000 / Months',
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: AppColors.blackColor,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                        ],
                      ),
                      commonSpace(6, 0),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: AppColors.TxtblueColor,
                          ),
                          commonSpace(0, 5),
                          Text(
                            'Ahmedabad, GIDC',
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: AppColors.blackColor,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: getHeight * 0.05,
                              decoration: BoxDecoration(
                                color: AppColors.TxtOrangeColor.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.category_outlined,
                                    color: AppColors.TxtOrangeColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.getScreenWidth(context) *
                                        0.01,
                                  ),
                                  Text(
                                    'Industrial',
                                    style: CustomTextStyle.customStyle(
                                      fontSize: ScreenSizeConfig.fontSize - 1,
                                      color: AppColors.TxtOrangeColor,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          commonSpace(0, 10),
                          Expanded(
                            child: Container(
                              height: getHeight * 0.05,
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.category_outlined,
                                    color: AppColors.TxtblueColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.getScreenWidth(context) *
                                        0.01,
                                  ),
                                  Text(
                                    'Industrial',
                                    style: CustomTextStyle.customStyle(
                                      fontSize: ScreenSizeConfig.fontSize - 1,
                                      color: AppColors.TxtblueColor,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget jobCardListFullTime(double getHeight, double getWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: getHeight * 0.22, // Set height to fit content
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal, // Make it scroll horizontally
          itemCount: jobListindustrial.length,
          itemBuilder: (context, index) {
            return Container(
              width: getWidth * 0.75,
              margin: EdgeInsets.only(
                right: AppDimensions.getScreenWidth(context) * 0.04,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.05),
                //     blurRadius: 6,
                //     offset: Offset(0, 2),
                //   ),
                // ],
                border: Border.all(color: Color(0xffE0E0E0), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   Assets.homeScreenMdiCompany,
                        //   width: 50,
                        //   height: 50,
                        // ),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.15,
                          height: AppDimensions.getScreenWidth(context) * 0.15,
                          decoration: BoxDecoration(
                            color: AppColors.TxtblueColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Icon(
                            Icons.apartment,
                            color: AppColors.TxtblueColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welder',
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.blackColor,
                                  fontFamily: TextFont.PoppinsSemiBold,
                                ),
                              ),
                              Text(
                                'xyz company private....',
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: Color(0xff878787),
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.01,
                    ),
                    Divider(color: Color(0xff99ABC6), thickness: 1.5),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.01,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 18,
                              color: AppColors.TxtblueColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '1,000 - 20,000 / Months',
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: AppColors.blackColor,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                          ],
                        ),
                        commonSpace(6, 0),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: AppColors.TxtblueColor,
                            ),
                            commonSpace(0, 5),
                            Text(
                              'Ahmedabad, GIDC',
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: AppColors.blackColor,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 7,
                              ),
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     image: AssetImage(Assets.homeScreenFullTime),
                              //   ),
                              // ),
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              // height: getHeight * 0.05,
                              // width: getWidth * 0.2,
                              child: Center(
                                child: Text(
                                  'Full-Time',
                                  style: CustomTextStyle.customStyle(
                                    fontSize: ScreenSizeConfig.fontSize - 3,
                                    color: AppColors.TxtblueColor,
                                    // fontFamily: TextFont.PoppinsMedium,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customSearchBar(
    TextEditingController controller,
    VoidCallback onFilterTap,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 54, // Fixed height for consistency
        decoration: BoxDecoration(
          color: AppColors.TxtblueColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.TxtblueColor.withOpacity(0.5),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            // Search Icon
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.search,
                color: AppColors.TxtblueColor,
                size: 24,
              ),
            ),

            // Search Field
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.TxtblueColor,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Search jobs",
                  hintStyle: TextStyle(
                    color: AppColors.TxtblueColor,
                    fontSize: ScreenSizeConfig.fontSize + 1,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                style: TextStyle(
                  color: AppColors.TxtblueColor,
                  fontSize: 16,
                  fontFamily: TextFont.PoppinsMedium,
                ),
              ),
            ),

            // Filter Button
            InkWell(
              onTap: onFilterTap,
              child: Container(
                width: AppDimensions.getScreenWidth(context) * 0.14,
                height: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.TxtblueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.tune, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSearchJobPopup(BuildContext context) {
    int selectedValue = 1;
    String? selectedCategory;
    String? selectedExperience;
    final TextEditingController cityController = TextEditingController();
    final TextEditingController areaController = TextEditingController();
    final TextEditingController pinCodeController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Advanced Job Search",
                          style: TextStyle(
                            fontSize: ScreenSizeConfig.fontSize + 4,
                            fontWeight: FontWeight.bold,
                            color: AppColors.TxtblueColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.TxtblueColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.03,
                    ),
                    // Search Type Toggle
                    Text(
                      "Job Type",
                      style: TextStyle(
                        fontSize: ScreenSizeConfig.fontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedValue = 1),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      selectedValue == 1
                                          ? AppColors.TxtblueColor
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.TxtblueColor,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Skilled",
                                    style: TextStyle(
                                      color:
                                          selectedValue == 1
                                              ? Colors.white
                                              : Colors.grey.shade800,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedValue = 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      selectedValue == 2
                                          ? AppColors.TxtblueColor
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.TxtblueColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Non-Skilled",
                                    style: TextStyle(
                                      color:
                                          selectedValue == 2
                                              ? Colors.white
                                              : Colors.grey.shade800,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),

                    // Category Dropdown
                    Text(
                      "Job Category",
                      style: TextStyle(
                        fontSize: ScreenSizeConfig.fontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedCategory,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.category_outlined,
                            color: AppColors.TxtblueColor,
                          ),
                          hintText: "Select job category",
                        ),
                        items:
                            [
                              "Information Technology",
                              "Finance & Banking",
                              "Healthcare & Medicine",
                              "Education & Teaching",
                              "Construction & Engineering",
                              "Manufacturing",
                              "Retail & Sales",
                              "Hospitality",
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged:
                            (value) => setState(() => selectedCategory = value),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    // Experience Level
                    Text(
                      "Experience Level",
                      style: TextStyle(
                        fontSize: ScreenSizeConfig.fontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedExperience,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.work_history_outlined,
                            color: AppColors.TxtblueColor,
                          ),
                          hintText: "Select experience level",
                        ),
                        items:
                            [
                              "Entry Level (0-2 years)",
                              "Mid Level (2-5 years)",
                              "Senior Level (5+ years)",
                              "Executive Level",
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged:
                            (value) =>
                                setState(() => selectedExperience = value),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Location Section
                    Text(
                      "Location Details",
                      style: TextStyle(
                        fontSize: ScreenSizeConfig.fontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    dynemicTextField(
                      title: "",
                      label: "Enter city",
                      controller: cityController,
                      prefixIcon: Icon(
                        Icons.location_city_outlined,
                        color: AppColors.TxtblueColor,
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),
                    dynemicTextField(
                      title: "",
                      label: "Enter area/locality",
                      controller: areaController,
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: AppColors.TxtblueColor,
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.016,
                    ),

                    dynemicTextField(
                      title: "",
                      label: "Enter pin code",
                      keyboardType: TextInputType.number,
                      controller: pinCodeController,
                      prefixIcon: Icon(
                        Icons.pin,
                        color: AppColors.TxtblueColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Action Buttons
                    Row(
                      children: [
                        // Reset Button as Container
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.TxtblueColor,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                    color: AppColors.TxtblueColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: TextFont.PoppinsSemiBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Search Jobs Button as Container
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Search Jobs",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: TextFont.PoppinsSemiBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
