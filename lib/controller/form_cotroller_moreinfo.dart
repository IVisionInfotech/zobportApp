import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormCotrollerMoreinfo extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController companySizeController = TextEditingController();
  final TextEditingController companySinceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Dropdown selections
  var selectedCategory = ''.obs;
  var selectedSubCategory = ''.obs;

  // Password visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Dropdown items
  List<String> categoryList = ["Machine Manufacturer", "IT Services", "Healthcare"];
  List<String> subCategoryList = ["Handle Machine", "Software Development", "Medical Equipment"];

  // Validation functions
  String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select an option";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form submitted successfully",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Please correct the errors in the form",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
