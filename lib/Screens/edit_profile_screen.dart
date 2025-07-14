import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/editprofile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    ScreenSizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: controller.formKey, // Use a single form key for all fields
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonSpace(20, 0),
                  CommonWidget.cusAppBarWidget("Edit Profile", 15),
                  commonSpace(10, 0),
                  // Center(
                  //   child: Image.asset(
                  //     Assets.editProfileUsereditImg,
                  //     height: 90,
                  //     width: 90,
                  //   ),
                  // ),
                  commonSpace(20, 0),

                  // Personal Information
                  Row(
                    children: [
                      // Image.asset(Assets.editProfileUserIcon, width: 25, height: 25),
                      commonSpace(0, 10),
                      Text(
                        "Personal Information",
                        style: CustomTextStyle.normalBluecustom(
                          fontSize: ScreenSizeConfig.fontSize,
                          color: Colors.black,
                          fontFamily: TextFont.PoppinsMedium,
                        ),
                      ),
                    ],
                  ).marginOnly(top: 12),

                  commonSpace(10, 0),

                  // First Name
                  buildTextField(
                    "First Name",
                    "First Name",
                    controller.firstNameController,
                    TextInputType.name,
                    (value) {
                      return controller.validateField(value, "First Name");
                    },
                  ),

                  // Last Name
                  buildTextField(
                    "Last Name",
                    "Last Name",
                    controller.lastNameController,
                    TextInputType.name,
                    (value) {
                      return controller.validateField(value, "Last Name");
                    },
                  ),

                  // Email
                  buildTextField(
                    "Email",
                    "Email Address",
                    controller.emailController,
                    TextInputType.emailAddress,
                    (value) {
                      return controller.validateEmail(value);
                    },
                  ),

                  // Phone Number
                  buildTextField(
                    "Phone Number",
                    "Enter Phone Number",
                    controller.phoneController,
                    TextInputType.phone,
                    (value) {
                      return controller.validatePhone(value);
                    },
                  ),

                  // Location
                  buildTextField(
                    "Location",
                    "Location",
                    controller.locationController,
                    TextInputType.text,
                    (value) {
                      return controller.validateField(value, "Location");
                    },
                  ),

                  // Education
                  buildTextField(
                    "Education",
                    "Education",
                    controller.educationController,
                    TextInputType.text,
                    (value) {
                      return controller.validateField(value, "Education");
                    },
                  ),

                  // Preferred Job Location
                  buildTextField(
                    "Preferred Job Location",
                    "Preferred Job Location",
                    controller.preJobLocController,
                    TextInputType.text,
                    (value) {
                      return controller.validateField(value, "Job Location");
                    },
                  ),

                  // Category Dropdown
                  Text(
                    "Category",
                    style: CustomTextStyle.normalBlue,
                  ).marginOnly(top: 12),
                  DropdownButtonFormField<String>(
                    value:
                        controller.categoryList.contains(
                              controller.selectedCategory.value,
                            )
                            ? controller.selectedCategory.value
                            : null,
                    onChanged: (newValue) {
                      setState(() {
                        controller.selectedCategory.value = newValue!;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? "Please select a category" : null,
                    items:
                        controller.categoryList.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          );
                        }).toList(),
                    decoration: inputDecoration("Select a Category"),
                  ).marginOnly(top: 10),

                  commonSpace(40, 0),

                  // Submit Button
                  CommonWidget.cusComSequere(() {
                    if (controller.formKey.currentState!.validate()) {
                      // Perform save/update logic here
                    }
                  }, "Edit"),

                  commonSpace(20, 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Extracted Helper Widget for Text Fields
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
        Text(label, style: CustomTextStyle.normalBlue).marginOnly(top: 12),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 16, color: Colors.black54),
          decoration: inputDecoration(hint),
        ).marginOnly(top: 10),
      ],
    );
  }

  // Common Input Decoration
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
}
