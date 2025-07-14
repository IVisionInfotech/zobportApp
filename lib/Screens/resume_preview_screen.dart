import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class ResumePreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: getHeight * 0.44,
              // decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage(Assets.uploadCvHeaderBg))
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonSpace(20, 0),
                  CommonWidget.cusAppBarWidget(
                    "Upload CV/Resume",
                    15,
                  ).marginAll(13),
                  commonSpace(40, 0),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(ResumePreviewScreen());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(Assets.generatePdfGenBtn),
                //     fit: BoxFit.contain,
                //   ),
                // ),
                child: Center(
                  child: Text(
                    "Upload",
                    style: CustomTextStyle.buttonText,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ).marginOnly(top: 5, right: 13, left: 13, bottom: 20),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '\u2022 $title',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade900,
        ),
      ),
    );
  }

  Widget workExperience(String role, String duration, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(duration, style: TextStyle(color: Colors.grey)),
          Text(description, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget educationEntry(String degree, String school) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(school, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
