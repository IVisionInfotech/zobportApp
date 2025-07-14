import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:gotilo_job/Screens/resume_builder_preview_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/resume_builder_cotroller.dart';
import 'package:image_picker/image_picker.dart';

class ResumeBuilderNextScreen extends StatefulWidget {
  const ResumeBuilderNextScreen({super.key});

  @override
  State<ResumeBuilderNextScreen> createState() =>
      _ResumeBuilderNextScreenState();
}

class _ResumeBuilderNextScreenState extends State<ResumeBuilderNextScreen> {
  final ResumeBuilderCotroller controller = ResumeBuilderCotroller();

  // For image picker
  File? imageFile;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Resume Builder",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResumeBuilderPreviewScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.TxtblueColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Next", style: CustomTextStyle.normalBlue),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
                // Center(
                //   child: ClipOval(
                //     child: Container(
                //       width: 90,
                //       height: 90,
                //       color: Colors.grey[200],
                //       child: Image.asset(
                //         "assets/images/home_screen/userimg.png",
                //         fit: BoxFit.cover,
                //         width: 90,
                //         height: 90,
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Stack(
                    children: [
                      // ClipOval(
                      //   child:
                      //       imageFile == null
                      //           ? Image.asset(
                      //             Assets.skilledRegImg,
                      //             width:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.3,
                      //             height:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.3,
                      //             fit: BoxFit.cover,
                      //           )
                      //           : Image.file(
                      //             imageFile!,
                      //             width:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.32,
                      //             height:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.32,
                      //             fit: BoxFit.cover,
                      //           ),
                      // ),
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
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.06),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: AppColors.TxtblueColor, size: 26),
                    SizedBox(
                      width: AppDimensions.getScreenWidth(context) * 0.016,
                    ),
                    Text(
                      "Personal Information",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: ScreenSizeConfig.fontSize + 2,
                        color: Colors.black,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: dynemicTextField(
                        title: "First Name",
                        label: "Enter first name",
                        controller: controller.firstNameController,
                        validator:
                            (value) =>
                                controller.validateField(value, "First Name"),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    commonSpace(0, 10),
                    Expanded(
                      child: dynemicTextField(
                        title: "Last Name",
                        label: "Last Name",
                        controller: controller.lastNameController,
                        validator:
                            (value) =>
                                controller.validateField(value, "Last Name"),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Phone Number",
                  label: "Enter Phone Number",
                  controller: controller.phoneController,
                  validator: (value) => controller.validatePhone(value),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Email",
                  label: "Email Address",
                  controller: controller.emailController,
                  validator: (value) => controller.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "City",
                  label: "City",
                  controller: controller.locationController,
                  validator: (value) => controller.validateField(value, "City"),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Area",
                  label: "Area",
                  controller: controller.areaController,
                  validator: (value) => controller.validateField(value, "Area"),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Pin Code",
                  label: "Pin Code",
                  controller: controller.pinCodeController,
                  validator:
                      (value) => controller.validateField(value, "Pin Code"),
                  keyboardType: TextInputType.number,
                ),
                commonSpace(20, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    TextInputType keyboardType,
    String? Function(String?)? validator,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomTextStyle.normalBlue),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 16, color: Colors.black54),
          decoration: inputDecoration(hint),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: CustomTextStyle.normalBluecustom(
        fontSize: ScreenSizeConfig.fontSize,
        color: Color(0xff242A62),
        fontFamily: TextFont.PoppinsRegular,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xff242A62), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xff242A62), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.TxtOrangeColor, width: 1.5),
      ),
    );
  }

  Widget cusAppBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Image.asset(
        //     Assets.registerComBackbtn,
        //     width: MediaQuery.of(context).size.width * 0.1,
        //   ),
        // ),
        commonSpace(0, 10),
        Text(
          "Resume Builders",
          style: CustomTextStyle.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResumeBuilderPreviewScreen(),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.23,
            // height: Get.height * 0.07,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0x242A621A), // Change color as needed
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text("Next", style: CustomTextStyle.normalBlue),
            ),
          ),
        ),
      ],
    );
  }
}
