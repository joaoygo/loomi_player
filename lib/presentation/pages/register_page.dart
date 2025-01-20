import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/app_strings.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/core/utils/validators.dart';
import 'package:loomi_player/presentation/stores/register_store.dart';
import 'package:loomi_player/presentation/widgets/custom_google_button.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/text_with_link.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RegisterStore _registerStore = GetIt.I<RegisterStore>();

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
                    const SizedBox(height: 20),
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
                    CustomGoogleButton(onPressed: () async {
                      final registerSuccess =
                          await _registerStore.registerWithGoogle();

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (registerSuccess != null) {
                          Navigator.pushNamed(context, '/');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(_registerStore.errorMessage ??
                                  AppStrings.errorGeneric),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      });
                    }),
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
                            isPassword: true)),
                    const SizedBox(height: 23),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: confirmPasswordController,
                          hintText: "Password",
                          isPassword: true,
                        )),
                    const SizedBox(height: 23),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 23),
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
                                        content: Text("Passwords do not match"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3)),
                                  );
                                  return;
                                }

                                if (!isValidEmail(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Invalid email"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3)),
                                  );
                                  return;
                                }

                                if (!isValidPassword(password)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Password must be at least 6 characters"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3)),
                                  );
                                  return;
                                }

                                await _registerStore.register(email, password);

                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (_registerStore.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Error creating account"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Account created successfully"),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );

                                    Navigator.restorablePopAndPushNamed(
                                        context, '/login');
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
