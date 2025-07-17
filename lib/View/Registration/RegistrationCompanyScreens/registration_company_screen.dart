import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/company_registartion_controller.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';

class CompanyRegistrationScreen extends StatelessWidget {
  final RegistrationCompanyController controller = Get.put(
    RegistrationCompanyController(),
  );

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
          "Company Registration",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          _buildHorizontalStepper(),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildPersonalInfoStep(context),
                _buildProfessionalInfoStep(context),
              ],
            ),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildHorizontalStepper() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(
        () => Row(
          children: [
            // Step 1
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          controller.currentStep.value >= 0
                              ? AppColors.TxtblueColor
                              : Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color:
                              controller.currentStep.value >= 0
                                  ? Colors.white
                                  : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          controller.currentStep.value >= 0
                              ? AppColors.TxtblueColor
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color:
                    controller.currentStep.value >= 1
                        ? AppColors.TxtblueColor
                        : Colors.grey[300],
              ),
            ),
            // Step 2
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          controller.currentStep.value >= 1
                              ? AppColors.TxtblueColor
                              : Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color:
                              controller.currentStep.value >= 1
                                  ? Colors.white
                                  : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          controller.currentStep.value >= 1
                              ? AppColors.TxtblueColor
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoStep(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
          Obx(
            () => GestureDetector(
              onTap: controller.pickImage,
              child:
                  controller.imageFile.value == null
                      ? Stack(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            width: AppDimensions.getScreenWidth(context) * 0.32,
                            height:
                                AppDimensions.getScreenWidth(context) * 0.32,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.TxtblueColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Image.file(
                              controller.imageFile.value!,
                              width:
                                  AppDimensions.getScreenWidth(context) * 0.32,
                              height:
                                  AppDimensions.getScreenWidth(context) * 0.32,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.TxtblueColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Company Name", style: CustomTextStyle.normalBlue),
                buildTextField(
                  'Abc company private LTD.',
                  controller.companyNameController,
                  controller.validateRequired,
                  TextInputType.text,
                ),
                commonSpace(10, 0),
                Text("Company Contact No.", style: CustomTextStyle.normalBlue),
                buildTextField(
                  '+91 12345 12345',
                  controller.companyContactController,
                  controller.validatePhone,
                  TextInputType.number,
                ),
                commonSpace(10, 0),
                Text("Company Email", style: CustomTextStyle.normalBlue),
                buildTextField(
                  'Acbd@domain.com',
                  controller.emailController,
                  controller.validateEmail,
                  TextInputType.emailAddress,
                ),
                commonSpace(10, 0),
                Text("Contact Person Name", style: CustomTextStyle.normalBlue),
                buildTextField(
                  'Contact Person Name',
                  controller.contactPersonController,
                  controller.validateRequired,
                  TextInputType.name,
                ),
                commonSpace(10, 0),
                Text(
                  "Contact Person Phone No.",
                  style: CustomTextStyle.normalBlue,
                ),
                buildTextField(
                  'Contact Person Phone No.',
                  controller.contactPersonPhoneController,
                  controller.validatePhone,
                  TextInputType.number,
                ),
                commonSpace(10, 0),
                Text("Company Address", style: CustomTextStyle.normalBlue),
                buildTextField(
                  'Company Address',
                  controller.addressController,
                  controller.validateRequired,
                  TextInputType.text,
                ),
                commonSpace(10, 0),

                // State Field
                Text("State", style: CustomTextStyle.normalBlue),
                Obx(
                  () => _buildDropdownField(
                    context,
                    controller.stateController.text,
                    controller.states,
                    "Select State",
                    displayKey: 'state_name',
                    isLoading: controller.isLoadingStates.value,
                    enabled: true,
                    onTap: () {
                      controller.showStateList.value =
                          !controller.showStateList.value;
                      if (controller.showStateList.value) {
                        controller.showCityList.value = false;
                        controller.showAreaList.value = false;
                      }
                    },
                  ),
                ),
                if (controller.showStateList.value)
                  _buildDropdownList(
                    items: controller.states,
                    displayKey: 'state_name',
                    onSelect: (item) {
                      controller.selectState(item);
                      controller.showStateList.value = false;
                    },
                  ),

                commonSpace(10, 0),

                // City Field
                Text("City", style: CustomTextStyle.normalBlue),
                Obx(
                  () => _buildDropdownField(
                    context,
                    controller.cityController.text,
                    controller.cities,
                    "Select City",
                    displayKey: 'city_nm',
                    isLoading: controller.isLoadingCities.value,
                    enabled: controller.stateController.text.isNotEmpty,
                    onTap: () {
                      if (controller.stateController.text.isEmpty) return;
                      controller.showCityList.value =
                          !controller.showCityList.value;
                      if (controller.showCityList.value) {
                        controller.showAreaList.value = false;
                      }
                    },
                  ),
                ),
                if (controller.showCityList.value)
                  _buildDropdownList(
                    items: controller.cities,
                    displayKey: 'city_nm',
                    onSelect: (item) {
                      controller.selectCity(item);
                      controller.showCityList.value = false;
                    },
                  ),

                commonSpace(10, 0),

                // Area Field
                Text("Area", style: CustomTextStyle.normalBlue),
                Obx(
                  () => _buildDropdownField(
                    context,
                    controller.areaController.text,
                    controller.areas,
                    "Select Area",
                    displayKey: 'area_nm',
                    isLoading: controller.isLoadingAreas.value,
                    enabled: controller.cityController.text.isNotEmpty,
                    onTap: () {
                      if (controller.cityController.text.isEmpty) return;
                      controller.showAreaList.value =
                          !controller.showAreaList.value;
                    },
                  ),
                ),
                if (controller.showAreaList.value)
                  _buildDropdownList(
                    items: controller.areas,
                    displayKey: 'area_nm',
                    onSelect: (item) {
                      controller.selectArea(item);
                      controller.showAreaList.value = false;
                    },
                  ),

                commonSpace(10, 0),

                // Pincode Field
                //   Text("Pincode", style: CustomTextStyle.normalBlue),
                dynemicTextField(
                  title: "Pincode",
                  label: "Enter Pincode",
                  controller: controller.pinCodeController,
                  readOnly:
                      controller.pinCodeController.text.isNotEmpty &&
                      controller.selectedPincode != null,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.selectedPincode != null;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pincode is required';
                    }
                    return null;
                  },
                  suffixIcon:
                      controller.pinCodeController.text.isNotEmpty &&
                              controller.selectedPincode != null
                          ? IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              controller.pinCodeController.clear();
                              controller.selectedPincode != null;
                            },
                          )
                          : null,
                ),
                commonSpace(20, 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalInfoStep(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category", style: CustomTextStyle.normalBlue),
            Obx(
              () =>
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : _buildDropdownField(
                        context,
                        controller.selectedCategory.value ?? '',
                        controller.categoryList,
                        "Select Category",
                        displayKey: 'category_nm',
                        isLoading: controller.isLoading.value,
                        onTap: () async {
                          if (controller.categoryList.isEmpty &&
                              !controller.isLoading.value) {
                            return;
                          }

                          final selectedValue =
                              await showModalBottomSheet<String>(
                                context: context,
                                builder:
                                    (context) => _buildBottomSheet(
                                      context,
                                      controller.categoryList,
                                      "Select Category",
                                      displayKey: 'category_nm',
                                    ),
                              );

                          if (selectedValue != null) {
                            final selectedCategory = controller.categoryList
                                .firstWhere(
                                  (cat) => cat['category_nm'] == selectedValue,
                                  orElse: () => null,
                                );
                            if (selectedCategory != null) {
                              controller.selectedCategory.value = selectedValue;
                              controller.selectedCategoryId.value =
                                  selectedCategory['category_id'];
                              controller.fetchSubCategories(
                                selectedCategory['category_id'],
                              );
                            }
                          }
                        },
                      ),
            ),
            commonSpace(10, 0),
            Text("Sub Category", style: CustomTextStyle.normalBlue),
            Obx(
              () =>
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : _buildDropdownField(
                        context,
                        controller.selectedSubCategory.value ?? '',
                        controller.subCategoryList,
                        "Select Sub Category",
                        displayKey: 'sub_category_nm',
                        isLoading: controller.isLoading.value,
                        enabled: controller.selectedCategory.value != null,
                        onTap: () async {
                          if (controller.subCategoryList.isEmpty &&
                              !controller.isLoading.value)
                            return;

                          final selectedValue =
                              await showModalBottomSheet<String>(
                                context: context,
                                builder:
                                    (context) => _buildBottomSheet(
                                      context,
                                      controller.subCategoryList,
                                      "Select Sub Category",
                                      displayKey: 'sub_category_nm',
                                    ),
                              );

                          if (selectedValue != null) {
                            final selectedSubCategory = controller
                                .subCategoryList
                                .firstWhere(
                                  (subCat) =>
                                      subCat['sub_category_nm'] ==
                                      selectedValue,
                                  orElse: () => null,
                                );
                            if (selectedSubCategory != null) {
                              controller.selectedSubCategory.value =
                                  selectedValue;
                              controller.selectedSubCategoryId.value =
                                  selectedSubCategory['sub_category_id'];
                            }
                          }
                        },
                      ),
            ),
            commonSpace(10, 0),
            Text("Average Salary", style: CustomTextStyle.normalBlue),
            buildTextField(
              'Enter average salary',
              controller.salaryController,
              controller.validateRequired,
              TextInputType.number,
            ),
            commonSpace(10, 0),
            Text("Size of Company", style: CustomTextStyle.normalBlue),
            buildTextField(
              '20 Peoples',
              controller.companySizeController,
              controller.validateRequired,
              TextInputType.number,
            ),
            commonSpace(10, 0),
            Text("Company Since", style: CustomTextStyle.normalBlue),
            buildTextField(
              '4 years',
              controller.companySinceController,
              controller.validateRequired,
              TextInputType.text,
            ),
            commonSpace(10, 0),
            Text("Password", style: CustomTextStyle.normalBlue),
            Obx(
              () => buildPasswordField(
                "Enter password",
                controller.passwordController,
                controller.isObscured.value,
                controller.togglePasswordVisibility,
                controller.validateRequired,
              ),
            ),
            commonSpace(10, 0),
            Text("Confirm Password", style: CustomTextStyle.normalBlue),
            Obx(
              () => buildPasswordField(
                "Enter confirm password",
                controller.confirmPasswordController,
                controller.isObscured.value,
                controller.togglePasswordVisibility,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is required';
                  }
                  if (value != controller.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ),
            commonSpace(10, 0),
            Text("Company Branches", style: CustomTextStyle.normalBlue),
            Obx(
              () => Column(
                children: [
                  ...List.generate(
                    controller.companyBranches.length,
                    (index) => _buildCompanyBranchBox(index),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: AppColors.TxtblueColor,
                      ),
                      onPressed: controller.addNewBranch,
                    ),
                  ),
                ],
              ),
            ),
            commonSpace(10, 0),
            Text("Company Description", style: CustomTextStyle.normalBlue),
            buildDescriptionField(
              "Company Description....",
              controller.companyDescriptionController,
              controller.validateRequired,
            ),
            commonSpace(20, 0),
          ],
        ),
      ),
    );
  }

  Widget autocompleteField({
    required String label,
    required TextEditingController ctrl,
    required FocusNode focus,
    required bool visible,
    required List<dynamic> items,
    required String displayKey,
    required String idKey,
    required void Function(dynamic) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dynemicTextField(
          title: label,
          label: label,
          controller: ctrl,
          onChanged: (value) {
            if (label == 'State') {
              controller.showStateList.value = true;
            } else if (label == 'City') {
              controller.showCityList.value = true;
            } else if (label == 'Area') {
              controller.showAreaList.value = true;
            }
          },
          onTap: () {
            if (label == 'State') {
              controller.showStateList.value = true;
            } else if (label == 'City' && controller.cities.isNotEmpty) {
              controller.showCityList.value = true;
            } else if (label == 'Area' && controller.areas.isNotEmpty) {
              controller.showAreaList.value = true;
            }
          },
          validator: (v) => v == null || v.isEmpty ? 'Select $label' : null,
        ),
        const SizedBox(height: 6),
        if (visible)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = items[index];
                final displayText = item[displayKey].toString();
                if (ctrl.text.isEmpty ||
                    displayText.toLowerCase().contains(
                      ctrl.text.toLowerCase(),
                    )) {
                  return GestureDetector(
                    onTap: () {
                      onSelect(item);
                      focus.unfocus();
                      if (label == 'State') {
                        controller.showStateList.value = false;
                      } else if (label == 'City') {
                        controller.showCityList.value = false;
                      } else if (label == 'Area') {
                        controller.showAreaList.value = false;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text(
                        displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
      ],
    );
  }

  Widget _buildDropdownList({
    required List<dynamic> items,
    required String displayKey,
    required Function(dynamic) onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      constraints: const BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = items[index];
          final displayText = item[displayKey].toString();
          return GestureDetector(
            onTap: () => onSelect(item),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Text(
                displayText,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdownField(
    BuildContext context,
    String value,
    List<dynamic> items,
    String hint, {
    String displayKey = 'name',
    bool isLoading = false,
    bool enabled = true,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                enabled
                    ? (value.isEmpty ? Colors.grey : AppColors.TxtblueColor)
                    : Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value.isEmpty ? hint : value,
                style:
                    value.isEmpty
                        ? CustomTextStyle.formHint
                        : TextStyle(color: Colors.black),
              ),
            ),
            if (isLoading)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.TxtblueColor,
                  ),
                ),
              ),
            // Icon(
            //   Icons.arrow_drop_down,
            //   color: enabled ? Colors.grey : Colors.grey[300],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    List<dynamic> items,
    String title, {
    String displayKey = 'name',
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map<String, dynamic>;
                return ListTile(
                  title: Text(item[displayKey].toString()),
                  onTap: () {
                    Navigator.pop(context, item[displayKey].toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String hint,
    TextEditingController controller,
    String? Function(String?) validator,
    TextInputType keyboardType, {
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: CustomTextStyle.formHint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.TxtblueColor, width: 1.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildPasswordField(
    String hint,
    TextEditingController controller,
    bool isObscured,
    VoidCallback onToggle,
    String? Function(String?) validator,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscured,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: CustomTextStyle.formHint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.TxtblueColor, width: 1.5),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isObscured ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onToggle,
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildDescriptionField(
    String hint,
    TextEditingController controller,
    String? Function(String?) validator,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLines: 5,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: CustomTextStyle.formHint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.TxtblueColor, width: 1.5),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCompanyBranchBox(int index) {
    final branch = controller.companyBranches[index];

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.business, color: AppColors.TxtblueColor),
              SizedBox(width: 10),
              Text(
                "Branch ${index + 1}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              if (controller.companyBranches.length > 1)
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => controller.removeBranch(index),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text("Branch Name", style: CustomTextStyle.normalBlue),
          buildTextField("Branch Name", branch['name']!, (value) {
            if (value == null || value.isEmpty) {
              return 'Branch name is required';
            }
            return null;
          }, TextInputType.text),
          SizedBox(height: 10),
          Text("Branch Address", style: CustomTextStyle.normalBlue),
          buildDescriptionField("Branch Address", branch['address']!, (value) {
            if (value == null || value.isEmpty) {
              return 'Branch address is required';
            }
            return null;
          }),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(
        () => Row(
          children: [
            if (controller.currentStep.value != 0) ...[
              Expanded(
                child: InkWell(
                  onTap: controller.previousStep,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.TxtblueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: AppColors.TxtblueColor,
                        fontSize: ScreenSizeConfig.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
            Expanded(
              child: InkWell(
                onTap: controller.nextStep,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: ScreenSizeConfig.buttonHeight,
                  decoration: BoxDecoration(
                    color: AppColors.TxtOrangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    controller.currentStep.value == 1 ? 'Register' : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSizeConfig.fontSize,
                      fontFamily: TextFont.PoppinsMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonSpace(double height, double width) {
    return SizedBox(height: height, width: width);
  }
}

class CustomTextStyle {
  static final normalBlue = TextStyle(
    color: AppColors.TxtblueColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const formHint = TextStyle(color: Colors.grey, fontSize: 14);
}
