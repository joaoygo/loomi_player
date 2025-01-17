import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/text_with_link.dart';
import '../stores/login_store.dart';
import 'package:get_it/get_it.dart';
import '../widgets/custom_google_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginStore _loginStore = GetIt.I<LoginStore>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Observer(
        builder: (_) {
          if (_loginStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderCredentials(
                        title: "Welcome back",
                        subtitle: "look who is here!",
                        logoPath: AssetsConstants.logoMini,
                        spaceBetweenLogo: 53,
                        spaceBetweenText: 11),
                    SizedBox(height: 46),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: emailController,
                          hintText: "Email",
                        )),
                    SizedBox(height: 18),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: PrimaryInputText(
                          controller: passwordController,
                          hintText: "Password",
                          isPassword: true,
                        )),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/forgot-password');
                            },
                            child: Text('Forgot Password? ',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    if (_loginStore.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _loginStore.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(
                        height: _loginStore.errorMessage != null ? 40 : 51),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PrimaryButton(
                        ontap: () async {
                          if (!_loginStore.isLoading) {
                            await _loginStore.loginWithEmailPassword(
                              emailController.text,
                              passwordController.text,
                            );
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (_loginStore.user != null) {
                                if (_loginStore.isProfileSetupRequired) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/register-profile',
                                    arguments: {'user': _loginStore.user},
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(context, '/');
                                }
                              }
                            });
                          }
                        },
                        text: "Login",
                        width: 207,
                      ),
                    ),
                    const SizedBox(height: 46),
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
                    const SizedBox(height: 28),
                    CustomGoogleButton(
                      onPressed: () async {
                        await _loginStore.loginWithGoogle();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_loginStore.user != null) {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextWithLink(
                      text: "Don't have an account? ",
                      linkText: "Sign Up!",
                      onTap: () => Navigator.pushNamed(context, '/register'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
