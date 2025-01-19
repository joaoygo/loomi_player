import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class CustomButtonRoundedWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const CustomButtonRoundedWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.borderColor,
      this.textColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110,
          height: 42,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: borderColor ?? AppColors.primaryColorOpacity),
          ),
          child: Center(
              child: Text(text,
                  style: textStyle ??
                      TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor))),
        ));
  }
}
