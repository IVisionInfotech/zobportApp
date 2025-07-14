import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Screens/resume_preview_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class UploadcvScreen extends StatefulWidget {
  const UploadcvScreen({super.key});

  @override
  State<UploadcvScreen> createState() => _UploadcvScreenState();
}

class _UploadcvScreenState extends State<UploadcvScreen> {
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: getHeight * 0.22,
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(image: AssetImage(Assets.uploadCvDottedRectangle))
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          commonSpace(10, 0),
                          // Image.asset(Assets.uploadCvUploadIcon,height: 70,width: 70,),
                          commonSpace(10, 0),
                          Text(
                            "Upload Your CV/Here",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              fontFamily: TextFont.PoppinsMedium,
                              color: Colors.black,
                            ),
                          ),
                          commonSpace(5, 0),
                          Text(
                            "Click Here For Browse Files",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              fontFamily: TextFont.PoppinsRegular,
                              color: Color(0xff878787),
                            ),
                          ),
                        ],
                      ),
                    ).marginOnly(left: 13, right: 13),
                  ),
                  Text(
                    "Selected CV/Resume",
                    style: CustomTextStyle.normalBluecustom(
                      fontSize: ScreenSizeConfig.fontSize,
                      color: Colors.black,
                      fontFamily: TextFont.PoppinsMedium,
                    ),
                  ).marginOnly(left: 13, right: 13, top: 13),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ).marginAll(13),
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
                //     image: AssetImage(Assets.uploadCvUploadbtn),
                //     fit: BoxFit.contain,
                //   ),
                // ),
                child: Center(
                  child: Text(
                    "Upload",
                    style: CustomTextStyle.buttonText,
                    textAlign: TextAlign.start,
                  ).marginOnly(left: 30),
                ),
              ),
            ).marginOnly(top: 5, right: 13, left: 13, bottom: 20),
          ],
        ),
      ),
    );
  }
}
