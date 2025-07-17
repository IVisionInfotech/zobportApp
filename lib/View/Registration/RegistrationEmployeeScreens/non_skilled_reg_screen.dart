import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:gotilo_job/Controller/non_skilled_registration_controller.dart';

class NonSkilledRegScreen extends StatelessWidget {
  const NonSkilledRegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    final controller = Get.put(NonSkilledRegistrationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Non Skilled Registration",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // First & Last Name
                Row(
                  children: [
                    Expanded(
                      child: dynemicTextField(
                        title: "First Name",
                        label: "First Name",
                        controller: controller.firstNameController,
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: dynemicTextField(
                        title: "Last Name",
                        label: "Last Name",
                        controller: controller.lastNameController,
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Contact & Email & Address...
                dynemicTextField(
                  title: "Contact",
                  label: "Contact",
                  keyboardType: TextInputType.phone,
                  controller: controller.contactController,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Required';
                    if (v.length != 10) return 'Must be 10 digits';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                dynemicTextField(
                  title: "Email",
                  label: "Email",
                  controller: controller.emailController,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                dynemicTextField(
                  title: "Address",
                  label: "Address",
                  controller: controller.addressController,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 24),

                // Auto-complete fields wrapped in Obx where necessary:
                buildAutocompleteField(
                  controller: controller,
                  label: "State",
                  ctrl: controller.stateController,
                  focus: controller.stateFocus,
                  visible: controller.showStateList.value,
                  items: controller.states,
                  displayKey: "state_name",
                  onSelect: (e) {
                    controller.stateController.text = e['state_name'];
                    controller.selectedStateId = e['state_id'].obs;
                    controller.showStateList.value = false;
                    controller.fetchCities(e['state_id']);
                  },
                ),
                const SizedBox(height: 16),
                buildAutocompleteField(
                  controller: controller,
                  label: "City",
                  ctrl: controller.cityController,
                  focus: controller.cityFocus,
                  visible: controller.showCityList.value,
                  items: controller.cities,
                  displayKey: "city_nm",
                  enabled: controller.selectedStateId != null,
                  onSelect: (e) {
                    controller.cityController.text = e['city_nm'];
                    controller.selectedCityId = e['city_id'].obs;
                    controller.showCityList.value = false;
                    controller.fetchAreas(e['city_id']);
                  },
                ),
                const SizedBox(height: 16),
                buildAutocompleteField(
                  controller: controller,
                  label: "Area",
                  ctrl: controller.areaController,
                  focus: controller.areaFocus,
                  visible: controller.showAreaList.value,
                  items: controller.areas,
                  displayKey: "area_name",
                  enabled: controller.selectedCityId != null,
                  onSelect: (e) {
                    controller.areaController.text = e['area_name'];
                    controller.selectedAreaId = e['area_id'].obs;
                    controller.showAreaList.value = false;
                    controller.fetchPincodes(e['area_id']);
                  },
                ),
                const SizedBox(height: 16),

                Obx(() {
                  return controller.showManualPincodeField.value
                      ? dynemicTextField(
                        title: "Pincode",
                        label: "Enter 6-digit Pincode",
                        keyboardType: TextInputType.number,
                        controller: controller.pincodeController,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Required';
                          if (v.length != 6) return 'Must be 6 digits';
                          return null;
                        },
                      )
                      : buildAutocompleteField(
                        controller: controller,
                        label: "Pincode",
                        ctrl: controller.pincodeController,
                        focus: controller.pincodeFocus,
                        visible: controller.showPincodeList.value,
                        items: controller.pincodes,
                        displayKey: "zipcode",
                        enabled: controller.selectedAreaId != null,
                        onSelect: (e) {
                          controller.pincodeController.text = e['zipcode'];
                          controller.selectedPincode =
                              e['zipcode'].toString().obs;
                          controller.showPincodeList.value = false;
                        },
                      );
                }),

                const SizedBox(height: 24),
                dynemicTextField(
                  title: "Password",
                  label: "Password",
                  controller: controller.passwordController,
                  isVisible: ValueNotifier(true),
                  showPassword: true,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                dynemicTextField(
                  title: "Confirm Password",
                  label: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  isVisible: ValueNotifier(true),
                  showPassword: true,
                  validator: (v) {
                    if (v!.isEmpty) return 'Required';
                    if (v != controller.passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Submit
                InkWell(
                  onTap:
                      controller.isSubmitting.value
                          ? null
                          : () => controller.signup(context, () {
                            Get.to(() => const VerifyOtpScreen());
                          }),
                  child: Container(
                    height: ScreenSizeConfig.buttonHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          controller.isSubmitting.value
                              ? Colors.grey
                              : AppColors.TxtOrangeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child:
                          controller.isSubmitting.value
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSizeConfig.fontSize,
                                ),
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

  Widget buildAutocompleteField({
    required NonSkilledRegistrationController controller,
    required String label,
    required TextEditingController ctrl,
    required FocusNode focus,
    required bool visible,
    required List<dynamic> items,
    required String displayKey,
    bool enabled = true,
    required void Function(dynamic) onSelect,
  }) {
    final filteredItems =
        items
            .where(
              (e) => e[displayKey].toString().toLowerCase().contains(
                ctrl.text.toLowerCase(),
              ),
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dynemicTextField(
          title: label,
          label: label,
          controller: ctrl,
          focusNode: focus,
          //  enabled: enabled,
          onChanged: (v) {
            switch (label) {
              case 'State':
                controller.showStateList.value = true;
                break;
              case 'City':
                controller.showCityList.value = true;
                break;
              case 'Area':
                controller.showAreaList.value = true;
                break;
              case 'Pincode':
                controller.showPincodeList.value = true;
                break;
            }
          },
          onTap: () {
            if (enabled) {
              switch (label) {
                case 'State':
                  controller.showStateList.value = true;
                  break;
                case 'City':
                  controller.showCityList.value = true;
                  break;
                case 'Area':
                  controller.showAreaList.value = true;
                  break;
                case 'Pincode':
                  controller.showPincodeList.value = true;
                  break;
              }
            }
          },
          validator: (v) => (v == null || v.isEmpty) ? 'Select $label' : null,
        ),
        if (visible && enabled)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (_, i) {
                final e = filteredItems[i];
                return ListTile(
                  title: Text(
                    e[displayKey],
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () => onSelect(e),
                );
              },
            ),
          ),
      ],
    );
  }
}
