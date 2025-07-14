import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormControllerAddPass extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Password visibility
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

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
