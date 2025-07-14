import 'package:flutter/material.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Company/Jobcard/company_jobcard.dart';
import 'package:gotilo_job/Screens/job_details_screen.dart';
import 'package:gotilo_job/Screens/resume_builder_next_screen.dart';
import 'package:gotilo_job/Screens/uploadcv_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class company_dashboard extends StatefulWidget {
  company_dashboard({super.key});

  @override
  State<company_dashboard> createState() => _company_dashboardState();
}

class _company_dashboardState extends State<company_dashboard>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingController = TextEditingController();

  // final PageController _pageController = PageController(viewportFraction: 1);
  // ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  late TabController _tabController;

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
    "assets/images/support.png",
    "assets/images/support.png",
    "assets/images/support.png",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color(0xffF3F4FF),
      resizeToAvoidBottomInset: false,
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
                  height: AppDimensions.getScreenHeight(context) * 0.21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.cases_outlined,
                          color: AppColors.TxtblueColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "All Jobs",
                          style: TextStyle(
                            color: AppColors.TxtblueColor,
                            fontSize: ScreenSizeConfig.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        tabs: const [Tab(text: 'Active'), Tab(text: 'Expired')],
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          color: AppColors.TxtblueColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        dividerColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),

            Container(
              width: double.infinity,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const CompanyJobCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ); // space between cards
                },
              ),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 54, // Fixed height for consistency
        decoration: BoxDecoration(
          // color: AppColors.TxtblueColor.withOpacity(0.15),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
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
                width: AppDimensions.getScreenWidth(context) * 0.15,
                height: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.TxtOrangeColor,
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
