import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gotilo_job/View/Registration/RegistrationCompanyScreens/registration_company_screen.dart'
    as company_screen;
import 'package:gotilo_job/View/Registration/RegistrationEmployeeScreens/choose_preference_screen.dart';
import 'package:gotilo_job/View/Login/forgot_password_screen.dart';
import 'package:gotilo_job/View/BottomNavigationBarScreens/Employee/employee_bottom_navigation_bar.dart';
import 'package:gotilo_job/Utils/App_Colors.dart' as app_utils;
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscured = true;
  bool isRememberMeChecked = false;
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!EmailValidator.validate(value)) return 'Enter a valid email';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: app_utils.AppColors.whiteColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.1,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        width: AppDimensions.getScreenWidth(context) * 0.65,
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.08,
                  ),
                  Text(
                    "Welcome Back",
                    style: app_utils.CustomTextStyle.customStyle(
                      fontSize: ScreenSizeConfig.fontSize + 8,
                      color: app_utils.AppColors.TxtblueColor,
                      fontFamily: app_utils.TextFont.PoppinsMedium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.008,
                  ),
                  Text(
                    "Login to access thousands job opportunities.",
                    style: app_utils.CustomTextStyle.normalBluecustom(
                      fontSize: ScreenSizeConfig.fontSize - 1,
                      color: app_utils.AppColors.TxtIntroColor,
                      fontFamily: app_utils.TextFont.PoppinsRegular,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.04,
                  ),
                  dynemicTextField(
                    title: "Email",
                    label: "Enter email",
                    controller: emailController,
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email,
                      color: app_utils.AppColors.TxtWelColor,
                    ),
                    readOnly: false,
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  dynemicTextField(
                    title: "Password",
                    label: "Enter password",
                    controller: passwordController,
                    isVisible: ValueNotifier(isObscured),
                    showPassword: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: app_utils.AppColors.TxtWelColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            isRememberMeChecked = !isRememberMeChecked;
                          });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.centerLeft,
                          child:
                              isRememberMeChecked
                                  ? Icon(
                                    Icons.check_circle_sharp,
                                    color: app_utils.AppColors.TxtWelColor,
                                  )
                                  : Icon(
                                    Icons.circle_outlined,
                                    color: app_utils.AppColors.TxtblueColor,
                                  ),
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: app_utils.AppColors.TxtblueColor,
                          fontFamily: app_utils.TextFont.PoppinsMedium,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap:
                            () => _internetChecker.onTapWithInternetCheck(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                              FocusScope.of(context).unfocus();
                            }),
                        child: Container(
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: app_utils.AppColors.TxtblueColor,
                              fontFamily: app_utils.TextFont.PoppinsMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.06,
                  ),
                  InkWell(
                    onTap:
                        () => _internetChecker.onTapWithInternetCheck(() {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BottomNavigationBarScreen(),
                              ),
                            );
                          }
                        }),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: ScreenSizeConfig.buttonHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: app_utils.AppColors.TxtOrangeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenSizeConfig.fontSize,
                          fontFamily: app_utils.TextFont.PoppinsMedium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.04,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account yet?",
                        style: app_utils.CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: app_utils.AppColors.TxtblueColor,
                          fontFamily: app_utils.TextFont.PoppinsMedium,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap:
                            () => _internetChecker.onTapWithInternetCheck(() {
                              showCustomPopup(context);
                            }),
                        child: Text(
                          "Sign up",
                          style: app_utils.CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: app_utils.AppColors.TxtOrangeColor,
                            fontFamily: app_utils.TextFont.PoppinsMedium,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: app_utils.AppColors.TxtOrangeColor.withOpacity(
                          0.1,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: app_utils.AppColors.TxtOrangeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit_document,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
                Text(
                  "How To Signup Employee Or Employer (Company)",
                  textAlign: TextAlign.center,
                  style: app_utils.CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize,
                    color: app_utils.AppColors.blackColor,
                    fontFamily: app_utils.TextFont.PoppinsSemiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.01),
                Text(
                  "Sign up to find your dream job or hire top talent! Whether you're a job seeker or an employer.",
                  textAlign: TextAlign.center,
                  style: app_utils.CustomTextStyle.normalBluecustom(
                    fontSize: ScreenSizeConfig.fontSize - 1,
                    color: Color(0xff878787),
                    fontFamily: app_utils.TextFont.PoppinsRegular,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () => _internetChecker.onTapWithInternetCheck(() {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ChoosePreferenceScreen(),
                                  ),
                                );
                              }),
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                              color: app_utils.AppColors.TxtblueColor
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: app_utils.AppColors.TxtblueColor,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              "Employee",
                              style: app_utils.CustomTextStyle.customStyle(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: app_utils.AppColors.TxtblueColor,
                                fontFamily: app_utils.TextFont.PoppinsMedium,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () => _internetChecker.onTapWithInternetCheck(() {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            company_screen.CompanyRegistrationScreen(),
                                  ),
                                );
                              }),
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                              color: app_utils.AppColors.TxtOrangeColor
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: app_utils.AppColors.TxtOrangeColor,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              "Company",
                              style: app_utils.CustomTextStyle.customStyle(
                                fontSize: ScreenSizeConfig.fontSize,
                                color: app_utils.AppColors.TxtOrangeColor,
                                fontFamily: app_utils.TextFont.PoppinsMedium,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
