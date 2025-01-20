import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() ontap;
  final String text;
  final double? width;
  final double? fontText;

  const SecondaryButton({
    super.key,
    required this.ontap,
    required this.text,
    this.width,
    this.fontText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      //signIn,
      child: Container(
        padding: EdgeInsets.all(13),
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fontText ?? 20),
        )),
      ),
    );
  }
}
