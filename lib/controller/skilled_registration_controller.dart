// skilled_registration_controller.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotilo_job/View/Registration/add_passord_screen.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:gotilo_job/Services/api_service.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';

class SkilledRegistrationController extends GetxController {
  final InternetChecker _internetChecker = InternetChecker();
  final _formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();

  // Current step
  var currentStep = 0.obs;
  var isLoading = false.obs;

  // Personal Info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  var imageFile = Rxn<File>();

  // Location - Step 1
  final cityController1 = TextEditingController();
  final areaController1 = TextEditingController();
  final stateController1 = TextEditingController();
  final pinCodeController1 = TextEditingController();
  final stateFocus1 = FocusNode();
  final cityFocus1 = FocusNode();
  final areaFocus1 = FocusNode();
  final pincodeFocus1 = FocusNode();

  // Location - Step 2
  final cityController2 = TextEditingController();
  final areaController2 = TextEditingController();
  final stateController2 = TextEditingController();
  final pinCodeController2 = TextEditingController();
  final stateFocus2 = FocusNode();
  final cityFocus2 = FocusNode();
  final areaFocus2 = FocusNode();
  final pincodeFocus2 = FocusNode();

  // Professional Info
  final companyDescriptionController = TextEditingController();
  final skillController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isObscured = true.obs;

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

  var showStateList1 = false.obs;
  var showCityList1 = false.obs;
  var showAreaList1 = false.obs;
  var showPincodeList1 = false.obs;

  var showStateList2 = false.obs;
  var showCityList2 = false.obs;
  var showAreaList2 = false.obs;
  var showPincodeList2 = false.obs;

  var isPincodeEditable = false.obs;

  // Lists
  var categoryList = <dynamic>[].obs;
  var subCategoryList = <dynamic>[].obs;
  var skillsList = <String>[].obs;
  var allSkills = <String>[].obs;
  var selectedSkills = <String>[].obs;
  var filteredSkills = <String>[].obs;
  var filteredCategories = <String>[].obs;
  var filteredSubCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _internetChecker.checkInternet();
    fetchStates();
    fetchJobCategories();

    // Add focus listeners
    _setupFocusListeners();

    // Skill controller listener
    skillController.addListener(() {
      _filterItems(skillController.text);
    });
  }

  void _setupFocusListeners() {
    stateFocus1.addListener(() {
      if (!stateFocus1.hasFocus) showStateList1.value = false;
    });
    cityFocus1.addListener(() {
      if (!cityFocus1.hasFocus) showCityList1.value = false;
    });
    areaFocus1.addListener(() {
      if (!areaFocus1.hasFocus) showAreaList1.value = false;
    });
    pincodeFocus1.addListener(() {
      if (!pincodeFocus1.hasFocus) showPincodeList1.value = false;
    });

    stateFocus2.addListener(() {
      if (!stateFocus2.hasFocus) showStateList2.value = false;
    });
    cityFocus2.addListener(() {
      if (!cityFocus2.hasFocus) showCityList2.value = false;
    });
    areaFocus2.addListener(() {
      if (!areaFocus2.hasFocus) showAreaList2.value = false;
    });
    pincodeFocus2.addListener(() {
      if (!pincodeFocus2.hasFocus) showPincodeList2.value = false;
    });
  }

  Future<void> fetchStates() async {
    try {
      final response = await http.get(Uri.parse(ApiService.getStateUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        states.value = data['data'] as List<dynamic>;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load states: ${e.toString()}');
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

  Future<void> fetchSkills(int categoryId, int subCategoryId) async {
    isLoading.value = true;
    selectedSkills.clear();

    try {
      final response = await http.get(
        Uri.parse(ApiService.getSkillsUrl(categoryId, subCategoryId)),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          skillsList.value = List<String>.from(data['data']);
          allSkills.value = skillsList;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load skills: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCities(int stateId, {bool isStep1 = true}) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiService.getCityUrl}$stateId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        cities.value = data['data'] as List<dynamic>;

        if (isStep1) {
          cityController1.clear();
          areaController1.clear();
          pinCodeController1.clear();
        } else {
          cityController2.clear();
          areaController2.clear();
          pinCodeController2.clear();
        }

        selectedCityId.value = null;
        selectedAreaId.value = null;
        selectedPincode.value = null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load cities: ${e.toString()}');
    }
  }

  Future<void> fetchAreas(
    int stateId,
    int cityId, {
    bool isStep1 = true,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ApiService.baseUrl}area-list?state_id=$stateId&city_id=$cityId',
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        areas.value = data['data'] as List<dynamic>;

        if (isStep1) {
          areaController1.clear();
          pinCodeController1.clear();
        } else {
          areaController2.clear();
          pinCodeController2.clear();
        }

        selectedAreaId.value = null;
        selectedPincode.value = null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load areas: ${e.toString()}');
    }
  }

  Future<void> fetchPincodeByArea(int areaId, {bool isStep1 = true}) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiService.getpincodeUrl}$areaId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'].isNotEmpty) {
          if (isStep1) {
            pinCodeController1.text = data['data'][0]['zipcode'].toString();
          } else {
            pinCodeController2.text = data['data'][0]['zipcode'].toString();
          }
          selectedPincode.value = data['data'][0]['zipcode'].toString();
          isPincodeEditable.value = false;
        } else {
          if (isStep1) {
            pinCodeController1.clear();
          } else {
            pinCodeController2.clear();
          }
          isPincodeEditable.value = true;
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

  void _filterItems(String input) {
    filteredSkills.value =
        allSkills
            .where(
              (item) =>
                  item.toLowerCase().contains(input.toLowerCase()) &&
                  !selectedSkills.contains(item),
            )
            .toList();
  }

  void addSkill(String item) {
    if (!selectedSkills.contains(item)) {
      selectedSkills.add(item);
      skillController.clear();
      filteredSkills.value = List.from(allSkills);
    }
  }

  void removeSkill(String item) {
    selectedSkills.remove(item);
  }

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
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

  void nextStep() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
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
    if (pinCodeController1.text.isNotEmpty && selectedPincode.value == null) {
      postPincode(pinCodeController1.text, selectedAreaId.value);
    }
    if (pinCodeController2.text.isNotEmpty && selectedPincode.value == null) {
      postPincode(pinCodeController2.text, selectedAreaId.value);
    }

    Get.to(() => AddPassordScreen());
  }

  @override
  void onClose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController1.dispose();
    areaController1.dispose();
    stateController1.dispose();
    pinCodeController1.dispose();
    cityController2.dispose();
    areaController2.dispose();
    stateController2.dispose();
    pinCodeController2.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyDescriptionController.dispose();
    skillController.dispose();

    // Dispose focus nodes
    stateFocus1.dispose();
    cityFocus1.dispose();
    areaFocus1.dispose();
    pincodeFocus1.dispose();
    stateFocus2.dispose();
    cityFocus2.dispose();
    areaFocus2.dispose();
    pincodeFocus2.dispose();

    pageController.dispose();
    _internetChecker.dispose();
    super.onClose();
  }
}
