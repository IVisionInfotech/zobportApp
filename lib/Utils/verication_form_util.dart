import 'package:get/get.dart';

class VerificationFormUtils {
  static final isPasswordVisible = false.obs;
  static final isConfirmPasswordVisible = false.obs;

  static void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  static void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validators
  static String? validateRequired(String? value) {
    return value == null || value.trim().isEmpty
        ? "This field is required"
        : null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(pattern).hasMatch(value) ? null : "Enter a valid email";
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty)
      return "Phone number is required";
    String pattern = r'^\+91[6-9]\d{9}$';
    return RegExp(pattern).hasMatch(value)
        ? null
        : "Enter a valid Indian phone number";
  }

  static String? validatePinCode(String? value) {
    if (value == null || value.trim().isEmpty) return "Pin Code is required";
    return RegExp(r'^\d{6}$').hasMatch(value) ? null : "Enter a valid Pin Code";
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return "Confirm password is required";
    return value != password ? "Passwords do not match" : null;
  }
}
