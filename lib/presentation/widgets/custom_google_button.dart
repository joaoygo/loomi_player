import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';

class CustomGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomGoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primaryColorOpacity,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: SvgPicture.asset(AssetsConstants.googleIcon),
        ));
  }
}
