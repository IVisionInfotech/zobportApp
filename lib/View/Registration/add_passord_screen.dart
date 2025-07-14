import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/form_controller_add_pass.dart';

class AddPassordScreen extends StatefulWidget {
  const AddPassordScreen({super.key});

  @override
  State<AddPassordScreen> createState() => _AddPassordScreenState();
}

class _AddPassordScreenState extends State<AddPassordScreen> {
  FormControllerAddPass formControllerAddPass = Get.put(
    FormControllerAddPass(),
  );
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 10),
            CommonWidget.cusAppBarWidget("Add Password", 15).marginAll(13),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Image.asset(
                      //     Assets.skilledRegSkillerImg,
                      //     width: AppDimensions.getScreenWidth(context) * 0.6,
                      //   ),
                      // ),
                      SizedBox(height: 30),
                      Text("Add Password", style: CustomTextStyle.introBlue),
                      Text(
                        "To protect and make data encrypted!",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize - 1,
                          color: AppColors.TxtIntroColor,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                      SizedBox(height: 15),
                      // Center(
                      //   child: Image.asset(
                      //     Assets.skilledRegLine,
                      //     width: Get.width,
                      //   ),
                      // ),
                      SizedBox(height: 15),
                      Text("Password", style: CustomTextStyle.normalBlue),
                      buildPasswordField(
                        label: "Password",
                        controller: formControllerAddPass.passwordController,
                        isVisible: formControllerAddPass.isPasswordVisible,
                        toggleVisibility:
                            formControllerAddPass.togglePasswordVisibility,
                        validator: formControllerAddPass.validatePassword,
                        isConform: false,
                      ),
                      SizedBox(height: 20),
                      Text("Confirm", style: CustomTextStyle.normalBlue),
                      buildPasswordField(
                        label: "Confirm Password",
                        controller:
                            formControllerAddPass.confirmPasswordController,
                        isVisible:
                            formControllerAddPass.isConfirmPasswordVisible,
                        toggleVisibility:
                            formControllerAddPass
                                .toggleConfirmPasswordVisibility,
                        validator:
                            formControllerAddPass.validateConfirmPassword,
                        isConform: true,
                      ),
                    ],
                  ).marginAll(20),
                ),
              ),
            ),
            CommonWidget.cusComSequere(
              () => _internetChecker.onTapWithInternetCheck(() {
                Get.to(VerifyOtpScreen());
              }),
              "Next",
            ).marginAll(20),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required String label,
    required bool isConform,
    required TextEditingController controller,
    required RxBool isVisible,
    required VoidCallback toggleVisibility,
    required String? Function(String?) validator,
  }) {
    return Obx(
      () => TextFormField(
        controller: controller,
        obscureText: !isVisible.value,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: CustomTextStyle.formHint,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xffD9D9D9), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.TxtOrangeColor, width: 1.5),
          ),
          suffixIcon:
              isConform
                  ? SizedBox()
                  : IconButton(
                    icon: Icon(
                      isVisible.value ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.TxtWelColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisible.value =
                            !isVisible.value; // ✅ Toggle visibility correctly
                      });
                    },
                  ),
          errorStyle: CustomTextStyle.formError,
        ),
        validator: validator,
        style: CustomTextStyle.formHint,
      ),
    );
  }
}
