import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gotilo_job/View/PremiumPackageScreen/premium_plan_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Verify OTP",
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/verify.gif",
                          width: 330,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Verify Your OTP!",
                        style: CustomTextStyle.customStyle(
                          fontSize: ScreenSizeConfig.fontSize + 8,
                          color: AppColors.TxtblueColor,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.008,
                      ),
                      Text(
                        "Please enter the OTP to confirm your account and proceed.",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 1,
                          color: AppColors.TxtIntroColor,
                          fontFamily: TextFont.PoppinsRegular,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) => buildOtpBox()),
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.05,
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Code send in 00:29 ",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.TxtIntroColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: TextFont.PoppinsRegular,
                                ),
                              ),
                              TextSpan(
                                text: "Resend",
                                style: CustomTextStyle.normalBluecustom(
                                  fontSize: ScreenSizeConfig.fontSize,
                                  color: AppColors.TxtOrangeColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: TextFont.PoppinsSemiBold,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        _internetChecker.onTapWithInternetCheck(
                                          () {
                                            print("Resend tapped!");
                                          },
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap:
                  () => _internetChecker.onTapWithInternetCheck(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Planpageemp()),
                    );
                  }),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: ScreenSizeConfig.buttonHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.TxtOrangeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenSizeConfig.fontSize,
                    fontFamily: TextFont.PoppinsMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF26824),
        border: Border.all(color: Color(0xFF242A62), width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
