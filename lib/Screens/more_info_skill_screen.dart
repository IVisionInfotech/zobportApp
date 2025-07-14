import 'package:flutter/material.dart';
import 'package:gotilo_job/Screens/verify_otp_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class MoreInfoSkillScreen extends StatefulWidget {
  const MoreInfoSkillScreen({super.key});

  @override
  State<MoreInfoSkillScreen> createState() => _MoreInfoSkillScreenState();
}

class _MoreInfoSkillScreenState extends State<MoreInfoSkillScreen> {
  List<Map<String, TextEditingController>> companyBranches = [];
  List<String> categoryList = [
    "Machine Manufacturer",
    "IT Services",
    "Healthcare",
  ];
  var selectedCategory = '';
  var selectedSubCategory = '';
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  List<String> subCategoryList = [
    "Handle Machine",
    "Software Development",
    "Medical Equipment",
  ];
  List<Map<String, String>> educationList = [
    {"name": "SSC", "date": "12/04/2022"},
    {"name": "SSC", "date": "12/04/2022"},
  ];
  List<String> selectedSkills = ['Leadership', 'Flutter'];
  List<String> selectedPincodes = ['384002', '384001'];
  List<String> allSkills = [
    'Leadership',
    'Flutter',
    'Dart',
    'React',
    'Node.js',
    'Figma',
    'Java',
    'Python',
  ];
  List<String> allPincodes = ['384001', '384002', '110001', '560001', '400001'];

  TextEditingController skillController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  List<String> filteredSkills = [];
  List<String> filteredPincodes = [];
  TextEditingController companyDescriptionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final InternetChecker _internetChecker = InternetChecker();

  bool isObscured = true;

  @override
  void dispose() {
    _internetChecker.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
    skillController.addListener(
      () => _filterItems(skillController.text, isSkill: true),
    );
    pinCodeController.addListener(
      () => _filterItems(pinCodeController.text, isSkill: false),
    );
  }

  void _filterItems(String input, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        filteredSkills =
            allSkills
                .where(
                  (skill) =>
                      skill.toLowerCase().contains(input.toLowerCase()) &&
                      !selectedSkills.contains(skill),
                )
                .toList();
      } else {
        filteredPincodes =
            allPincodes
                .where(
                  (pin) =>
                      pin.contains(input) && !selectedPincodes.contains(pin),
                )
                .toList();
      }
    });
  }

  void addItem(String item, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        if (!selectedSkills.contains(item)) selectedSkills.add(item);
        skillController.clear();
        filteredSkills.clear();
      } else {
        if (!selectedPincodes.contains(item)) selectedPincodes.add(item);
        pinCodeController.clear();
        filteredPincodes.clear();
      }
    });
  }

  void removeItem(String item, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        selectedSkills.remove(item);
      } else {
        selectedPincodes.remove(item);
      }
    });
  }

  Widget buildChipList(List<String> items, Function(String) onRemove) {
    return Wrap(
      spacing: 8,
      children:
          items.map((item) {
            return Chip(
              label: Text(
                item,
                style: TextStyle(fontSize: ScreenSizeConfig.fontSize),
              ),
              deleteIcon: Icon(Icons.close, color: Colors.white),
              onDeleted: () => onRemove(item),
              backgroundColor: Colors.grey[800],
              labelStyle: TextStyle(color: Colors.white),
            );
          }).toList(),
    );
  }

  Widget buildSearchDropdown(
    List<String> filteredItems,
    Function(String) onSelect,
  ) {
    return Visibility(
      visible: filteredItems.isNotEmpty,
      child: Container(
        margin: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                filteredItems[index],
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => onSelect(filteredItems[index]),
            );
          },
        ),
      ),
    );
  }

  void addNewBranch() {
    setState(() {
      companyBranches.add({
        "name": TextEditingController(),
        "address": TextEditingController(),
      });
    });
  }

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
          "Add More Info",
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
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category", style: CustomTextStyle.normalBlue),
                  SizedBox(height: 10),
                  buildDropdownField(
                    label: "Machine Manufacturer",
                    items: categoryList,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Text("Sub Category", style: CustomTextStyle.normalBlue),
                  SizedBox(height: 10),
                  buildDropdownField(
                    label: "Handle Machine",
                    items: subCategoryList,
                    onChanged: (value) {
                      setState(() {
                        selectedSubCategory = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  buildEducationInfo(educationList, _selectDate),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Text("Select Skills", style: CustomTextStyle.normalBlue),
                  SizedBox(height: 10),
                  TextField(
                    controller: skillController,
                    cursorColor: AppColors.TxtblueColor,
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
                  buildChipList(
                    selectedSkills,
                    (skill) => removeItem(skill, isSkill: true),
                  ),
                  buildSearchDropdown(
                    filteredSkills,
                    (skill) => addItem(skill, isSkill: true),
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Text("City", style: CustomTextStyle.normalBlue),
                  buildTextFieldBox(
                    "Enter City",
                    cityController,
                    TextInputType.text,
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Text("State", style: CustomTextStyle.normalBlue),
                  buildTextFieldBox(
                    "Enter State",
                    stateController,
                    TextInputType.text,
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  Text("Select Pincode", style: CustomTextStyle.normalBlue),
                  SizedBox(height: 10),
                  TextField(
                    cursorColor: AppColors.TxtblueColor,
                    controller: pinCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Search & Add Pin Code",
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
                  buildChipList(
                    selectedPincodes,
                    (pin) => removeItem(pin, isSkill: false),
                  ),
                  buildSearchDropdown(
                    filteredPincodes,
                    (pin) => addItem(pin, isSkill: false),
                  ),
                  SizedBox(
                    height: AppDimensions.getScreenHeight(context) * 0.02,
                  ),
                  dynemicTextField(
                    title: "Company Description",
                    label: "Enter company description",
                    controller: companyDescriptionController,
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
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF26824),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.school, color: AppColors.TxtblueColor),
              SizedBox(width: 10),
              Text(
                "Education Info",
                style: TextStyle(
                  fontSize: ScreenSizeConfig.fontSize + 2,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    educationList.add({
                      "name": "Enter Degree",
                      "date": "Select Date",
                    });
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

  Widget buildDropdownField({
    required String label,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      height: ScreenSizeConfig.buttonHeight,
      child: DropdownButtonFormField(
        hint: Text(label),
        items:
            items.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffD9D9D9), width: 1.5),
          ),
          errorStyle: CustomTextStyle.formError,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.TxtOrangeColor),
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        // style: CustomTextStyle.formHint,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.TxtblueColor,
        ),
      ),
    );
  }

  Widget buildTextFieldBox(
    String label,
    TextEditingController controller,
    TextInputType keyBordType,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: AppColors.TxtblueColor,
        controller: controller,
        keyboardType: keyBordType,
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
          errorStyle: CustomTextStyle.formError,
        ),
        style: CustomTextStyle.formHint,
      ),
    );
  }
}
