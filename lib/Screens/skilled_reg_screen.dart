import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gotilo_job/Screens/more_info_skill_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class SkilledRegScreen extends StatefulWidget {
  const SkilledRegScreen({super.key});

  @override
  State<SkilledRegScreen> createState() => _SkilledRegScreenState();
}

class _SkilledRegScreenState extends State<SkilledRegScreen> {
  final InternetChecker _internetChecker = InternetChecker();

  // Standard controllers
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // For image picker
  File? imageFile;
  bool isLoading = false;

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
    super.dispose();
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await showModalBottomSheet<XFile?>(
        context: context,
        builder:
            (context) => SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take a photo'),
                    onTap: () async {
                      final photo = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      Navigator.pop(context, photo);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Choose from gallery'),
                    onTap: () async {
                      final gallery = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      Navigator.pop(context, gallery);
                    },
                  ),
                ],
              ),
            ),
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
    } finally {}
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
          "Skilled Registration",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Stack(
                  children: [
                    ClipOval(
                      child:
                          imageFile == null
                              ? Image.asset(
                                "assets/images/user.jpg",
                                width:
                                    AppDimensions.getScreenWidth(context) *
                                    0.32,
                                height:
                                    AppDimensions.getScreenWidth(context) *
                                    0.32,
                                fit: BoxFit.cover,
                              )
                              : Image.file(
                                imageFile!,
                                width:
                                    AppDimensions.getScreenWidth(context) *
                                    0.32,
                                height:
                                    AppDimensions.getScreenWidth(context) *
                                    0.32,
                                fit: BoxFit.cover,
                              ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: AppDimensions.getScreenWidth(context) * 0.098,
                        height: AppDimensions.getScreenWidth(context) * 0.098,
                        decoration: BoxDecoration(
                          color: AppColors.TxtblueColor.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Form(
                  key: formKey,
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
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First name is required';
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
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last name is required';
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
                        label: "Enter your contact number",
                        controller: contactController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Contact number is required';
                          }
                          if (value.length < 10 || value.length > 15) {
                            return 'Contact number must be between 10 and 15 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.02,
                      ),
                      dynemicTextField(
                        title: "Email",
                        label: "Enter your email",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
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
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.02,
                      ),
                      dynemicTextField(
                        title: "City",
                        label: "Enter your city",
                        controller: cityController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'City is required';
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
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'State is required';
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
                        controller: pinCodeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pin code is required';
                          }
                          if (value.length != 6) {
                            return 'Pin code must be 6 digits';
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
                                  builder: (context) => MoreInfoSkillScreen(),
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
                            "Next",
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
      ),
    );
  }
}
