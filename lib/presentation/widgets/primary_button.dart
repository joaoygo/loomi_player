import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() ontap;
  final String text;
  final double? width;
  final double? fontText;

  const PrimaryButton({
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
          color: AppColors.primaryColorOpacity,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(241, 205, 76, 0.1),
              spreadRadius: 5,
              blurRadius: 6,
              offset: const Offset(2, 0),
            ),
          ],
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
