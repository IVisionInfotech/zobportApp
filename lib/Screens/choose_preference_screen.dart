import 'package:flutter/material.dart';
import 'package:gotilo_job/Screens/non_skilled_reg_screen.dart';
import 'package:gotilo_job/Screens/skilled_reg_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/app_connectivity.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class ChoosePreferenceScreen extends StatefulWidget {
  const ChoosePreferenceScreen({super.key});

  @override
  State<ChoosePreferenceScreen> createState() => _ChoosePreferenceScreenState();
}

class _ChoosePreferenceScreenState extends State<ChoosePreferenceScreen> {
  final InternetChecker _internetChecker = InternetChecker();

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Choose Your Preference",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap:
                        () => _internetChecker.onTapWithInternetCheck(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NonSkilledRegScreen(),
                            ),
                          );
                        }),
                    child: Container(
                      width: double.infinity,
                      height: AppDimensions.getScreenWidth(context) * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.TxtblueColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/skillno.gif",
                          width: AppDimensions.getScreenWidth(context) * 2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Chip(
                      label: Text(
                        'Non Skilled',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenSizeConfig.fontSize,
                        ),
                      ),
                      backgroundColor: AppColors.TxtblueColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
              Stack(
                children: [
                  GestureDetector(
                    onTap:
                        () => _internetChecker.onTapWithInternetCheck(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SkilledRegScreen(),
                            ),
                          );
                        }),
                    child: Container(
                      width: double.infinity,
                      height: AppDimensions.getScreenWidth(context) * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.TxtblueColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/skill.gif",
                          width: AppDimensions.getScreenWidth(context) * 2,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Chip(
                      label: Text(
                        'Skilled',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenSizeConfig.fontSize,
                        ),
                      ),
                      backgroundColor: AppColors.TxtblueColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
