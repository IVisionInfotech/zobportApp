import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/custom_radio_button.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/pages/homepage.dart';

class ResumeBuilderPreviewScreen extends StatefulWidget {
  const ResumeBuilderPreviewScreen({super.key});

  @override
  State<ResumeBuilderPreviewScreen> createState() =>
      _ResumeBuilderPreviewScreenState();
}

class _ResumeBuilderPreviewScreenState
    extends State<ResumeBuilderPreviewScreen> {
  final TextEditingController expectedSalary = TextEditingController();
  TextEditingController skillController = TextEditingController();
  List<String> categoryList = [
    "Machine Manufacturer",
    "IT Services",
    "Healthcare",
  ];
  var selectedCategory = '';
  String? selectedCategoryTech = '';
  List<String> categories = [
    "Technology & IT",
    "Engineering",
    "Medical",
    "Construction",
    "Finance",
    "Creative & Design",
  ];
  List<String> subcategories = [
    "App Development",
    "Web Developer",
    "Data Scientist",
    "Cybersecurity",
  ];
  String? selectedSubCategory;
  List<Map<String, String>> educationList = [
    {"name": "SSC", "date": "12/04/2022"},
  ];
  Future<void> _selectDate(int index) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        educationList[index]["date"] =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  List<String> selectedSkills = ['Leadership', 'Flutter'];
  void removeItem(String item, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        selectedSkills.remove(item);
      }
    });
  }

  int selectedValue = 1;

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
                child: Text("Preview", style: CustomTextStyle.normalBlue),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // cusAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center(
                    //   child: Image.asset(
                    //     Assets.editProfileUsereditImg,
                    //     height: 90,
                    //     width: 90,
                    //   ),
                    // ),
                    commonSpace(20, 0),
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.generatePdfDocumenyIcon,
                        //   width: 25,
                        //   height: 25,
                        // ),
                        commonSpace(0, 10),
                        Center(
                          child: Text(
                            "Job Information",
                            style: CustomTextStyle.normalBluecustom(
                              fontSize: ScreenSizeConfig.fontSize,
                              color: Colors.black,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                        ),
                        commonSpace(20, 0),
                      ],
                    ),
                    commonSpace(10, 0),
                    buildTextField(
                      "Expected Salary",
                      "Expected Salary",
                      expectedSalary,
                      TextInputType.number,
                    ),
                    commonSpace(10, 0),
                    Text("Category", style: CustomTextStyle.normalBlue),
                    commonSpace(12, 0),
                    buildDropdownField(
                      label: "Machine Manufacturer",
                      items: categoryList,
                      onChanged:
                          (value) => setState(() {
                            selectedCategory = value!;
                          }),
                    ),
                    commonSpace(20, 0),
                    Text("Select Category", style: CustomTextStyle.normalBlue),
                    commonSpace(12, 0),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          categories.map((category) {
                            bool isSelected = category == selectedCategoryTech;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // If already selected, unselect it; otherwise, select new one
                                  selectedCategoryTech =
                                      isSelected ? null : category;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontFamily: Assets.fontsPoppinsMedium,
                                    fontSize: ScreenSizeConfig.fontSize,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    commonSpace(20, 0),
                    Text(
                      "Select From $selectedCategory",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: ScreenSizeConfig.fontSize,
                        color: Colors.black,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    commonSpace(12, 0),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          subcategories.map((category) {
                            bool isSelected = category == selectedSubCategory;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSubCategory =
                                      isSelected ? null : category;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontFamily: Assets.fontsPoppinsMedium,
                                    fontSize: ScreenSizeConfig.fontSize,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    commonSpace(20, 0),
                    Text("Select Skills", style: CustomTextStyle.normalBlue),
                    SizedBox(height: 8),
                    buildChipList(
                      selectedSkills,
                      (skill) => removeItem(skill, isSkill: true),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: skillController,
                      style: CustomTextStyle.formHint,
                      decoration: InputDecoration(
                        hintText: "Search & Add Skills",
                        hintStyle: CustomTextStyle.formHint,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffD9D9D9),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.TxtOrangeColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    commonSpace(20, 0),
                    Text("Select Category", style: CustomTextStyle.normalBlue),
                    commonSpace(12, 0),
                    Row(
                      children: [
                        Expanded(
                          child: CustomRadioButton(
                            text: "Experienced",
                            isBlueBorder: false,
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ),
                        commonSpace(0, 10),
                        Expanded(
                          child: CustomRadioButton(
                            text: "Fresher",
                            value: 2,
                            isBlueBorder: false,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    commonSpace(20, 0),
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.profilePageWorkbagIcon,
                        //   height: 30,
                        //   width: 30,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Add Experience",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Color(0xff0D0140),
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.08,
                          height: AppDimensions.getScreenHeight(context) * 0.04,
                          decoration: BoxDecoration(
                            color: AppColors.TxtOrangeColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.plus,
                              color: AppColors.TxtblueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    commonSpace(20, 0),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 30,
                            spreadRadius: 0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xf192845),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.apartment,
                                  color: AppColors.TxtOrangeColor,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "XYZ Company Pvt. LTD.",
                                    style: CustomTextStyle.normalBluecustom(
                                      fontSize: ScreenSizeConfig.fontSize,
                                      color: Color(0xff404040),
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Ahmedabad - 2 Years Experience",
                                    style: CustomTextStyle.normalBluecustom(
                                      fontSize: ScreenSizeConfig.fontSize - 2,
                                      color: Color(0xff878787),
                                      fontFamily: TextFont.PoppinsMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          commonSpace(12, 0),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "3048 Caldwell Road Brighton, NY 14623",
                                  style: CustomTextStyle.normalBluecustom(
                                    fontSize: ScreenSizeConfig.fontSize,
                                    color: Color(0xff000000),
                                    fontFamily: TextFont.PoppinsMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    commonSpace(20, 0),
                    Text(
                      "Add Experience Details",
                      style: CustomTextStyle.normalBlue,
                    ),
                    commonSpace(12, 0),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          CustomTextField(label: "Company Name"),
                          SizedBox(height: 16),
                          CustomTextField(
                            label: "Company Address",
                            maxLines: 3,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(label: "City"),
                          SizedBox(height: 16),
                          CustomTextField(label: "Area"),
                          SizedBox(height: 16),
                          CustomTextField(
                            label: "Pin Code",
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    commonSpace(20, 0),
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.profilePageEducationIcon,
                        //   height: 30,
                        //   width: 30,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Education Information",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: ScreenSizeConfig.fontSize,
                            color: Color(0xff0D0140),
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: AppDimensions.getScreenWidth(context) * 0.08,
                          height: AppDimensions.getScreenHeight(context) * 0.04,
                          decoration: BoxDecoration(
                            color: AppColors.TxtOrangeColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.plus,
                              color: AppColors.TxtblueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    commonSpace(12, 0),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          CustomTextField(label: "Board Name"),
                          SizedBox(height: 16),
                          CustomTextField(label: "Start Date"),
                          SizedBox(height: 16),
                          CustomTextField(label: "End Date"),
                        ],
                      ),
                    ),
                    commonSpace(20, 0),
                    Text("Expected Salary", style: CustomTextStyle.normalBlue),
                    commonSpace(12, 0),
                    CustomTextField(label: "Hobbies"),
                    commonSpace(50, 0),
                    CommonWidget.cusComSequere(() {}, "Generate Resume"),
                    commonSpace(20, 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cusAppBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     // Get.back();
        //     Navigator.pop(context);
        //   },
        //   child: Image.asset(
        //     Assets.registerComBackbtn,
        //     width: AppDimensions.getScreenWidth(context) * 0.1,
        //   ),
        // ),
        commonSpace(0, 10),
        Text(
          "Resume Builder",
          style: CustomTextStyle.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            // Get.back();
            Navigator.pop(context);
          },
          child: Container(
            width: AppDimensions.getScreenWidth(context) * 0.26,
            // height: Get.height * 0.07,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0x242A621A), // Change color as needed
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text("Preview", style: CustomTextStyle.normalBlue),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildChipList(List<String> items, Function(String) onRemove) {
    return Wrap(
      spacing: 8,
      children:
          items.map((item) {
            return Chip(
              label: Text(item),
              deleteIcon: Icon(Icons.close, color: Colors.white),
              onDeleted: () => onRemove(item),
              backgroundColor: Colors.grey[800],
              labelStyle: TextStyle(color: Colors.white),
            );
          }).toList(),
    );
  }

  Widget buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomTextStyle.normalBlue),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          // validator: validator,
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
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(12),
      //   borderSide: BorderSide(color: Color(0xff242A62), width: 1),
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.TxtOrangeColor, width: 1.5),
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    // required RxString value,
    required List<String> items,
    required void Function(String?) onChanged,
    // required String? Function(String?) validator,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonFormField(
        // value: value.value.isEmpty ? null : value.value,
        hint: Text(label, style: CustomTextStyle.formHint),
        items:
            items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item, style: CustomTextStyle.formHint),
              );
            }).toList(),
        onChanged: onChanged,
        // validator: validator,
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

  Widget buildEducationInfo(
    List<Map<String, String>> educationList,
    Function(int) selectDate,
  ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF26824), // Orange background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            children: [
              Icon(Icons.school, color: AppColors.TxtblueColor, size: 30),
              SizedBox(width: 10),
              Text(
                "Education Info",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  educationList.add({
                    "name": "Enter Degree",
                    "date": "Select Date",
                  });
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
          SizedBox(height: 10),
          Divider(color: AppColors.TxtblueColor),
          SizedBox(height: 10),

          Column(
            children: List.generate(educationList.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: buildEducationName(
                        "Enter Degree",
                        educationList[index]["name"]!,
                        false,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => selectDate(index),
                        child: buildEducationName(
                          "",
                          educationList[index]["date"]!,
                          true,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildEducationName(String hint, String value, bool isDateField) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(value, style: CustomTextStyle.formHint),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextInputType keyboardType;

  CustomTextField({
    required this.label,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: Color(0xFFD9D9D9),
          ), // Updated color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: Color(0xFFD9D9D9),
          ), // For default state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.red,
          ), // Optional: Change when focused
        ),
      ),
    );
  }
}
