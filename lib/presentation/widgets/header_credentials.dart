import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class HeaderCredentials extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? spaceBetweenText;
  final double? spaceBetweenLogo;
  final String? logoPath;

  const HeaderCredentials({
    super.key,
    required this.title,
    this.subtitle,
    this.spaceBetweenText,
    this.spaceBetweenLogo,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logoPath != null) ...[
            SvgPicture.asset(logoPath!),
            SizedBox(height: spaceBetweenLogo ?? 25),
          ],
          Text(title,
              style: const TextStyle(
                  color: AppColors.primaryColorText,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Epilogue')),
          if (subtitle != null) ...[
            SizedBox(height: spaceBetweenText ?? 10),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primaryColorTextOpacity,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
