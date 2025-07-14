import 'package:flutter/material.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();
  final InternetChecker _internetChecker = InternetChecker();

  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    isPasswordVisible.dispose();
    isConfirmPasswordVisible.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
          "Forgot Password",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/forgot.gif",
                          height: AppDimensions.getScreenHeight(context) * 0.3,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.04,
                      ),
                      Text(
                        "Forgot Password!",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize + 6,
                          color: AppColors.blackColor,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.04,
                      ),
                      dynemicTextField(
                        title: "Password",
                        label: "Enter password",
                        controller: passwordController,
                        isVisible: ValueNotifier(isObscured),
                        showPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          // if (value.length < 6) {
                          //   return 'Password must be at least 6 characters';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.02,
                      ),
                      dynemicTextField(
                        title: "Confirm Password",
                        label: "Enter confirm password",
                        controller: confirmPasswordController,
                        isVisible: ValueNotifier(isObscured),
                        showPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          // if (value.length < 6) {
                          //   return 'Password must be at least 6 characters';
                          // }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            InkWell(
              onTap:
                  () => _internetChecker.onTapWithInternetCheck(() {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle forgot password logic here
                    }
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
                  "Forgot Password",
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

  // Widget buildPasswordField({
  //   required String title,
  //   required String label,
  //   required bool isConform,
  //   required TextEditingController controller,
  //   required ValueNotifier<bool> isVisible,
  //   required String? Function(String?) validator,
  // }) {
  //   return ValueListenableBuilder<bool>(
  //     valueListenable: isVisible,
  //     builder:
  //         (context, visible, _) => Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(title, style: CustomTextStyle.normalBlue),
  //             SizedBox(height: 10),
  //             TextFormField(
  //               controller: controller,
  //               obscureText: !visible,
  //               decoration: InputDecoration(
  //                 hintText: label,
  //                 hintStyle: CustomTextStyle.formHint,
  //                 contentPadding: EdgeInsets.symmetric(
  //                   vertical: 16,
  //                   horizontal: 12,
  //                 ),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(12),
  //                   borderSide: BorderSide(
  //                     color: Color(0xffD9D9D9),
  //                     width: 1.5,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                   borderSide: BorderSide(color: Colors.grey, width: 1),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                   borderSide: BorderSide(
  //                     color: AppColors.TxtOrangeColor,
  //                     width: 1.5,
  //                   ),
  //                 ),
  //                 suffixIcon:
  //                     isConform
  //                         ? SizedBox()
  //                         : IconButton(
  //                           icon: Icon(
  //                             visible ? Icons.visibility_off : Icons.visibility,
  //                             color: AppColors.TxtWelColor,
  //                           ),
  //                           onPressed: () {
  //                             isVisible.value = !visible;
  //                           },
  //                         ),
  //                 errorStyle: CustomTextStyle.formError,
  //               ),
  //               validator: validator,
  //               style: CustomTextStyle.formHint,
  //             ),
  //           ],
  //         ),
  //   );
  // }
}
