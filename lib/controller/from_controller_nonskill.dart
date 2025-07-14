import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromControllerNonskill extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password Visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validation Methods
  String? validateRequired(String? value) {
    return value == null || value.trim().isEmpty ? "This field is required" : null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value) ? null : "Enter a valid email";
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) return "Phone number is required";
    String pattern = r'^\+91[6-9]\d{9}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value) ? null : "Enter a valid Indian phone number";
  }

  String? validatePinCode(String? value) {
    if (value == null || value.trim().isEmpty) return "Pin Code is required";
    String pattern = r'^\d{6}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value) ? null : "Enter a valid Pin Code";
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return "Confirm password is required";
    if (value != passwordController.text) return "Passwords do not match";
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form Submitted Successfully!", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
