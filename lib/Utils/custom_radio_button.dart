import 'package:flutter/material.dart';
import 'package:gotilo_job/Utils/App_Colors.dart';
import 'package:gotilo_job/Utils/screen_config.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool isBlueBorder;
  final int value;
  final int groupValue;
  final Function(int) onChanged;

  const CustomRadioButton({
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
    required this.isBlueBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: isBlueBorder ? 8 : 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: Color(0xffD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom Circular Radio
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? isBlueBorder
                              ? Color(0xff242A62)
                              : Color(0xff878787)
                          : Color(0xffD9D9D9),
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isBlueBorder
                                    ? Color(0xff242A62)
                                    : Color(0xff878787),
                          ),
                        ),
                      )
                      : SizedBox(),
            ),
            commonSpace(0, 8), // Spacing between radio and text
            Text(
              text,
              style: TextStyle(
                fontSize: ScreenSizeConfig.fontSize,
                color: isBlueBorder ? Color(0xff242A62) : Color(0xff454545),
                fontFamily: TextFont.PoppinsMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
