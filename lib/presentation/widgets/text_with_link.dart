import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class TextWithLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const TextWithLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: const TextStyle(
                color: AppColors.primaryColorTextOpacity,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat')),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkText,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontFamily: 'Fieldwork',
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
