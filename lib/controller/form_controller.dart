import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:gotilo_job/Services/dialog_service.dart';
import 'package:permission_handler/permission_handler.dart';

class FormController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var imageFile = Rx<File?>(null);
  // Text Controllers
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyContactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController contactPersonPhoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  // Validation Functions
  String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) return 'Enter a valid 10-digit phone number';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!EmailValidator.validate(value)) return 'Enter a valid email';
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form Submitted Successfully!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Error", "Please fill all required fields",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
  Future<PermissionStatus> requestPermission() async {
    print("Requesting permission to access photos...");

    // Request permission to access photos (gallery)
    PermissionStatus status = await Permission.photos.request();

    if (status.isDenied) {
      print("Permission denied: $status");
    } else if (status.isPermanentlyDenied) {
      print("Permission permanently denied.");
    } else if (status.isGranted) {
      print("Permission granted.");
    }

    return status;
  }

  Future<void> pickImage(BuildContext context) async {
    PermissionStatus status = await requestPermission();
    if (status.isDenied || status.isPermanentlyDenied) {
      DialogService.showOpenSettingsDialog(context, "access to Photo Library");
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Change to image
    );

    isLoading.value = false;
    if (result == null) {
      print("No image picked.");
      return;
    }

    final imageFileX = File(result.files.single.path!);
    imageFile.value = imageFileX;
  }
}
