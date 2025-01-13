import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/core/utils/validators.dart';
import 'package:loomi_player/presentation/pages/register_profile_page.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:loomi_player/presentation/widgets/custom_google_button.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/text_with_link.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RegisterStore _registerStore = GetIt.I<RegisterStore>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsConstants.logoWithText,
                    ),
                    SizedBox(height: 14),
                    TextWithLink(
                      text: "Already have an account? ",
                      linkText: "Sign In!",
                      onTap: () => Navigator.pushNamed(context, '/login'),
                    ),
                    const SizedBox(height: 52),
                    HeaderCredentials(
                      title: 'Create an account',
                      subtitle:
                          'To get started, please complete your account registration.',
                    ),
                    SizedBox(height: 20),
                    CustomGoogleButton(onPressed: () {}),
                    const SizedBox(height: 41),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or Sign in With',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 52),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: emailController,
                          hintText: "Email",
                        )),
                    const SizedBox(height: 23),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: passwordController,
                          hintText: "Password",
                        )),
                    const SizedBox(height: 23),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: confirmPasswordController,
                          hintText: "Password",
                        )),
                    const SizedBox(height: 23),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _registerStore.isLoading
                          ? const CircularProgressIndicator()
                          : PrimaryButton(
                              ontap: () async {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                final confirmPassword =
                                    confirmPasswordController.text.trim();

                                if (password != confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Passwords do not match")),
                                  );
                                  return;
                                }

                                if (!isValidEmail(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Invalid email")),
                                  );
                                  return;
                                }

                                if (!isValidPassword(password)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Password must be at least 6 characters")),
                                  );
                                  return;
                                }

                                await _registerStore.register(email, password);

                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (_registerStore.errorMessage != null) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Error"),
                                        content:
                                            Text(_registerStore.errorMessage!),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterProfilePage()),
                                      (route) => false,
                                    );
                                  }
                                });
                              },
                              text: "Create Account",
                              width: 207,
                            ),
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
