import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/custom_radio_button.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/pages/homepage.dart';

class Statuspageemp extends StatefulWidget {
  const Statuspageemp({super.key});

  @override
  State<Statuspageemp> createState() => _StatuspageempState();
}

class _StatuspageempState extends State<Statuspageemp> {
  TextEditingController textEditingController = TextEditingController();
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
  List<String> categories = [
    "Technology & IT",
    "Engineering",
    "Medical",
    "Construction",
    "Finance",
    "Creative & Design",
  ];
  List<String> subcategories = [
    "App Development",
    "Web Developer",
    "Data Scientist",
    "Cybersecurity",
  ];
  final Map<String, Color> categoryColors = {
    "Technology & IT": Colors.amberAccent,
    "Engineering": Colors.green.shade200,
    "Medical": Colors.orange.shade100,
    "Construction": Colors.purple.shade100,
    "Finance": Colors.blueGrey.shade100,
    "Creative & Design": Colors.red.shade100,
  };
  final Map<String, Color> subCategoryColors = {
    "App Development": Colors.amberAccent,
    "Web Developer": Colors.green.shade200,
    "Data Scientist": Colors.orange.shade100,
    "Cybersecurity": Colors.purple.shade100,
  };
  final Map<String, Color> subTextColors = {
    "App Development": Colors.white,
    "Web Developer": Colors.green.shade900,
    "Data Scientist": Colors.orange.shade900,
    "Cybersecurity": Colors.purple.shade900,
  };
  int minSalary = 2000;
  int maxSalary = 50000;
  List<String> jobRoutine = ["Part Time", "Full Time", "Remote"];
  List<String> jobShift = ["Day", "Night", "Both"];
  List<String> selectedJobRoutine = [];
  List<String> selectedJobShift = [];
  final Map<String, Color> textColors = {
    "Technology & IT": Colors.white,
    "Engineering": Colors.green.shade900,
    "Medical": Colors.orange.shade900,
    "Construction": Colors.purple.shade900,
    "Finance": Colors.blueGrey.shade900,
    "Creative & Design": Colors.red.shade900,
  };
  String? selectedCategory = "Technology & IT";
  String? selectedSubCategory;

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonSpace(10, 0),
            customSearchBar(textEditingController, () {
              FocusScope.of(context).unfocus();
              showSearchJobPopup(context);
            }, context).marginOnly(top: 13, left: 13, right: 13),
            commonSpace(20, 0),

            // Tab row
            SizedBox(
              width: getWidth,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      width: getWidth / 2 - 10,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedTabIndex == 0
                                ? AppColors.TxtblueColor
                                : Color(0xffEAEAEA),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Active",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: 13,
                          color:
                              selectedTabIndex == 0
                                  ? AppColors.whiteColor
                                  : Color(0xff878787),
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      width: getWidth / 2 - 10,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedTabIndex == 1
                                ? AppColors.TxtblueColor
                                : Color(0xffEAEAEA),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Expired",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: 13,
                          color:
                              selectedTabIndex == 1
                                  ? AppColors.whiteColor
                                  : Color(0xff878787),
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).marginOnly(left: 10, right: 10),

            commonSpace(20, 0),

            // Conditional content
            selectedTabIndex == 0
                ? jobCardListindustrial(getHeight, getWidth)
                : jobCardListExpired(getHeight, getWidth),
            // Add this function for expired list
          ],
        ),
      ),
    );
  }

  Widget customSearchBar(
    TextEditingController controller,
    VoidCallback onFilterTap,
    BuildContext context,
  ) {
    return Container(
      height: AppDimensions.getScreenHeight(context) * 0.07,
      decoration: BoxDecoration(
        // color: AppColors.appGery,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD9D9D9), width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                textAlign: TextAlign.left,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Search....",
                  contentPadding: EdgeInsets.only(top: 18),
                  hintStyle: TextStyle(
                    color: Color(0xFF252A5B),
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: onFilterTap,
                    child: Container(
                      alignment: Alignment.center,
                      width: AppDimensions.getScreenWidth(context) * 0.12,
                      decoration: BoxDecoration(
                        color: AppColors.TxtOrangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      // child: Image.asset(
                      //   Assets.homeScreenFilterIcon,
                      //   width: 20,
                      //   height: 20,
                      // ),
                    ),
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSearchJobPopup(BuildContext context) {
    int selectedValue = 1;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (context, setState) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Image.asset(
                            //   Assets.homeScreenFilterJobPop,
                            //   width: 20,
                            //   height: 20,
                            // ),
                            commonSpace(0, 8),
                            Text(
                              "Search Job",
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize + 2,
                                color: AppColors.TxtblueColor,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                          ],
                        ),
                        commonSpace(25, 0),
                        Container(
                          height: AppDimensions.getScreenHeight(context) * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.5,
                              color: Color(0xffD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // Removes underline
                              enabledBorder: InputBorder.none,
                              // Removes underline when inactive
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.TxtblueColor,
                                size: 20,
                              ),
                              hintText: "Search",

                              hintStyle: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: AppColors.TxtblueColor,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                            style: CustomTextStyle.formHint,
                            cursorColor: AppColors.TxtOrangeColor,
                          ),
                        ),
                        commonSpace(25, 0),
                        Text(
                          "Select Category",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomRadioButton(
                                text: "Skilled",
                                isBlueBorder: true,
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                            ),
                            commonSpace(0, 10),
                            Expanded(
                              child: CustomRadioButton(
                                text: "Non-Skilled",
                                value: 2,
                                isBlueBorder: true,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select Category",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              categories.map((category) {
                                bool isSelected = category == selectedCategory;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // If already selected, unselect it; otherwise, select new one
                                      selectedCategory =
                                          isSelected ? null : category;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.indigo
                                              : categoryColors[category],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    // child: Text(
                                    //   category,
                                    //   style: TextStyle(
                                    //     color:
                                    //         isSelected
                                    //             ? Colors.white
                                    //             : textColors[category],
                                    //     fontFamily: Assets.fontsPoppinsMedium,
                                    //     fontSize: ScreenSizeConfig.fontSize,
                                    //   ),
                                    // ),
                                  ),
                                );
                              }).toList(),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select From $selectedCategory",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              subcategories.map((category) {
                                bool isSelected =
                                    category == selectedSubCategory;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSubCategory =
                                          isSelected ? null : category;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 13,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.indigo
                                              : subCategoryColors[category],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      category,
                                      // style: TextStyle(
                                      //   color:
                                      //       isSelected
                                      //           ? Colors.white
                                      //           : subTextColors[category],
                                      //   fontFamily: Assets.fontsPoppinsMedium,
                                      //   fontSize: ScreenSizeConfig.fontSize,
                                      // ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select Salary Range",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5.0, // Track height
                            thumbColor: Colors.white, // White thumb color
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 12.0,
                            ), // Bigger thumb
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 20.0,
                            ), // Overlay size
                          ),
                          child: RangeSlider(
                            activeColor: AppColors.TxtblueColor,
                            inactiveColor: Color(0xffd7d7de),
                            values: RangeValues(
                              minSalary.toDouble(),
                              maxSalary.toDouble(),
                            ),
                            min: 2000,
                            // Minimum salary
                            max: 100000,
                            // Updated Maximum Salary (100K)
                            onChanged: (RangeValues values) {
                              setState(() {
                                minSalary = values.start.toInt();
                                maxSalary = values.end.toInt();
                              });
                            },
                          ),
                        ),
                        Text(
                          "₹${minSalary ~/ 1000}k/M - ₹${maxSalary ~/ 1000}k/M",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select Job Routine",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              jobRoutine.map((job) {
                                bool isSelected = selectedJobRoutine.contains(
                                  job,
                                );
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedJobRoutine.remove(job);
                                      } else if (selectedJobRoutine.length <
                                          3) {
                                        selectedJobRoutine.add(job);
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppColors.TxtblueColor
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xffD9D9D9),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      job,
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : AppColors.TxtblueColor,
                                        fontSize: ScreenSizeConfig.fontSize - 2,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select Job Shift",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              jobShift.map((job) {
                                bool isSelected = selectedJobShift.contains(
                                  job,
                                );
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedJobShift.remove(job);
                                      } else if (selectedJobShift.length < 3) {
                                        selectedJobShift.add(job);
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 22,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppColors.TxtblueColor
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xffD9D9D9),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Text(
                                      job,
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : AppColors.TxtblueColor,
                                        fontSize: ScreenSizeConfig.fontSize - 2,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Job Distance",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Colors.black,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        commonSpace(10, 0),
                        Container(
                          height: AppDimensions.getScreenHeight(context) * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.5,
                              color: Color(0xffD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // Removes underline
                              enabledBorder: InputBorder.none,
                              // Removes underline when inactive
                              focusedBorder: InputBorder.none,
                              // prefixIcon: Padding(
                              //   padding: EdgeInsets.only(left: 13, right: 8),
                              //   child: Image.asset(
                              //     Assets.homeScreenDistance,
                              //     width: 20,
                              //     height: 20,
                              //   ),
                              // ),
                              hintText: "20 Km",

                              hintStyle: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: AppColors.TxtblueColor,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                            style: CustomTextStyle.formHint,
                            cursorColor: AppColors.TxtOrangeColor,
                          ),
                        ),
                        commonSpace(25, 0),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            height:
                                AppDimensions.getScreenHeight(context) * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.TxtblueColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Apply Filter",
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize,
                                fontFamily: TextFont.PoppinsSemiBold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }

  Widget jobCardListindustrial(double getHeight, double getWidth) {
    return ListView.builder(
      shrinkWrap: true, // allows it to take only needed height
      physics: NeverScrollableScrollPhysics(), // disables internal scroll
      itemCount: jobListindustrial.length,
      itemBuilder: (context, index) {
        return Container(
          width: getWidth,
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: AppColors.TxtOrangeColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(
                          //   Assets.homeScreenMdiCompany,
                          //   width: 50,
                          //   height: 50,
                          // ),
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
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.TxtOrangeColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      commonSpace(10, 0),
                    ],
                  ),
                ),
                commonSpace(10, 0),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.briefcase,
                            size: 18,
                            color: AppColors.TxtOrangeColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Total Vacancy 100',
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
                            color: AppColors.TxtOrangeColor,
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
                      commonSpace(10, 0),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.TxtOrangeColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: getHeight * 0.05,
                            width: getWidth * 0.42,
                            child: Center(
                              child: Row(
                                children: [
                                  commonSpace(0, 10),
                                  // Image.asset(
                                  //   Assets.homeScreenCetegry,
                                  //   width: 18,
                                  //   height: 18,
                                  // ),
                                  Text(
                                    'Applied: 1000',
                                    style: CustomTextStyle.customStyle(
                                      fontSize: ScreenSizeConfig.fontSize - 1,
                                      color: AppColors.TxtOrangeColor,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ).marginOnly(left: 5),
                                ],
                              ),
                            ),
                          ),
                          commonSpace(0, 10),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.TxtblueColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: getHeight * 0.05,
                            width: getWidth * 0.42,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  commonSpace(0, 5),
                                  Icon(
                                    Icons.access_time_filled,
                                    size: 25,
                                    color: AppColors.TxtblueColor,
                                  ),
                                  Text(
                                    'Exp: 12 Aug 2024',
                                    style: CustomTextStyle.customStyle(
                                      fontSize: ScreenSizeConfig.fontSize - 1,
                                      color: AppColors.TxtblueColor,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ).marginOnly(left: 5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget jobCardListExpired(double getHeight, double getWidth) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: jobListindustrial.length,
      itemBuilder: (context, index) {
        return Container(
          width: getWidth,
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
          child: Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: AppColors.TxtOrangeColor.withOpacity(0.1),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(
                          //   Assets.homeScreenMdiCompany,
                          //   width: 50,
                          //   height: 50,
                          // ),
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
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.TxtOrangeColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.whiteColor,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.briefcase,
                                size: 18,
                                color: AppColors.TxtOrangeColor,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Total Vacancy 100',
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.blackColor,
                                  fontFamily: TextFont.PoppinsMedium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: AppColors.TxtOrangeColor,
                              ),
                              SizedBox(width: 5),
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
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.TxtOrangeColor.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: getHeight * 0.05,
                                width: getWidth * 0.42,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    // Image.asset(
                                    //   Assets.homeScreenCetegry,
                                    //   width: 18,
                                    //   height: 18,
                                    // ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Applied: 1000',
                                      style: CustomTextStyle.customStyle(
                                        fontSize: ScreenSizeConfig.fontSize - 1,
                                        color: AppColors.TxtOrangeColor,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.TxtblueColor.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: getHeight * 0.05,
                                width: getWidth * 0.42,
                                child: Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.access_time_filled,
                                      size: 25,
                                      color: AppColors.TxtblueColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Exp: 12 Aug 2024',
                                      style: CustomTextStyle.customStyle(
                                        fontSize: ScreenSizeConfig.fontSize - 1,
                                        color: AppColors.TxtblueColor,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'View Details',
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize - 1,
                                  color: Colors.white,
                                  fontFamily: TextFont.PoppinsMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: getWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Expired 10 Days Before',
                              style: CustomTextStyle.normalBluecustom(
                                fontSize: ScreenSizeConfig.fontSize + 3,
                                color: Colors.white,
                                fontFamily: TextFont.PoppinsMedium,
                              ),
                            ),
                            commonSpace(50, 0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "View Details",
                                    style: CustomTextStyle.normalBluecustom(
                                      fontSize: 14,
                                      color: AppColors.TxtblueColor,
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
