import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/custom_radio_button.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/pages/homepage.dart';

class AddNewJobScreenEmp extends StatefulWidget {
  const AddNewJobScreenEmp({super.key});

  @override
  State<AddNewJobScreenEmp> createState() => _AddNewJobScreenEmpState();
}

class _AddNewJobScreenEmpState extends State<AddNewJobScreenEmp> {
  int selectedValue = 1;
  final TextEditingController comapnyNameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobLocController = TextEditingController();
  final TextEditingController dec1Controller = TextEditingController();
  final TextEditingController dec2Controller = TextEditingController();
  final TextEditingController dec3Controller = TextEditingController();
  final TextEditingController redEduController = TextEditingController();
  final TextEditingController enterPersonNameController =
      TextEditingController();
  final TextEditingController enterConNoController = TextEditingController();
  final TextEditingController dayShiftSalaryController =
      TextEditingController();
  final TextEditingController nightShiftSalaryController =
      TextEditingController();
  List<String> selectedSkills = ['Leadership fvdgfdgdfgdfgfdgf', 'Flutter'];
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    double getHeight = AppDimensions.getScreenHeight(context);
    double getWidth = AppDimensions.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3F4FF),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cusAppBarWidget("Post Job", 15),
              commonSpace(10, 0),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Text(
                  "Job Duration",
                  style: CustomTextStyle.normalBluecustom(
                    fontSize: 14,
                    color: AppColors.TxtblueColor,
                    fontFamily: TextFont.PoppinsMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRadioButton(
                        text: "Skilled",
                        isBlueBorder: true,
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
                        text: "Non-Skilled",
                        value: 2,
                        isBlueBorder: true,
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
              ),
              commonSpace(10, 0),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          // Assets.empCompanyIcn,
                          "assets/images/mdi_company.png",
                          width: 25,
                          height: 25,
                        ),
                        commonSpace(0, 10),
                        Text(
                          "Job Company",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(20, 0),
                    Text(
                      "Company",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    buildTextFieldBox(
                      "Enter company name",
                      comapnyNameController,
                      TextInputType.text,
                    ),
                    commonSpace(10, 0),
                    Text(
                      "Job Title",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    buildTextFieldBox(
                      "Enter Job Title",
                      jobTitleController,
                      TextInputType.text,
                    ),
                    commonSpace(10, 0),
                    Text(
                      "Job Location",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    buildTextFieldBox(
                      "Enter Job Location",
                      jobLocController,
                      TextInputType.text,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        commonSpace(0, 10),
                        Text(
                          "Job Information",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(20, 0),
                    Text(
                      "Job Duration",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    commonSpace(10, 0),
                    Row(
                      children: [
                        Expanded(
                          child: CustomRadioButton(
                            text: "Full Time",
                            isBlueBorder: true,
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
                            text: "Part Time",
                            value: 2,
                            isBlueBorder: true,
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
                    Text(
                      "Job Place",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    commonSpace(10, 0),
                    Row(
                      children: [
                        Expanded(
                          child: CustomRadioButton(
                            text: "Remote",
                            isBlueBorder: true,
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
                            text: "Office",
                            value: 2,
                            isBlueBorder: true,
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
                    Text(
                      "Job Shift",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    commonSpace(10, 0),
                    Row(
                      children: [
                        Expanded(
                          child: CustomRadioButton(
                            text: "Day Shift",
                            isBlueBorder: true,
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
                            text: "Night Sift",
                            value: 2,
                            isBlueBorder: true,
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
                    Text(
                      "Salary",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    commonSpace(10, 0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: dayShiftSalaryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Day Shift Salary",
                                labelStyle: TextStyle(
                                  color: AppColors.blackColor,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.TxtOrangeColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                              cursorColor: AppColors.TxtOrangeColor,
                            ),
                          ),
                        ),
                        commonSpace(0, 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: nightShiftSalaryController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Night Shift Salary",
                                labelStyle: TextStyle(
                                  color: AppColors.TxtblueColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.TxtOrangeColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                              cursorColor: AppColors.TxtOrangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline),
                        commonSpace(0, 10),
                        Text(
                          "Add Must Needed Things",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(20, 0),
                    buildTextFieldBox(
                      "description 1",
                      dec1Controller,
                      TextInputType.text,
                    ),
                    buildTextFieldBox(
                      "description 2",
                      dec2Controller,
                      TextInputType.text,
                    ),
                    buildTextFieldBox(
                      "description 3",
                      dec2Controller,
                      TextInputType.text,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            CupertinoIcons.minus,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                      commonSpace(0, 10),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              commonSpace(10, 0),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.jobDetailsEducationIcon,
                        //   height: 25,
                        //   width: 25,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Required Education",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(10, 0),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: redEduController,
                        // validator: validator,
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          hintText: "Required education....",
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
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.TxtOrangeColor,
                              width: 1.5,
                            ),
                          ),
                          errorStyle: CustomTextStyle.formError,
                        ),
                        style: CustomTextStyle.formHint,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.jobDetailsRequiredSkillsIcon,
                        //   height: 25,
                        //   width: 25,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Skills",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(10, 0),
                    Container(
                      width: getWidth,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xffD9D9D9),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          commonSpace(0, 10),
                          buildChipList(
                            selectedSkills,
                            (skill) => removeItem(skill, isSkill: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              commonSpace(10, 0),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.jobDetailsEducationIcon,
                        //   height: 25,
                        //   width: 25,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Job Description",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(10, 0),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: redEduController,
                        // validator: validator,
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          hintText: "Job description....",
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
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.TxtOrangeColor,
                              width: 1.5,
                            ),
                          ),
                          errorStyle: CustomTextStyle.formError,
                        ),
                        style: CustomTextStyle.formHint,
                      ),
                    ),
                  ],
                ),
              ),
              commonSpace(10, 0),
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Image.asset(
                        //   Assets.jobDetailsInterviewIcon,
                        //   height: 25,
                        //   width: 25,
                        // ),
                        commonSpace(0, 10),
                        Text(
                          "Interviewer Details",
                          style: CustomTextStyle.normalBluecustom(
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                    commonSpace(15, 0),
                    Text(
                      "Interviewer",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    buildTextFieldBox(
                      "Enter person name",
                      enterPersonNameController,
                      TextInputType.text,
                    ),
                    commonSpace(15, 0),
                    Text(
                      "Contact Number",
                      style: CustomTextStyle.normalBluecustom(
                        fontSize: 14,
                        color: AppColors.TxtblueColor,
                        fontFamily: TextFont.PoppinsMedium,
                      ),
                    ),
                    buildTextFieldBox(
                      "Enter contact number",
                      enterConNoController,
                      TextInputType.phone,
                    ),
                    commonSpace(20, 0),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: AppColors.TxtblueColor,
                    //       padding: EdgeInsets.symmetric(vertical: 12),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       "Post Job",
                    //       style: TextStyle(
                    //         fontSize: ScreenSizeConfig.fontSize,
                    //         fontFamily: Assets.fontsPoppinsSemiBold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeItem(String item, {required bool isSkill}) {
    setState(() {
      selectedSkills.remove(item);
    });
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
              backgroundColor: AppColors.TxtIntroColor,
              labelStyle: TextStyle(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }).toList(),
    );
  }

  Widget cusAppBarWidget(String title, int spaceBtw) {
    return Container(
      height: AppDimensions.getScreenHeight(context) * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 4, // Blur intensity
            spreadRadius: 1, // Spread radius
            offset: Offset(0, 1), // Shadow position (X, Y)
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          // GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Image.asset(
          //     Assets.registerComBackbtn,
          //     width: Get.width * 0.1,
          //   ),
          // ),
          SizedBox(width: spaceBtw.toDouble()),
          Text(
            title,
            style: CustomTextStyle.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldBox(
    String label,
    TextEditingController controller,
    // String? Function(String?) validator,
    TextInputType keyBordType,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          // validator: validator,
          keyboardType: keyBordType,
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
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
              borderSide: BorderSide(
                color: AppColors.TxtOrangeColor,
                width: 1.5,
              ),
            ),
            errorStyle: CustomTextStyle.formError,
          ),
          style: CustomTextStyle.formHint,
        ),
      ),
    );
  }
}
