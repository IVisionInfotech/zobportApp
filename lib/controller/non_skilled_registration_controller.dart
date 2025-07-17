import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Services/api_service.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Services/shared_pref_service.dart';
import 'package:http/http.dart' as http;
import 'package:animated_snack_bar/animated_snack_bar.dart';

class NonSkilledRegistrationController extends GetxController {
  final internetChecker = InternetChecker();
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final pincodeController = TextEditingController();

  // Focus nodes
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final areaFocus = FocusNode();
  final pincodeFocus = FocusNode();

  // Data lists
  RxList<dynamic> states = <dynamic>[].obs;
  RxList<dynamic> cities = <dynamic>[].obs;
  RxList<dynamic> areas = <dynamic>[].obs;
  RxList<dynamic> pincodes = <dynamic>[].obs;

  // Selections
  RxInt? selectedStateId;
  RxInt? selectedCityId;
  RxInt? selectedAreaId;
  RxString? selectedPincode;

  // UI state
  RxBool showStateList = false.obs;
  RxBool showCityList = false.obs;
  RxBool showAreaList = false.obs;
  RxBool showPincodeList = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool showManualPincodeField = false.obs;

  @override
  void onInit() {
    super.onInit();
    internetChecker.checkInternet();
    fetchStates();

    stateFocus.addListener(() {
      if (!stateFocus.hasFocus) showStateList.value = false;
    });

    cityFocus.addListener(() {
      if (!cityFocus.hasFocus) showCityList.value = false;
    });

    areaFocus.addListener(() {
      if (!areaFocus.hasFocus) showAreaList.value = false;
    });

    pincodeFocus.addListener(() {
      if (!pincodeFocus.hasFocus) showPincodeList.value = false;
    });
  }

  Future<void> fetchStates() async {
    try {
      final resp = await http.get(Uri.parse(ApiService.getStateUrl));
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body)['data'] as List<dynamic>;
        states.value = data;
      }
    } catch (e) {
      log("Error fetching states: $e");
    }
  }

  Future<void> fetchCities(int stateId) async {
    try {
      final resp = await http.get(
        Uri.parse("${ApiService.getCityUrl}$stateId"),
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body)['data'] as List<dynamic>;
        cities.value = data;
        cityController.clear();
        areaController.clear();
        pincodeController.clear();
        selectedCityId = null;
        selectedAreaId = null;
        selectedPincode = null;
        areas.clear();
        pincodes.clear();
        showCityList.value = true;
      }
    } catch (e) {
      log("Error fetching cities: $e");
    }
  }

  Future<void> fetchAreas(int cityId) async {
    try {
      final resp = await http.get(
        Uri.parse("${ApiService.getAreaUrl}/$cityId"),
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body)['data'] as List<dynamic>;
        areas.value = data;
        areaController.clear();
        pincodeController.clear();
        selectedAreaId = null;
        selectedPincode = null;
        pincodes.clear();
        showAreaList.value = true;
      }
    } catch (e) {
      log("Error fetching areas: $e");
    }
  }

  Future<void> fetchPincodes(int areaId) async {
    try {
      final resp = await http.get(
        Uri.parse("${ApiService.getpincodeUrl}$areaId"),
      );
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body)['data'] as List<dynamic>;
        pincodes.value = data;
        pincodeController.clear();
        selectedPincode = null;
        showPincodeList.value = true;
        showManualPincodeField.value = pincodes.isEmpty;
      }
    } catch (e) {
      log("Error fetching pincodes: $e");
      showManualPincodeField.value = true;
    }
  }

  Future<void> signup(BuildContext context, VoidCallback onSuccess) async {
    if (isSubmitting.value || !formKey.currentState!.validate()) return;

    // Validate pincode if manual entry is shown
    if (showManualPincodeField.value &&
        (pincodeController.text.isEmpty ||
            pincodeController.text.length != 6)) {
      AnimatedSnackBar.material(
        "Please enter a valid 6-digit pincode",
        type: AnimatedSnackBarType.error,
        duration: const Duration(seconds: 3),
      ).show(context);
      return;
    }

    isSubmitting.value = true;

    final payload = {
      "name":
          "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
      "contact_no": contactController.text.trim(),
      "email": emailController.text.trim(),
      "city_id": selectedCityId?.value.toString() ?? '',
      "state_id": selectedStateId?.value.toString() ?? '',
      "area_id": selectedAreaId?.value.toString() ?? '',
      "password": passwordController.text.trim(),
      "state_name": stateController.text.trim(),
      "city_name": cityController.text.trim(),
      "area_name": areaController.text.trim(),
      "zipcode":
          showManualPincodeField.value
              ? pincodeController.text.trim()
              : selectedPincode?.value ?? '',
      "preference_type": "2",
      "address": addressController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse("https://projectiv.in/zobpot/public/api/register"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: payload,
      );

      log("Signup response: ${response.body}");

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody['status'] == true) {
        final userId = responseBody['user_id'];
        await SharedPrefService.saveUserId(userId);

        AnimatedSnackBar.material(
          responseBody['message'] ?? "Registered successfully",
          type: AnimatedSnackBarType.success,
          duration: const Duration(seconds: 3),
        ).show(context);

        onSuccess();
      } else {
        AnimatedSnackBar.material(
          responseBody['message'] ?? "Registration failed",
          type: AnimatedSnackBarType.error,
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    } catch (e) {
      log("Signup Error: $e");
      AnimatedSnackBar.material(
        "Something went wrong: $e",
        type: AnimatedSnackBarType.error,
        duration: const Duration(seconds: 3),
      ).show(context);
    } finally {
      isSubmitting.value = false;
    }
  }

  @override
  void onClose() {
    internetChecker.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    stateController.dispose();
    cityController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    stateFocus.dispose();
    cityFocus.dispose();
    areaFocus.dispose();
    pincodeFocus.dispose();
    super.onClose();
  }
}
