import 'package:gotilo_job/View/BottomNavigationBarScreens/Company/CompanyHomeScreen/company_home_screen.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:gotilo_job/Services/app_connectivity.dart' show InternetChecker;
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/form_cotroller_moreinfo.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Removed
import 'package:gotilo_job/Utils/App_Colors.dart';

class MoreInfoComScreen extends StatefulWidget {
  const MoreInfoComScreen({super.key});

  @override
  State<MoreInfoComScreen> createState() => _MoreInfoComScreenState();
}

class _MoreInfoComScreenState extends State<MoreInfoComScreen> {
  List<Map<String, TextEditingController>> companyBranches = [];
  TextEditingController textEditingControllerCompDes = TextEditingController();
  final InternetChecker _internetChecker = InternetChecker();

  // Password controllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscured = true;

  // For dropdowns and password visibility
  String selectedCategory = '';
  String selectedSubCategory = '';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    addNewBranch();
    _internetChecker.checkInternet();
  }

  void addNewBranch() {
    setState(() {
      companyBranches.add({
        "name": TextEditingController(),
        "address": TextEditingController(),
      });
    });
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Controllers and validators for dropdowns and text fields
    final List<String> categoryList = [
      'Machine Manufacturer',
      'Service Provider',
      'Consultant',
    ];
    final List<String> subCategoryList = [
      'Handle Machine',
      'Cutting Machine',
      'Packaging Machine',
    ];

    final TextEditingController salaryController = TextEditingController();
    final TextEditingController companySizeController = TextEditingController();
    final TextEditingController companySinceController =
        TextEditingController();

    String? validateDropdown(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please select an option';
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Company Information",
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Image.asset(Assets.registerComImg, width: 100),
                //   ),
                // ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
                Text("Category", style: CustomTextStyle.normalBlue),
                SizedBox(height: 10),
                buildDropdownField(
                  label: "Machine Manufacturer",
                  value: selectedCategory,
                  items: categoryList,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                  validator: validateDropdown,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                Text("Sub Category", style: CustomTextStyle.normalBlue),
                SizedBox(height: 10),
                buildDropdownField(
                  label: "Handle Machine",
                  value: selectedSubCategory,
                  items: subCategoryList,
                  onChanged: (value) {
                    setState(() {
                      selectedSubCategory = value!;
                    });
                  },
                  validator: validateDropdown,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Average Salary",
                  label: "Enter average salary",
                  controller: salaryController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Salary is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Size of Company",
                  label: "20 Peoples",
                  controller: companySizeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Company size is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Company Since",
                  label: "4 years",
                  controller: companySinceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Company since is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
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
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
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
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
                Column(
                  children: List.generate(companyBranches.length, (index) {
                    return buildCompanyBranchBox(
                      index,
                      screenWidth,
                      screenHeight,
                    );
                  }),
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x0f8d8d8d),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            color: AppColors.TxtblueColor,
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Company Description",
                            style: TextStyle(
                              fontSize: ScreenSizeConfig.fontSize + 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.getScreenHeight(context) * 0.024,
                      ),
                      Container(
                        height: screenHeight * 0.2,
                        child: TextField(
                          controller: textEditingControllerCompDes,
                          maxLines: 5,
                          style: CustomTextStyle.formHint,
                          decoration: InputDecoration(
                            hintText: "Company Description....",
                            hintStyle: CustomTextStyle.formHint,
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFFD9D9D9),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                // CommonWidget.cusComSequere(
                //   () => _internetChecker.onTapWithInternetCheck(() {
                //     FocusScope.of(context).unfocus();
                //   }),
                //   "Register",
                // ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
                InkWell(
                  // onTap:
                  //     () => _internetChecker.onTapWithInternetCheck(() {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => VerifyOtpScreen(),
                  //         ),
                  //       );
                  //       // }
                  //     }),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyHomeScreen(),
                      ),
                    );
                    // }
                  },
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
      ),
    );
  }

  Widget buildCompanyBranchBox(
    int index,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      width: screenWidth,
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      decoration: BoxDecoration(
        color: Color(0x0f8d8d8d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Image.asset(Assets.registerComMdiCompany, width: 40),
          //     SizedBox(width: 10),
          //     Text(
          //       "Company Branches",
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: addNewBranch,
          //       child: Container(
          //         width: 30,
          //         height: 30,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: AppColors.TxtblueColor,
          //         ),
          //         child: Icon(Icons.add, color: AppColors.whiteColor, size: 20),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Icon(Icons.apartment, color: AppColors.TxtblueColor, size: 28),
              SizedBox(width: 10),
              Text(
                "Company Branches",
                style: TextStyle(
                  fontSize: ScreenSizeConfig.fontSize + 2,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  addNewBranch();
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.TxtblueColor,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.024),
          buildBranchTextField(
            "Company Name",
            companyBranches[index]["name"]!,
            screenHeight: screenHeight,
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.002),
          buildBranchTextField(
            "Company Address...",
            companyBranches[index]["address"]!,
            isMultiline: true,
            screenHeight: screenHeight,
          ),
        ],
      ),
    );
  }

  Widget buildBranchTextField(
    String hint,
    TextEditingController controller, {
    bool isMultiline = false,
    required double screenHeight,
  }) {
    return Container(
      height: isMultiline ? screenHeight * 0.2 : screenHeight * 0.1,
      child: TextField(
        controller: controller,
        maxLines: isMultiline ? 5 : 1,
        style: CustomTextStyle.formHint,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: CustomTextStyle.formHint,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonFormField<String>(
        value: value.isEmpty ? null : value,
        hint: Text(label, style: CustomTextStyle.formHint),
        items:
            items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item, style: CustomTextStyle.formHint),
              );
            }).toList(),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorStyle: CustomTextStyle.formError,
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        style: CustomTextStyle.formHint,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.TxtblueColor,
        ),
      ),
    );
  }
}
