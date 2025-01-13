import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';

class PrimaryInputText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const PrimaryInputText({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<PrimaryInputText> createState() => _PrimaryInputTextState();
}

class _PrimaryInputTextState extends State<PrimaryInputText> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        border: Border.all(color: AppColors.borderInput),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: -2,
            blurRadius: 6,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            cursorColor: AppColors.primaryColorText,
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            style: const TextStyle(color: AppColors.primaryColorText),
            decoration: InputDecoration(
              hintStyle:
                  const TextStyle(color: AppColors.primaryColorTextOpacity),
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.primaryColorTextOpacity,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
