import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gotilo_job/View/Registration/RegistrationCompanyScreens/more_info_com_screen.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Services/app_connectivity.dart';
import 'package:gotilo_job/Utils/responsive.dart';
import 'package:gotilo_job/Utils/screen_config.dart';
import 'package:gotilo_job/controller/form_controller.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCompanyScreen extends StatefulWidget {
  const RegisterCompanyScreen({super.key});

  @override
  State<RegisterCompanyScreen> createState() => _RegisterCompanyScreenState();
}

class _RegisterCompanyScreenState extends State<RegisterCompanyScreen> {
  final FormController controller = FormController();
  final InternetChecker _internetChecker = InternetChecker();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _internetChecker.checkInternet();
  }

  @override
  void dispose() {
    _internetChecker.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await showModalBottomSheet<XFile?>(
        context: context,
        builder:
            (context) => SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a photo'),
                    onTap: () async {
                      final photo = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      Navigator.pop(context, photo);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from gallery'),
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
      // Handle any errors here if needed.
    } finally {}
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
          "Company Registration",
          style: TextStyle(
            fontFamily: TextFont.PoppinsMedium,
            fontSize: ScreenSizeConfig.fontSize + 3,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: AppDimensions.getScreenHeight(context) * 0.02),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      // child:
                      //     _imageFile == null
                      //         ? Image.asset(
                      //           Assets.registerComImg,
                      //           width:
                      //               AppDimensions.getScreenWidth(context) *
                      //               0.32,
                      //           height:
                      //               AppDimensions.getScreenWidth(context) *
                      //               0.32,
                      //           fit: BoxFit.cover,
                      //         )
                      //         : ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: Image.file(
                      //             _imageFile!,
                      //             width:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.32,
                      //             height:
                      //                 AppDimensions.getScreenWidth(context) *
                      //                 0.32,
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                    ),
                    SizedBox(
                      height: AppDimensions.getScreenHeight(context) * 0.06,
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company Name",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            'Abc company private LTD.',
                            controller.companyNameController,
                            controller.validateRequired,
                            TextInputType.text,
                          ),
                          commonSpace(10, 0),
                          Text(
                            "Company Contact No.",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            '+91 12345 12345',
                            controller.companyContactController,
                            controller.validatePhone,
                            TextInputType.number,
                          ),
                          commonSpace(10, 0),
                          Text(
                            "Company Email",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            'Acbd@domain.com',
                            controller.emailController,
                            controller.validateEmail,
                            TextInputType.emailAddress,
                          ),
                          commonSpace(10, 0),
                          Text(
                            "Contact Person Name",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            'Contact Person Name',
                            controller.contactPersonController,
                            controller.validateRequired,
                            TextInputType.name,
                          ),
                          commonSpace(10, 0),
                          Text(
                            "Contact Person Phone No.",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            'Contact Person Phone No.',
                            controller.contactPersonPhoneController,
                            controller.validatePhone,
                            TextInputType.number,
                          ),
                          commonSpace(10, 0),
                          Text(
                            "Company Address",
                            style: CustomTextStyle.normalBlue,
                          ),
                          buildTextField(
                            'Company Address',
                            controller.addressController,
                            controller.validateRequired,
                            TextInputType.text,
                          ),
                          commonSpace(10, 0),
                          Text("City", style: CustomTextStyle.normalBlue),
                          buildTextField(
                            'City',
                            controller.cityController,
                            controller.validateRequired,
                            TextInputType.text,
                          ),
                          commonSpace(10, 0),
                          Text("State", style: CustomTextStyle.normalBlue),
                          buildTextField(
                            'State',
                            controller.stateController,
                            controller.validateRequired,
                            TextInputType.text,
                          ),
                          commonSpace(10, 0),
                          Text("Pin Code", style: CustomTextStyle.normalBlue),
                          buildTextField(
                            'Pin Code',
                            controller.pinCodeController,
                            controller.validateRequired,
                            TextInputType.number,
                          ),
                          commonSpace(20, 0),
                          CommonWidget.cusComSequere(
                            () => _internetChecker.onTapWithInternetCheck(() {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoreInfoComScreen(),
                                ),
                              );
                            }),
                            "Next",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller,
    String? Function(String?) validator,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: CustomTextStyle.formHint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffD9D9D9), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.TxtOrangeColor, width: 1.5),
          ),
        ),
        style: CustomTextStyle.formHint,
      ),
    );
  }
}
