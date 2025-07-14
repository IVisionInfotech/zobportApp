import 'package:flutter/material.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Company/Activity/company_activity.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Company/Dashboard/company_dashboard.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Company/Plans/my_plan_deatils_screen.dart';
import 'package:gotilo_job/Screens/add_new_job_screen_emp.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/Tips/tipspage.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  final List<Widget> pages = [
    company_dashboard(),
    MyPlanDetailsScreen(),
    CompanyActivityScreen(),
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
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Bottom Bar Background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: AppColors.TxtblueColor),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _navItem(Icons.badge_outlined, 'Jobs', 0),
                    Spacer(),
                    _navItem(Icons.star_border, 'Plan', 1),
                    Spacer(),
                    const SizedBox(width: 64), // spacer for center FAB
                    _navItem(Icons.access_time_outlined, 'History', 2),
                    Spacer(),
                    _navItem(Icons.person_outline, 'Profile', 3),
                  ],
                ),
              ),
            ),

            // Center Plus Button
            Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddNewJobScreenEmp(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.TxtblueColor,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: AppColors.TxtblueColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

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
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = activePage == index;
    return GestureDetector(
      onTap: () => updatePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.TxtOrangeColor : Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.TxtOrangeColor : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
