import 'package:flutter/material.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/custom_radio_button.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class Jobspage extends StatelessWidget {
  Jobspage({super.key});
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
  String? selectedCategory = "Technology & IT";
  String? selectedSubCategory;
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
  final Map<String, Color> textColors = {
    "Technology & IT": Colors.white,
    "Engineering": Colors.green.shade900,
    "Medical": Colors.orange.shade900,
    "Construction": Colors.purple.shade900,
    "Finance": Colors.blueGrey.shade900,
    "Creative & Design": Colors.red.shade900,
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
  @override
  Widget build(BuildContext context) {
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
          customSearchBar(textEditingController, () {
            FocusScope.of(context).unfocus();
            showSearchJobBottomSheet(context);
            FocusScope.of(context).unfocus();
          }, context),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.lightbulb_outline, color: AppColors.TxtblueColor),
                SizedBox(width: AppDimensions.getScreenWidth(context) * 0.014),
                Text(
                  "Recommended Jobs",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: AppColors.TxtblueColor),
                SizedBox(width: AppDimensions.getScreenWidth(context) * 0.014),
                Text(
                  "Searched Result",
                  style: TextStyle(
                    color: AppColors.TxtblueColor,
                    fontSize: ScreenSizeConfig.fontSize + 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          jobCardListFav(getHeight, getWidth),
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
                              border: InputBorder.none, // Removes underline
                              enabledBorder:
                                  InputBorder
                                      .none, // Removes underline when inactive
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
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : textColors[category],
                                        // fontFamily: Assets.fontsPoppinsMedium,
                                        fontSize: ScreenSizeConfig.fontSize,
                                      ),
                                    ),
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
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : subTextColors[category],
                                        // fontFamily: Assets.fontsPoppinsMedium,
                                        fontSize: ScreenSizeConfig.fontSize,
                                      ),
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
                            min: 2000, // Minimum salary
                            max: 100000, // Updated Maximum Salary (100K)
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
                              border: InputBorder.none, // Removes underline
                              enabledBorder:
                                  InputBorder
                                      .none, // Removes underline when inactive
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

  void showSearchJobBottomSheet(BuildContext context) {
    int selectedValue = 1;
    List<String> distances = [
      "5 Km",
      "10 Km",
      "15 Km",
      "20 Km",
      "25 Km",
      "30 Km",
    ];
    String selectedDistance = "20 Km";
    bool spaceTrue = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.9, // Almost full-screen
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  commonSpace(25, 0),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
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
                              border: InputBorder.none, // Removes underline
                              enabledBorder:
                                  InputBorder
                                      .none, // Removes underline when inactive
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
                        commonSpace(10, 0),
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
                        commonSpace(10, 0),
                        Text(
                          "Select Job Type",
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
                                              : Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                        // fontFamily: Assets.fontsPoppinsMedium,
                                        fontSize: ScreenSizeConfig.fontSize,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        commonSpace(20, 0),
                        Text(
                          "Select Subcategory",
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
                                              : Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      category,
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                        // fontFamily: Assets.fontsPoppinsMedium,/
                                        fontSize: ScreenSizeConfig.fontSize,
                                      ),
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
                            min: 2000, // Minimum salary
                            max: 100000, // Updated Maximum Salary (100K)
                            onChanged: (RangeValues values) {
                              setState(() {
                                minSalary = values.start.toInt();
                                maxSalary = values.end.toInt();
                              });
                            },
                          ),
                        ),
                        commonSpace(10, 0),
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
                          height: AppDimensions.getScreenHeight(context) * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1.5,
                              color: Color(0xffD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedDistance,
                            decoration: InputDecoration(
                              border: InputBorder.none, // Removes underline
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // prefixIcon: Padding(
                              //   padding: EdgeInsets.only(left: 13, right: 8),
                              //   child: Image.asset(
                              //     Assets.homeScreenDistance,
                              //     width: 20,
                              //     height: 20,
                              //   ),
                              // ),
                            ),
                            style: CustomTextStyle.formHint,
                            dropdownColor: Colors.white, // Adjust as needed
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.TxtblueColor,
                            ), // Dropdown icon
                            items:
                                distances.map((String distance) {
                                  return DropdownMenuItem<String>(
                                    value: distance,
                                    child: Text(
                                      distance,
                                      style: CustomTextStyle.normalBluecustom(
                                        fontSize: ScreenSizeConfig.fontSize,
                                        color: AppColors.TxtblueColor,
                                        fontFamily: TextFont.PoppinsMedium,
                                      ),
                                    ),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDistance = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: spaceTrue ? 50 : 0),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle filter apply action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.TxtblueColor,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Apply Filter",
                        style: TextStyle(
                          fontSize: ScreenSizeConfig.fontSize,
                          // fontFamily: Assets.fontsPoppinsSemiBold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
                  hintText: "Find your dream job",
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

  Widget jobCardListindustrial(double getHeight, double getWidth) {
    return SizedBox(
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
            return Container(
              width: getWidth * 0.75,
              margin: EdgeInsets.only(
                right: AppDimensions.getScreenWidth(context) * 0.04,
              ),
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
                              color: AppColors.TxtOrangeColor.withOpacity(0.2),
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
            );
          },
        ),
      ),
    );
  }

  Widget jobCardListFav(double getHeight, double getWidth) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
      itemCount: jobListindustrial.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
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
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobListindustrial[index]['title'] ?? '',
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: AppColors.blackColor,
                              fontFamily: TextFont.PoppinsSemiBold,
                            ),
                          ),
                          Text(
                            jobListindustrial[index]['company'] ?? '',
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: Color(0xff878787),
                              fontFamily: TextFont.PoppinsRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image.asset(
                    //   Assets.homeScreenUnfavorite,
                    //   width: 35,
                    //   height: 35,
                    // ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
                Divider(color: Color(0xffD4D4D4), thickness: 1.5),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      size: 18,
                      color: AppColors.TxtblueColor,
                    ),
                    SizedBox(width: 4),
                    Text(
                      jobListindustrial[index]['salary'] ?? '',
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
                      jobListindustrial[index]['location'] ?? '',
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: ScreenSizeConfig.fontSize,
                        color: AppColors.blackColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: getHeight * 0.05,
                        decoration: BoxDecoration(
                          color: AppColors.TxtOrangeColor.withOpacity(0.2),
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
                                  AppDimensions.getScreenWidth(context) * 0.01,
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
                                  AppDimensions.getScreenWidth(context) * 0.01,
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
        );
      },
    );
  }
}
