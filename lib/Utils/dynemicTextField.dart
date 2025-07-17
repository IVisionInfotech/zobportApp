import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';

class dynemicTextField extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? showPassword;
  final ValueNotifier<bool>? isVisible;
  final bool readOnly;
  final int maxLines;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final Color? cursorColor;
  final int? maxlenght;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const dynemicTextField({
    Key? key,
    required this.title,
    required this.label,
    required this.controller,
    this.validator,
    this.showPassword,
    this.isVisible,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.maxlenght,
    this.suffixIcon,
    this.onTap,
    this.inputFormatters,
    this.obscureText,
    this.cursorColor,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool enablePasswordToggle = showPassword == true && isVisible != null;

    return ValueListenableBuilder<bool>(
      valueListenable: isVisible ?? ValueNotifier(false),
      builder: (context, visible, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != "") Text(title, style: CustomTextStyle.normalBlue),
            if (title != "") const SizedBox(height: 10),
            TextFormField(
              controller: controller,
              validator: validator,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              focusNode: focusNode,
              maxLines: maxLines,
              keyboardType: keyboardType,
              maxLength: maxlenght,
              obscureText:
                  obscureText ?? (enablePasswordToggle ? !visible : false),
              cursorColor: AppColors.TxtblueColor,
              decoration: InputDecoration(
                hintText: label,
                hintStyle: CustomTextStyle.formHint,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.TxtblueColor,
                    width: 1.5,
                  ),
                ),
                prefixIcon: prefixIcon,
                suffixIcon:
                    enablePasswordToggle
                        ? IconButton(
                          icon: Icon(
                            visible ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.TxtWelColor,
                          ),
                          onPressed: () {
                            if (isVisible != null) {
                              isVisible!.value = !visible;
                            }
                          },
                        )
                        : suffixIcon,
              ),
            ),
          ],
        );
      },
    );
  }
}
