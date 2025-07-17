import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/Services/api_service.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class RegistrationCompanyController extends GetxController {
  // Page Control
  final PageController pageController = PageController();
  var currentStep = 0.obs;

  // Personal Info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  var imageFile = Rxn<File>();

  // Dropdown visibility controls
  var showStateList = false.obs;
  var showCityList = false.obs;
  var showAreaList = false.obs;
  var isLoadingStates = false.obs;
  var isLoadingCities = false.obs;
  var isLoadingAreas = false.obs;

  // Professional Info
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final companyDescriptionController = TextEditingController();
  var isObscured = true.obs;

  // Company Info
  final companyNameController = TextEditingController();
  final companyContactController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactPersonPhoneController = TextEditingController();
  final salaryController = TextEditingController();
  final companySizeController = TextEditingController();
  final companySinceController = TextEditingController();

  // Branches
  RxList<Map<String, TextEditingController>> companyBranches =
      <Map<String, TextEditingController>>[].obs;

  // Location
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final areaFocus = FocusNode();
  final pincodeFocus = FocusNode();

  // Dropdown Values
  var selectedCategory = Rxn<String>();
  var selectedSubCategory = Rxn<String>();
  var selectedCategoryId = Rxn<int>();
  var selectedSubCategoryId = Rxn<int>();

  // API Data
  var states = <dynamic>[].obs;
  var cities = <dynamic>[].obs;
  var areas = <dynamic>[].obs;
  var selectedStateId = Rxn<int>();
  var selectedCityId = Rxn<int>();
  var selectedAreaId = Rxn<int>();
  var selectedPincode = Rxn<String>();

  var showPincodeList = false.obs;
  var isPincodeEditable = false.obs;
  var pinCodeList = <dynamic>[].obs;

  // Lists
  var categoryList = <dynamic>[].obs;
  var subCategoryList = <dynamic>[].obs;
  var filteredCategories = <String>[].obs;
  var filteredSubCategories = <String>[].obs;

  // Loading States
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addNewBranch();
    fetchStates();
    fetchJobCategories();
    _setupFocusListeners();
    _setupTextControllers();
  }

  void _setupFocusListeners() {
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

  void _setupTextControllers() {
    contactController.addListener(() {
      if (contactController.text.length > 10) {
        contactController.text = contactController.text.substring(0, 10);
        contactController.selection = TextSelection.fromPosition(
          TextPosition(offset: contactController.text.length),
        );
      }
    });

    companyContactController.addListener(() {
      if (companyContactController.text.length > 10) {
        companyContactController.text = companyContactController.text.substring(
          0,
          10,
        );
        companyContactController.selection = TextSelection.fromPosition(
          TextPosition(offset: companyContactController.text.length),
        );
      }
    });

    contactPersonPhoneController.addListener(() {
      if (contactPersonPhoneController.text.length > 10) {
        contactPersonPhoneController.text = contactPersonPhoneController.text
            .substring(0, 10);
        contactPersonPhoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: contactPersonPhoneController.text.length),
        );
      }
    });

    pinCodeController.addListener(() {
      if (pinCodeController.text.length > 6) {
        pinCodeController.text = pinCodeController.text.substring(0, 6);
        pinCodeController.selection = TextSelection.fromPosition(
          TextPosition(offset: pinCodeController.text.length),
        );
      }
    });
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Only numbers are allowed';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  Future<void> fetchStates() async {
    isLoadingStates.value = true;
    try {
      final response = await http.get(Uri.parse(ApiService.getStateUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        states.value = data['data'] as List<dynamic>;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load states: ${e.toString()}');
    } finally {
      isLoadingStates.value = false;
    }
  }

  Future<void> fetchJobCategories() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(ApiService.jobCategoriesUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          categoryList.value = data['data'] as List<dynamic>;
          filteredCategories.value =
              categoryList.map((e) => e['category_nm'].toString()).toList();
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load categories: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSubCategories(int categoryId) async {
    isLoading.value = true;
    selectedSubCategory.value = null;
    selectedSubCategoryId.value = null;

    try {
      final response = await http.get(
        Uri.parse(ApiService.getSubCategoriesUrl(categoryId)),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          subCategoryList.value = data['data'] as List<dynamic>;
          filteredSubCategories.value =
              subCategoryList
                  .map((e) => e['sub_category_nm'].toString())
                  .toList();
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load sub-categories: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadCities() async {
    if (selectedStateId.value == null) return;
    isLoadingCities.value = true;
    try {
      final response = await http.get(
        Uri.parse('${ApiService.getCityUrl}${selectedStateId.value}'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        cities.value = data['data'] as List<dynamic>;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load cities: ${e.toString()}');
    } finally {
      isLoadingCities.value = false;
    }
  }

  Future<void> loadAreas() async {
    if (selectedStateId.value == null || selectedCityId.value == null) return;
    isLoadingAreas.value = true;
    try {
      final response = await http.get(
        Uri.parse(
          '${ApiService.baseUrl}area-list?state_id=${selectedStateId.value}&city_id=${selectedCityId.value}',
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        areas.value = data['data'] as List<dynamic>;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load areas: ${e.toString()}');
    } finally {
      isLoadingAreas.value = false;
    }
  }

  Future<void> fetchPincodeByArea(int areaId) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiService.getpincodeUrl}$areaId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'].isNotEmpty) {
          pinCodeController.text = data['data'][0]['zipcode'].toString();
          selectedPincode.value = data['data'][0]['zipcode'].toString();
        } else {
          pinCodeController.clear();
          selectedPincode.value = null;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load pincode: ${e.toString()}');
    }
  }

  Future<void> postPincode(String pincode, int? areaId) async {
    try {
      final response = await http.post(
        Uri.parse(ApiService.postPincodeUrl),
        body: {'zipcode': pincode, 'area_id': areaId?.toString() ?? ''},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          Get.snackbar('Success', 'Pincode added successfully');
        } else {
          Get.snackbar('Error', data['message'] ?? 'Failed to add pincode');
        }
      } else {
        Get.snackbar('Error', 'Failed to add pincode');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error adding pincode: ${e.toString()}');
    }
  }

  void selectState(dynamic state) {
    stateController.text = state['state_name'];
    selectedStateId.value = state['state_id'];
    showStateList.value = false;
    cityController.clear();
    areaController.clear();
    pinCodeController.clear();
    selectedCityId.value = null;
    selectedAreaId.value = null;
    selectedPincode.value = null;
    loadCities();
  }

  void selectCity(dynamic city) {
    cityController.text = city['city_nm'];
    selectedCityId.value = city['city_id'];
    showCityList.value = false;
    areaController.clear();
    pinCodeController.clear();
    selectedAreaId.value = null;
    selectedPincode.value = null;
    loadAreas();
  }

  void selectArea(dynamic area) {
    areaController.text = area['area_nm'];
    selectedAreaId.value = area['area_id'];
    showAreaList.value = false;
    pinCodeController.clear();
    selectedPincode.value = null;
    fetchPincodeByArea(area['area_id']);
  }

  void addNewBranch() {
    companyBranches.add({
      "name": TextEditingController(),
      "address": TextEditingController(),
    });
  }

  void removeBranch(int index) {
    if (companyBranches.length > 1) {
      companyBranches.removeAt(index);
    }
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await Get.bottomSheet<XFile>(
        SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () async {
                  final photo = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  Get.back(result: photo);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () async {
                  final gallery = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  Get.back(result: gallery);
                },
              ),
            ],
          ),
        ),
      );
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Error', "Error picking image: ${e.toString()}");
    }
  }

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  void nextStep() {
    if (currentStep.value < 1) {
      currentStep.value++;
      pageController.animateToPage(
        currentStep.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      submitForm();
    }
  }

  void previousStep() {
    currentStep.value--;
    pageController.animateToPage(
      currentStep.value,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void submitForm() {
    if (pinCodeController.text.isNotEmpty && selectedPincode.value == null) {
      postPincode(pinCodeController.text, selectedAreaId.value);
    }
    Get.to(() => VerifyOtpScreen());
  }

  @override
  void onClose() {
    // Dispose all controllers
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyDescriptionController.dispose();
    cityController.dispose();
    areaController.dispose();
    stateController.dispose();
    pinCodeController.dispose();

    // Dispose company info controllers
    companyNameController.dispose();
    companyContactController.dispose();
    contactPersonController.dispose();
    contactPersonPhoneController.dispose();
    salaryController.dispose();
    companySizeController.dispose();
    companySinceController.dispose();

    // Dispose branch controllers
    for (var branch in companyBranches) {
      branch['name']?.dispose();
      branch['address']?.dispose();
    }

    // Dispose focus nodes
    stateFocus.dispose();
    cityFocus.dispose();
    areaFocus.dispose();
    pincodeFocus.dispose();

    pageController.dispose();
    super.onClose();
  }
}
