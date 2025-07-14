import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Activity/activitypage.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/HomePage/homepage.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Job/jobspage.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Profile/profilepage.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Tips/tipspage.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final List<Widget> pages = [
    Homepage(),
    Jobspage(),
    ActivityPage(),
    Profilepage(),
    Tipspage(),
  ];

  int activePage = 0;

  void updatePage(int index) {
    setState(() {
      activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.TxtblueColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                  height: AppDimensions.getScreenHeight(context) * 0.044,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.2),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          "assets/images/user.jpg",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Hello, ",
                                style: TextStyle(
                                  fontSize: ScreenSizeConfig.fontSize - 1,
                                ),
                              ),
                              TextSpan(
                                text: "Samuel",
                                style: TextStyle(
                                  fontSize: ScreenSizeConfig.fontSize - 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              AppDimensions.getScreenHeight(context) * 0.006,
                        ),
                        Text(
                          "Find Your Dream Job",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenSizeConfig.fontSize + 2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: AppDimensions.getScreenWidth(context) * 0.10,
                      height: AppDimensions.getScreenWidth(context) * 0.10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: AppColors.TxtblueColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: pages[activePage]),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 10,
              top: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.TxtblueColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GNav(
                  rippleColor: Colors.grey[800]!,
                  hoverColor: Colors.grey[700]!,
                  haptic: true,
                  tabBorderRadius: 30,
                  tabBackgroundColor: AppColors.TxtOrangeColor,
                  gap: 8,
                  color: Colors.white70,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: Colors.transparent,
                  selectedIndex: activePage,
                  duration: Duration(milliseconds: 500),
                  onTabChange: (index) => updatePage(index),
                  tabs: [
                    GButton(
                      icon: activePage == 0 ? Icons.home : Icons.home_outlined,
                      text: 'Home',
                    ),
                    GButton(
                      icon: activePage == 1 ? Icons.work : Icons.work_outline,
                      text: 'Jobs',
                    ),
                    GButton(
                      icon: activePage == 2
                          ? Icons.access_time
                          : Icons.access_time_outlined,
                      text: 'Activity',
                    ),
                    GButton(
                      icon: activePage == 3
                          ? Icons.person
                          : Icons.person_outline,
                      text: 'Profile',
                    ),
                    GButton(
                      icon: activePage == 4
                          ? Icons.lightbulb
                          : Icons.lightbulb_outline,
                      text: 'Tips',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
