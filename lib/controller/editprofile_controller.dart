import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class EditProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController preJobLocController = TextEditingController();

  var selectedCategory = ''.obs;
  List<String> categoryList = ["IT", "Marketing", "Finance", "HR", "Engineering"];

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!EmailValidator.validate(value)) return 'Enter a valid email';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\d{10,15}\$').hasMatch(value)) return 'Enter a valid phone number';
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Profile updated successfully", snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Please correct the errors in the form", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
