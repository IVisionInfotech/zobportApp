import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gotilo_job/Services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class SkilledRegistrationStepper extends StatefulWidget {
  const SkilledRegistrationStepper({super.key});

  @override
  State<SkilledRegistrationStepper> createState() =>
      _SkilledRegistrationStepperState();
}

class _SkilledRegistrationStepperState
    extends State<SkilledRegistrationStepper> {
  final InternetChecker _internetChecker = InternetChecker();
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  bool _isLoading = false;
  final PageController _pageController = PageController();

  // Personal Info Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final stateController = TextEditingController();
  final pinCodeController = TextEditingController();
  File? _imageFile;

  // Focus Nodes
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final areaFocus = FocusNode();
  final pincodeFocus = FocusNode();

  // Professional Info Controllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final companyDescriptionController = TextEditingController();
  final skillController = TextEditingController();
  final pinCodeSearchController = TextEditingController();
  bool isObscured = true;

  // Dropdown Values
  String? selectedCategory;
  String? selectedSubCategory;

  // API Data
  List<dynamic> states = [];
  List<dynamic> cities = [];
  List<dynamic> areas = [];
  List<dynamic> pincodes = [];
  int? selectedStateId;
  int? selectedCityId;
  int? selectedAreaId;
  String? selectedPincode;
  bool showStateList = false;
  bool showCityList = false;
  bool showAreaList = false;
  bool showPincodeList = false;
  bool isPincodeEditable = false;

  bool isCategoryLoading = false;
  bool isSubCategoryLoading = false;
  bool isSkillsLoading = false;

  // Lists
  List<dynamic> categoryList = [];
  List<dynamic> subCategoryList = [];
  List<String> skillsList = [];
  List<String> allSkills = [];
  List<String> selectedSkills = [];
  List<String> selectedPincodes = [];
  List<String> filteredSkills = [];
  List<String> filteredCategories = [];
  List<String> filteredSubCategories = [];

  int? selectedCategoryId;
  int? selectedSubCategoryId;

  List<Map<String, String>> educationList = [
    {"name": "SSC", "date": "12/04/2022"},
    {"name": "SSC", "date": "12/04/2022"},
  ];

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
    fetchStates();
    fetchJobCategories();

    stateFocus.addListener(() {
      if (!stateFocus.hasFocus) setState(() => showStateList = false);
    });
    cityFocus.addListener(() {
      if (!cityFocus.hasFocus) setState(() => showCityList = false);
    });
    areaFocus.addListener(() {
      if (!areaFocus.hasFocus) setState(() => showAreaList = false);
    });
    pincodeFocus.addListener(() {
      if (!pincodeFocus.hasFocus) setState(() => showPincodeList = false);
    });

    skillController.addListener(
      () => _filterItems(skillController.text, isSkill: true),
    );
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    _pageController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    areaController.dispose();
    stateController.dispose();
    pinCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    companyDescriptionController.dispose();
    skillController.dispose();
    pinCodeSearchController.dispose();
    stateFocus.dispose();
    cityFocus.dispose();
    areaFocus.dispose();
    pincodeFocus.dispose();
    super.dispose();
  }

  Future<void> fetchStates() async {
    try {
      final response = await http.get(Uri.parse(ApiService.getStateUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          states = data['data'] as List<dynamic>;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load states: ${e.toString()}')),
      );
    }
  }

  Future<void> fetchJobCategories() async {
    setState(() {
      isCategoryLoading = true;
    });
    try {
      final response = await http.get(Uri.parse(ApiService.jobCategoriesUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          setState(() {
            categoryList = data['data'] as List<dynamic>;
            filteredCategories =
                categoryList.map((e) => e['category_nm'].toString()).toList();
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load categories: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isCategoryLoading = false;
      });
    }
  }

  Future<void> fetchSubCategories(int categoryId) async {
    setState(() {
      isSubCategoryLoading = true;
      selectedSubCategory = null;
      selectedSubCategoryId = null;
    });

    try {
      final response = await http.get(
        Uri.parse(ApiService.getSubCategoriesUrl(categoryId)),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          setState(() {
            subCategoryList = data['data'] as List<dynamic>;
            filteredSubCategories =
                subCategoryList
                    .map((e) => e['sub_category_nm'].toString())
                    .toList();
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load sub-categories: ${e.toString()}'),
        ),
      );
    } finally {
      setState(() {
        isSubCategoryLoading = false;
      });
    }
  }

  Future<void> fetchSkills(int categoryId, int subCategoryId) async {
    setState(() {
      isSkillsLoading = true;
      selectedSkills.clear();
    });

    try {
      final response = await http.get(
        Uri.parse(ApiService.getSkillsUrl(categoryId, subCategoryId)),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          setState(() {
            skillsList = List<String>.from(data['data']);
            allSkills = skillsList;
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load skills: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isSkillsLoading = false;
      });
    }
  }

  Future<void> fetchCities(int stateId) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiService.getCityUrl}$stateId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          cities = data['data'] as List<dynamic>;
          cityController.clear();
          areaController.clear();
          pinCodeController.clear();
          selectedCityId = null;
          selectedAreaId = null;
          selectedPincode = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load cities: ${e.toString()}')),
      );
    }
  }

  Future<void> fetchAreas(int stateId, int cityId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ApiService.baseUrl}area-list?state_id=$stateId&city_id=$cityId',
        ),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          areas = data['data'] as List<dynamic>;
          areaController.clear();
          pinCodeController.clear();
          selectedAreaId = null;
          selectedPincode = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load areas: ${e.toString()}')),
      );
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
          setState(() {
            pinCodeController.text = data['data'][0]['zipcode'].toString();
            selectedPincode = data['data'][0]['zipcode'].toString();
            isPincodeEditable = false;
          });
        } else {
          setState(() {
            pinCodeController.clear();
            isPincodeEditable = true;
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load pincode: ${e.toString()}')),
      );
    }
  }

  Future<void> postPincode(String pincode) async {
    try {
      final response = await http.post(
        Uri.parse(ApiService.postPincodeUrl),
        body: {'zipcode': pincode, 'area_id': selectedAreaId?.toString() ?? ''},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Pincode added successfully')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Failed to add pincode')),
          );
        }
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add pincode')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding pincode: ${e.toString()}')),
      );
    }
  }

  void _filterItems(String input, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        filteredSkills =
            allSkills
                .where(
                  (item) =>
                      item.toLowerCase().contains(input.toLowerCase()) &&
                      !selectedSkills.contains(item),
                )
                .toList();
      }
    });
  }

  void _addItem(String item, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        selectedSkills.add(item);
        skillController.clear();
        filteredSkills.clear();
      }
    });
  }

  void _removeItem(String item, {required bool isSkill}) {
    setState(() {
      if (isSkill) {
        selectedSkills.remove(item);
      }
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  Widget autocompleteField({
    required String label,
    required TextEditingController ctrl,
    required FocusNode focus,
    required bool visible,
    required List<dynamic> items,
    required String displayKey,
    required String idKey,
    required void Function(dynamic) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dynemicTextField(
          title: label,
          label: label,
          controller: ctrl,
          onChanged: (value) {
            if (label == 'State') {
              setState(() {
                showStateList = true;
              });
            } else if (label == 'City') {
              setState(() {
                showCityList = true;
              });
            } else if (label == 'Area') {
              setState(() {
                showAreaList = true;
              });
            }
          },
          onTap: () {
            setState(() {
              if (label == 'State') {
                showStateList = true;
              } else if (label == 'City' && cities.isNotEmpty) {
                showCityList = true;
              } else if (label == 'Area' && areas.isNotEmpty) {
                showAreaList = true;
              }
            });
          },
          validator: (v) => v == null || v.isEmpty ? 'Select $label' : null,
        ),
        const SizedBox(height: 6),
        if (visible)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = items[index];
                final displayText = item[displayKey].toString();
                if (ctrl.text.isEmpty ||
                    displayText.toLowerCase().contains(
                      ctrl.text.toLowerCase(),
                    )) {
                  return GestureDetector(
                    onTap: () {
                      onSelect(item);
                      focus.unfocus();
                      setState(() {
                        if (label == 'State') {
                          showStateList = false;
                        } else if (label == 'City') {
                          showCityList = false;
                        } else if (label == 'Area') {
                          showAreaList = false;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text(
                        displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
      ],
    );
  }

  Widget categoryDropdownField({
    required String label,
    required TextEditingController ctrl,
    required FocusNode focus,
    required bool visible,
    required List<String> items,
    required void Function(String) onSelect,
    bool isSubCategory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dynemicTextField(
          title: label,
          label: label,
          controller: ctrl,
          onChanged: (value) {
            setState(() {
              if (isSubCategory) {
                filteredSubCategories =
                    subCategoryList
                        .where(
                          (item) => item['sub_category_nm']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()),
                        )
                        .map((e) => e['sub_category_nm'].toString())
                        .toList();
              } else {
                filteredCategories =
                    categoryList
                        .where(
                          (item) => item['category_nm']
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()),
                        )
                        .map((e) => e['category_nm'].toString())
                        .toList();
              }
            });
          },
          onTap: () {
            setState(() {
              if (isSubCategory) {
                filteredSubCategories =
                    subCategoryList
                        .map((e) => e['sub_category_nm'].toString())
                        .toList();
              } else {
                filteredCategories =
                    categoryList
                        .map((e) => e['category_nm'].toString())
                        .toList();
              }
            });
          },
          validator: (v) => v == null || v.isEmpty ? 'Select $label' : null,
        ),
        const SizedBox(height: 6),
        if (visible &&
            ((isSubCategory && filteredSubCategories.isNotEmpty) ||
                (!isSubCategory && filteredCategories.isNotEmpty)))
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount:
                  isSubCategory
                      ? filteredSubCategories.length
                      : filteredCategories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item =
                    isSubCategory
                        ? filteredSubCategories[index]
                        : filteredCategories[index];
                return GestureDetector(
                  onTap: () {
                    onSelect(item);
                    focus.unfocus();
                    setState(() {
                      ctrl.text = item;
                      if (isSubCategory) {
                        final selected = subCategoryList.firstWhere(
                          (subCat) => subCat['sub_category_nm'] == item,
                          orElse: () => {},
                        );
                        if (selected.isNotEmpty) {
                          selectedSubCategory = item;
                          selectedSubCategoryId =
                              selected['sub_category_id'] as int?;
                          if (selectedCategoryId != null &&
                              selectedSubCategoryId != null) {
                            fetchSkills(
                              selectedCategoryId!,
                              selectedSubCategoryId!,
                            );
                          }
                        }
                      } else {
                        final selected = categoryList.firstWhere(
                          (cat) => cat['category_nm'] == item,
                          orElse: () => {},
                        );
                        if (selected.isNotEmpty) {
                          selectedCategory = item;
                          selectedCategoryId = selected['category_id'] as int?;
                          if (selectedCategoryId != null) {
                            fetchSubCategories(selectedCategoryId!);
                          }
                        }
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await showModalBottomSheet<XFile?>(
        context: context,
        builder:
            (context) => SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take a photo'),
                    onTap: () async {
                      final photo = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      Navigator.pop(context, photo);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Choose from gallery'),
                    onTap: () async {
                      final gallery = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      Navigator.pop(context, gallery);
                    },
                  ),
                ],
              ),
            ),
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking image: ${e.toString()}")),
      );
    }
  }

  Future<void> _selectDate(int index) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        educationList[index]["date"] =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _addEducation() {
    setState(() {
      educationList.add({"name": "Enter Degree", "date": "Select Date"});
    });
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    if (pinCodeController.text.isNotEmpty && selectedPincode == null) {
      postPincode(pinCodeController.text);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => VerifyOtpScreen()),
    );
  }

  Widget _buildHorizontalStepper() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSizeConfig.padding,
        vertical: ScreenSizeConfig.spacing,
      ),
      child: Row(
        children: [
          // Step 1
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentStep >= 0
                            ? AppColors.TxtblueColor
                            : Colors.grey[300],
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: _currentStep >= 0 ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: ScreenSizeConfig.fontSize * 0.8,
                    color:
                        _currentStep >= 0
                            ? AppColors.TxtblueColor
                            : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color:
                  _currentStep >= 1 ? AppColors.TxtblueColor : Colors.grey[300],
            ),
          ),
          // Step 2
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentStep >= 1
                            ? AppColors.TxtblueColor
                            : Colors.grey[300],
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: _currentStep >= 1 ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: ScreenSizeConfig.fontSize * 0.8,
                    color:
                        _currentStep >= 1
                            ? AppColors.TxtblueColor
                            : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
          GestureDetector(
            onTap: _pickImage,
            child: Stack(
              children: [
                ClipOval(
                  child:
                      _imageFile == null
                          ? Image.asset(
                            "assets/images/user.jpg",
                            width: AppDimensions.getScreenWidth(context) * 0.32,
                            height:
                                AppDimensions.getScreenWidth(context) * 0.32,
                            fit: BoxFit.cover,
                          )
                          : Image.file(
                            _imageFile!,
                            width: AppDimensions.getScreenWidth(context) * 0.32,
                            height:
                                AppDimensions.getScreenWidth(context) * 0.32,
                            fit: BoxFit.cover,
                          ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: AppDimensions.getScreenWidth(context) * 0.098,
                    height: AppDimensions.getScreenWidth(context) * 0.098,
                    decoration: BoxDecoration(
                      color: AppColors.TxtblueColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: dynemicTextField(
                        title: "First Name",
                        label: "First name",
                        controller: firstNameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.getScreenWidth(context) * 0.05,
                    ),
                    Expanded(
                      child: dynemicTextField(
                        title: "Last Name",
                        label: "Last name",
                        controller: lastNameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Contact No.",
                  label: "Enter your contact number",
                  controller: contactController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Contact number is required';
                    }
                    if (value.length < 10 || value.length > 15) {
                      return 'Contact number must be between 10 and 15 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Email",
                  label: "Enter your email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Address",
                  label: "Enter your address",
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                autocompleteField(
                  label: "State",
                  ctrl: stateController,
                  focus: stateFocus,
                  visible: showStateList,
                  items: states,
                  displayKey: 'state_name',
                  idKey: 'state_id',
                  onSelect:
                      (e) => setState(() {
                        stateController.text = e['state_name'].toString();
                        selectedStateId = int.parse(e['state_id'].toString());
                        showStateList = false;
                        fetchCities(selectedStateId!);
                      }),
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                autocompleteField(
                  label: "City",
                  ctrl: cityController,
                  focus: cityFocus,
                  visible: showCityList,
                  items: cities,
                  displayKey: 'city_nm',
                  idKey: 'city_id',
                  onSelect:
                      (e) => setState(() {
                        cityController.text = e['city_nm'].toString();
                        selectedCityId = int.parse(e['city_id'].toString());
                        showCityList = false;
                        fetchAreas(selectedStateId!, selectedCityId!);
                      }),
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                autocompleteField(
                  label: "Area",
                  ctrl: areaController,
                  focus: areaFocus,
                  visible: showAreaList,
                  items: areas,
                  displayKey: 'area_nm',
                  idKey: 'area_id',
                  onSelect:
                      (e) => setState(() {
                        areaController.text = e['area_nm'].toString();
                        selectedAreaId = int.parse(e['area_id'].toString());
                        showAreaList = false;
                        fetchPincodeByArea(selectedAreaId!);
                      }),
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
                dynemicTextField(
                  title: "Pincode",
                  label: "Pincode",
                  controller: pinCodeController,
                  readOnly:
                      pinCodeController.text.isNotEmpty &&
                      selectedPincode != null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pincode is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalInfoStep() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category", style: CustomTextStyle.normalBlue),
            SizedBox(height: 10),
            isCategoryLoading
                ? Center(child: CircularProgressIndicator())
                : categoryDropdownField(
                  label: "Category",
                  ctrl: TextEditingController(text: selectedCategory),
                  focus: FocusNode(),
                  visible: selectedCategory == null || showStateList,
                  items: filteredCategories,
                  onSelect: (value) {
                    setState(() {
                      selectedCategory = value;
                      final selected = categoryList.firstWhere(
                        (cat) => cat['category_nm'] == value,
                        orElse: () => {},
                      );
                      if (selected.isNotEmpty) {
                        selectedCategoryId = selected['category_id'] as int?;
                        if (selectedCategoryId != null) {
                          fetchSubCategories(selectedCategoryId!);
                        }
                      }
                    });
                  },
                ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Text("Sub Category", style: CustomTextStyle.normalBlue),
            SizedBox(height: 10),
            isSubCategoryLoading
                ? Center(child: CircularProgressIndicator())
                : categoryDropdownField(
                  label: "Sub Category",
                  ctrl: TextEditingController(text: selectedSubCategory),
                  focus: FocusNode(),
                  visible: selectedSubCategory == null || showStateList,
                  items: filteredSubCategories,
                  onSelect: (value) {
                    setState(() {
                      selectedSubCategory = value;
                      final selected = subCategoryList.firstWhere(
                        (subCat) => subCat['sub_category_nm'] == value,
                        orElse: () => {},
                      );
                      if (selected.isNotEmpty) {
                        selectedSubCategoryId =
                            selected['sub_category_id'] as int?;
                        if (selectedCategoryId != null &&
                            selectedSubCategoryId != null) {
                          fetchSkills(
                            selectedCategoryId!,
                            selectedSubCategoryId!,
                          );
                        }
                      }
                    });
                  },
                  isSubCategory: true,
                ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            Text("Select Skills", style: CustomTextStyle.normalBlue),
            SizedBox(height: 10),
            isSkillsLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    TextField(
                      controller: skillController,
                      cursorColor: AppColors.TxtblueColor,
                      decoration: InputDecoration(
                        hintText: "Search & Add Skills",
                        hintStyle: CustomTextStyle.formHint,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xffD9D9D9),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppColors.TxtOrangeColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (selectedSkills.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        children:
                            selectedSkills.map((skill) {
                              return Chip(
                                label: Text(
                                  '"$skill"',
                                  style: TextStyle(
                                    fontSize: ScreenSizeConfig.fontSize,
                                  ),
                                ),
                                deleteIcon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onDeleted:
                                    () => _removeItem(skill, isSkill: true),
                                backgroundColor: Colors.grey[800],
                                labelStyle: TextStyle(color: Colors.white),
                              );
                            }).toList(),
                      ),
                    if (filteredSkills.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 5),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredSkills.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                filteredSkills[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap:
                                  () => _addItem(
                                    filteredSkills[index],
                                    isSkill: true,
                                  ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            dynemicTextField(
              title: "Company Description",
              label: "Enter company description",
              controller: companyDescriptionController,
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Company description is required';
                }
                return null;
              },
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            autocompleteField(
              label: "State",
              ctrl: stateController,
              focus: stateFocus,
              visible: showStateList,
              items: states,
              displayKey: 'state_name',
              idKey: 'state_id',
              onSelect:
                  (e) => setState(() {
                    stateController.text = e['state_name'].toString();
                    selectedStateId = int.parse(e['state_id'].toString());
                    showStateList = false;
                    fetchCities(selectedStateId!);
                  }),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            autocompleteField(
              label: "City",
              ctrl: cityController,
              focus: cityFocus,
              visible: showCityList,
              items: cities,
              displayKey: 'city_nm',
              idKey: 'city_id',
              onSelect:
                  (e) => setState(() {
                    cityController.text = e['city_nm'].toString();
                    selectedCityId = int.parse(e['city_id'].toString());
                    showCityList = false;
                    fetchAreas(selectedStateId!, selectedCityId!);
                  }),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            autocompleteField(
              label: "Area",
              ctrl: areaController,
              focus: areaFocus,
              visible: showAreaList,
              items: areas,
              displayKey: 'area_nm',
              idKey: 'area_id',
              onSelect:
                  (e) => setState(() {
                    areaController.text = e['area_nm'].toString();
                    selectedAreaId = int.parse(e['area_id'].toString());
                    showAreaList = false;
                    fetchPincodeByArea(selectedAreaId!);
                  }),
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
            dynemicTextField(
              title: "Pincode",
              label: "Pincode",
              controller: pinCodeController,
              readOnly:
                  pinCodeController.text.isNotEmpty && selectedPincode != null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pincode is required';
                }
                return null;
              },
            ),
            SizedBox(height: AppDimensions.getScreenHeight(context) * 0.04),
          ],
        ),
      ),
    );
  }

  void _nextStep() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    if (_currentStep < 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _submitForm();
    }
  }

  void _previousStep() {
    setState(() {
      _currentStep--;
    });
    _pageController.animateToPage(
      _currentStep,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        title: Text(
          "Skilled Registration",
          style: TextStyle(
            fontSize: ScreenSizeConfig.titleFontSize,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            _buildHorizontalStepper(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildPersonalInfoStep(),
                  _buildProfessionalInfoStep(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSizeConfig.padding,
                vertical: ScreenSizeConfig.spacing,
              ),
              child: Row(
                children: [
                  if (_currentStep != 0) ...[
                    Expanded(
                      child: InkWell(
                        onTap: _previousStep,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: ScreenSizeConfig.buttonHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.TxtOrangeColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: AppColors.TxtOrangeColor,
                              fontSize: ScreenSizeConfig.fontSize,
                              fontFamily: TextFont.PoppinsMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenSizeConfig.spacing),
                  ],
                  Expanded(
                    child: InkWell(
                      onTap: _nextStep,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: ScreenSizeConfig.buttonHeight,
                        decoration: BoxDecoration(
                          color: AppColors.TxtOrangeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenSizeConfig.fontSize,
                            fontFamily: TextFont.PoppinsMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
