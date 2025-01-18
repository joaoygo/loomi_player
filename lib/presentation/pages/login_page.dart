import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_player/core/utils/validators.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/text_with_link.dart';
import '../stores/login_store.dart';
import 'package:get_it/get_it.dart';
import '../widgets/custom_google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final LoginStore _loginStore = GetIt.I<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Observer(
        builder: (_) {
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
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _loginStore.isLoading
                          ? const CircularProgressIndicator()
                          : PrimaryButton(
                              ontap: () async {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();

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

                                if (!_loginStore.isLoading) {
                                  await _loginStore.loginWithEmailPassword(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (_loginStore.user != null) {
                                      if (_loginStore.isProfileSetupRequired) {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/register-profile',
                                          arguments: {'user': _loginStore.user},
                                        );
                                      } else {
                                        Navigator.pushReplacementNamed(
                                            context, '/');
                                      }
                                    }
                                    if (_loginStore.user == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Incorrect credentials"),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 3),
                                      ));
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
                    _loginStore.isLoading
                        ? const CircularProgressIndicator()
                        : CustomGoogleButton(
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
