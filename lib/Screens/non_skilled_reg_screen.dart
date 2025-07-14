import 'package:flutter/material.dart';
import 'package:gotilo_job/Screens/verify_otp_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class NonSkilledRegScreen extends StatefulWidget {
  const NonSkilledRegScreen({super.key});

  @override
  State<NonSkilledRegScreen> createState() => _NonSkilledRegScreenState();
}

class _NonSkilledRegScreenState extends State<NonSkilledRegScreen> {
  final InternetChecker _internetChecker = InternetChecker();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pinCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
          "Non Skilled Registration",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: dynemicTextField(
                            title: "First Name",
                            label: "First name",
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.getScreenWidth(context) * 0.05,
                        ),
                        Expanded(
                          child: dynemicTextField(
                            title: "Last Name",
                            label: "Last name",
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Last name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "Contact No.",
                      label: "Enter contact number",
                      keyboardType: TextInputType.phone,
                      controller: contactController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Contact number is required";
                        }
                        if (value.length < 10 || value.length > 15) {
                          return "Enter a valid contact number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "Email",
                      label: "Enter email address",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                        ).hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "Address",
                      label: "Enter your address",
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Address is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "Ciry",
                      label: "Enter your city",
                      controller: cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "City is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "State",
                      label: "Enter your state",
                      controller: stateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "State is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.02,
                    ),
                    dynemicTextField(
                      title: "Pin Code",
                      label: "Enter your pin code",
                      keyboardType: TextInputType.number,
                      controller: pinCodeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Pin code is required";
                        }
                        if (value.length != 6) {
                          return "Enter a valid pin code";
                        }
                        return null;
                      },
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
                        return null;
                      },
                    ),

                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.04,
                    ),
                    InkWell(
                      onTap:
                          () => _internetChecker.onTapWithInternetCheck(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtpScreen(),
                              ),
                            );
                            // }
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
                          "Register",
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
            ),
          ],
        ),
      ),
    );
  }
}
