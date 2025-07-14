import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int selectedIndex = 0; // For tab selection
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.012),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0x0f242A62),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1, color: AppColors.TxtblueColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTab(0, "Applied Jobs"),
                  _buildTab(1, "Favourite Jobs"),
                ],
              ),
            ),
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
          Expanded(
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [_buildAppliedJobList(), _buildFavoriteJobList()],
            ),
          ),
        ],
      ),
    );
  }

  // Tab Builder
  Widget _buildTab(int index, String title) {
    bool isSelected = index == selectedIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.TxtblueColor : Colors.transparent,
            borderRadius: BorderRadius.circular(80),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.TxtblueColor,
              fontSize: ScreenSizeConfig.fontSize,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Applied Jobs List
  Widget _buildAppliedJobList() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        JobCard(
          isApplied: true,
          appliedDate: "12/02/2026",
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: AppColors.TxtblueColor.withOpacity(0.1),
          iconColor: Color(0xffffffff),
          textColor: AppColors.TxtblueColor,
        ),
        SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
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
        // commonSpace(80, 0),
      ],
    );
  }

  // Favorite Jobs List
  Widget _buildFavoriteJobList() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        JobCard(
          isApplied: false,
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xffE3F2FD),
          iconColor: Color(0xffffffff),
          textColor: Color(0xff0D47A1),
        ),
        SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
        JobCard(
          isApplied: false,
          jobTitle: "Welder Job",
          companyName: "Abc Company Name",
          location: "2565 Corpening Drive Bloomfield",
          salary: "1000 To 10,000 / Month",
          tags: ["Remote", "Night Shift", "Recruitment 4"],
          bgColor: Color(0xfF26824),
          iconColor: Color(0xffF26824),
          textColor: Color(0xffF26824),
        ),
        // commonSpace(80, 0),
      ],
    );
  }
}

// Reusable Job Card Widget
class JobCard extends StatelessWidget {
  final bool isApplied;
  final String jobTitle;
  final String companyName;
  final String location;
  final String salary;
  final List<String> tags;
  final String? appliedDate;
  final Color? iconColor;
  final Color? bgColor;
  final Color? textColor;

  const JobCard({
    Key? key,
    required this.isApplied,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.tags,
    this.appliedDate,
    this.iconColor,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffD9D9D9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isApplied)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  "Applied - $appliedDate",
                  style: CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize - 1,
                    color: textColor!,
                    fontFamily: TextFont.PoppinsMedium,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.work,
                    color: AppColors.TxtblueColor,
                    size: AppDimensions.getScreenWidth(context) * 0.1,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobTitle,
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: Colors.black,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                      Text(
                        companyName,
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 2,
                          color: Color(0xff878787),
                          fontFamily: TextFont.PoppinsRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isApplied) Icon(Icons.favorite, color: Colors.red),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: Color(0xffF1F1F1), thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.getScreenWidth(context) * 0.08,
                  height: AppDimensions.getScreenHeight(context) * 0.05,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.TxtblueColor,
                    size: AppDimensions.getScreenWidth(context) * 0.05,
                  ),
                ),
                commonSpace(0, 7),
                Expanded(
                  child: Text(
                    location,
                    style: CustomTextStyle.normalBluecustom(
                      fontSize: ScreenSizeConfig.fontSize,
                      color: Colors.black,
                      fontFamily: TextFont.PoppinsRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: AppDimensions.getScreenWidth(context) * 0.08,
                  height: AppDimensions.getScreenWidth(context) * 0.08,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.currency_rupee,
                    color: AppColors.TxtblueColor,
                    size: AppDimensions.getScreenWidth(context) * 0.05,
                  ),
                ),
                commonSpace(0, 7),
                Expanded(
                  child: Text(
                    salary,
                    style: CustomTextStyle.normalBluecustom(
                      fontSize: ScreenSizeConfig.fontSize,
                      color: Colors.black,
                      fontFamily: TextFont.PoppinsRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: Color(0xffF1F1F1), thickness: 1),
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  tags
                      .map(
                        (tag) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize - 2,
                              fontFamily: TextFont.PoppinsMedium,
                              color: textColor!,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
        ],
      ),
    );
  }
}
