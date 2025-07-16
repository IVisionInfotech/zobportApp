import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gotilo_job/Services/shared_pref_service.dart';
import 'package:http/http.dart' as http;
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/View/Registration/verify_otp_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/dynemicTextField.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/Services/api_service.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class NonSkilledRegScreen extends StatefulWidget {
  const NonSkilledRegScreen({Key? key}) : super(key: key);

  @override
  State<NonSkilledRegScreen> createState() => _NonSkilledRegScreenState();
}

class _NonSkilledRegScreenState extends State<NonSkilledRegScreen> {
  final _internetChecker = InternetChecker();
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final pincodeFocus = FocusNode();

  List<dynamic> states = [];
  List<dynamic> cities = [];
  List<dynamic> pincodes = [];

  int? selectedStateId;
  int? selectedCityId;
  String? selectedPincode;

  bool showStateList = false;
  bool showCityList = false;
  bool showPincodeList = false;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
    fetchStates();
    stateFocus.addListener(() {
      if (!stateFocus.hasFocus) setState(() => showStateList = false);
    });
    cityFocus.addListener(() {
      if (!cityFocus.hasFocus) setState(() => showCityList = false);
    });
    pincodeFocus.addListener(() {
      if (!pincodeFocus.hasFocus) setState(() => showPincodeList = false);
    });
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    stateController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    stateFocus.dispose();
    cityFocus.dispose();
    pincodeFocus.dispose();
    super.dispose();
  }

  Future<void> fetchStates() async {
    final resp = await http.get(Uri.parse(ApiService.getStateUrl));
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body)['data'] as List<dynamic>;
      setState(() => states = data);
    }
  }

  Future<void> fetchCities(int stateId) async {
    final resp = await http.get(Uri.parse("${ApiService.getCityUrl}$stateId"));
    if (resp.statusCode == 200) {
      cities = jsonDecode(resp.body)['data'] as List<dynamic>;
      cityController.clear();
      pincodeController.clear();
      selectedCityId = null;
      selectedPincode = null;
      setState(() {
        showCityList = true;
      });
      FocusScope.of(context).requestFocus(cityFocus);
    }
  }

  Future<void> fetchPincodes(int cityId) async {
    final resp = await http.get(
      Uri.parse("${ApiService.getpincodeUrl}$cityId"),
    );
    if (resp.statusCode == 200) {
      pincodes = jsonDecode(resp.body)['data'] as List<dynamic>;
      pincodeController.clear();
      selectedPincode = null;
      setState(() {
        showPincodeList = true;
      });
      FocusScope.of(context).requestFocus(pincodeFocus);
    }
  }

  Future<void> signup() async {
    if (_isSubmitting) return;
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final payload = {
      "name":
          "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
      "contact_no": contactController.text.trim(),
      "email": emailController.text.trim(),
      "city_id": selectedCityId?.toString() ?? '',
      "state_id": selectedStateId?.toString() ?? '',
      "password": passwordController.text.trim(),
      "state_name": stateController.text.trim(),
      "city_name": cityController.text.trim(),
      "zipcode": selectedPincode ?? '',
      "preference_type": "2",
      "address": addressController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse("https://projectiv.in/zobpot/public/api/register"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: payload,
      );

      log("Signup raw response: ${response.body}");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        log("Signup parsed response: $responseBody");

        if (responseBody['status'] == true) {
          final userId = responseBody['user_id'];
          await SharedPrefService.saveUserId(userId);

          AnimatedSnackBar.material(
            responseBody['message'] ?? "Registered successfully",
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 3),
            desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
          ).show(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const VerifyOtpScreen()),
          );
        } else {
          AnimatedSnackBar.material(
            responseBody['message'] ?? "Registration failed",
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 3),
            desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
          ).show(context);
        }
      } else {
        log(
          "Signup failed: Status ${response.statusCode} Body: ${response.body}",
        );
        AnimatedSnackBar.material(
          "Server error: ${response.statusCode}",
          type: AnimatedSnackBarType.error,
          duration: const Duration(seconds: 3),
          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
        ).show(context);
      }
    } catch (e) {
      log("Signup Error: $e");
      AnimatedSnackBar.material(
        "Something went wrong: $e",
        type: AnimatedSnackBarType.error,
        duration: const Duration(seconds: 3),
        desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      ).show(context);
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  // Modified autocompleteField to filter list based on input and auto-add new items
  Widget autocompleteField({
    required String label,
    required TextEditingController ctrl,
    required FocusNode focus,
    required bool visible,
    required List<dynamic> items,
    required String displayKey,
    required void Function(dynamic) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dynemicTextField(
          title: label,
          label: label,
          controller: ctrl,
          readOnly: false,
          onTap: () {
            setState(() {
              if (label == 'State')
                showStateList = true;
              else if (label == 'City' && cities.isNotEmpty)
                showCityList = true;
              else if (label == 'Pincode' && pincodes.isNotEmpty)
                showPincodeList = true;
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
              itemCount:
                  items
                      .where(
                        (e) => e[displayKey].toLowerCase().contains(
                          ctrl.text.toLowerCase(),
                        ),
                      )
                      .toList()
                      .length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item =
                    items
                        .where(
                          (e) => e[displayKey].toLowerCase().contains(
                            ctrl.text.toLowerCase(),
                          ),
                        )
                        .toList()[index];
                return GestureDetector(
                  onTap: () {
                    onSelect(item);
                    focus.unfocus();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      item[displayKey],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
        // Add the new entry if not found
        if (ctrl.text.isNotEmpty &&
            !items.any(
              (e) => e[displayKey].toLowerCase() == ctrl.text.toLowerCase(),
            ))
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                final newItem = {displayKey: ctrl.text};
                setState(() {
                  items.add(newItem);
                  showStateList = false;
                  // Update the state, city, or pincode
                  if (label == 'State') {
                    fetchCities(selectedStateId!); // Refresh cities
                  }
                  if (label == 'City') {
                    fetchPincodes(selectedCityId!); // Refresh pincodes
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Add New",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
      ],
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
          "Non Skilled Registration",
          style: TextStyle(
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: dynemicTextField(
                      title: "First Name",
                      label: "First Name",
                      controller: firstNameController,
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: dynemicTextField(
                      title: "Last Name",
                      label: "Last Name",
                      controller: lastNameController,
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              dynemicTextField(
                title: "Contact",
                label: "Contact",
                keyboardType: TextInputType.phone,
                controller: contactController,
                //  maxlenght: 10,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Contact number is required';
                  } else if (v.length != 10) {
                    return 'Contact number must be 10 digits';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                    return 'Only numbers are allowed';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              dynemicTextField(
                title: "Email",
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),
              dynemicTextField(
                title: "Address",
                label: "Address",
                controller: addressController,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 24),

              autocompleteField(
                label: "State",
                ctrl: stateController,
                focus: stateFocus,
                visible: showStateList,
                items: states,
                displayKey: 'state_name',
                onSelect:
                    (e) => setState(() {
                      stateController.text = e['state_name'];
                      selectedStateId = e['state_id'];
                      showStateList = false;
                      fetchCities(selectedStateId!);
                    }),
              ),
              SizedBox(height: 16),

              autocompleteField(
                label: "City",
                ctrl: cityController,
                focus: cityFocus,
                visible: showCityList,
                items: cities,
                displayKey: 'city_nm',
                onSelect:
                    (e) => setState(() {
                      cityController.text = e['city_nm'];
                      selectedCityId = e['city_id'];
                      showCityList = false;
                      fetchPincodes(selectedCityId!);
                    }),
              ),
              SizedBox(height: 16),

              autocompleteField(
                label: "Pincode",
                ctrl: pincodeController,
                focus: pincodeFocus,
                visible: showPincodeList,
                items: pincodes,
                displayKey: 'zipcode',
                onSelect:
                    (e) => setState(() {
                      pincodeController.text = e['zipcode'];
                      selectedPincode = e['zipcode'];
                      showPincodeList = false;
                    }),
              ),
              SizedBox(height: 24),

              dynemicTextField(
                title: "Password",
                label: "Password",
                controller: passwordController,
                isVisible: ValueNotifier(true),
                showPassword: true,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),
              dynemicTextField(
                title: "Confirm Password",
                label: "Confirm Password",
                controller: confirmPasswordController,
                isVisible: ValueNotifier(true),
                showPassword: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Required';
                  if (v != passwordController.text)
                    return 'Passwords do not match';
                  return null;
                },
              ),
              SizedBox(height: 32),
              InkWell(
                onTap:
                    _isSubmitting
                        ? null
                        : () {
                          if (_formKey.currentState!.validate()) {
                            signup();
                          }
                        },
                child: Container(
                  height: ScreenSizeConfig.buttonHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        _isSubmitting ? Colors.grey : AppColors.TxtOrangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child:
                        _isSubmitting
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenSizeConfig.fontSize,
                              ),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
