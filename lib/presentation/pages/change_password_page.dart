import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/utils/validators.dart';
import 'package:loomi_player/presentation/stores/change_password_store.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ChangePasswordStore _changePasswordStore =
      GetIt.I<ChangePasswordStore>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Observer(builder: (_) {
        return SafeArea(
            child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              SizedBox(height: 72),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PrimaryInputText(
                    controller: currentPasswordController,
                    hintText: 'Current password',
                    isPassword: true),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Divider(
                  color: AppColors.borderDivider,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PrimaryInputText(
                    controller: newPasswordController,
                    hintText: 'New password',
                    isPassword: true),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PrimaryInputText(
                    controller: confirmPasswordController,
                    hintText: 'Confirm new password',
                    isPassword: true),
              ),
              SizedBox(height: 160),
              _changePasswordStore.isLoading
                  ? CircularProgressIndicator()
                  : PrimaryButton(
                      ontap: () async {
                        final currentPassword =
                            currentPasswordController.text.trim();
                        final newPassword = newPasswordController.text.trim();
                        final confirmPassword =
                            confirmPasswordController.text.trim();

                        if (!isValidPassword(currentPassword)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Password must be at least 6 characters"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3)),
                          );
                          return;
                        }
                        if (!isValidPassword(newPassword)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Password must be at least 6 characters"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3)),
                          );
                          return;
                        }
                        if (!isValidPassword(confirmPassword)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Password must be at least 6 characters"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3)),
                          );
                          return;
                        }

                        if (newPassword != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Passwords do not match"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3)),
                          );
                          return;
                        }

                        final result =
                            await _changePasswordStore.changePassword(
                          currentPassword,
                          newPassword,
                        );

                        if (result && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Password updated"),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );

                          await Future.delayed(const Duration(seconds: 2));
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Error updating password"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                      text: 'Update Password',
                      width: 207,
                    ),
              SizedBox(height: 20),
            ],
          )),
        ));
      }),
    );
  }
}
