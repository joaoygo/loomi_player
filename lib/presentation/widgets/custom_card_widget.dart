import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  const CustomCardWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundCardColor,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400))
            ]),
            Icon(Icons.arrow_forward_ios, color: Colors.white)
          ],
        )));
  }
}
