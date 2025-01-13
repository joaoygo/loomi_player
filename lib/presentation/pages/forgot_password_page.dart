import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/presentation/stores/forgot_password_store.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:loomi_player/presentation/widgets/primary_input_text.dart';
import 'package:loomi_player/presentation/widgets/secondary_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final ForgotPasswordStore _forgotPasswordStore =
      GetIt.I<ForgotPasswordStore>();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF131418),
        body: Observer(builder: (_) {
          if (_forgotPasswordStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  HeaderCredentials(
                      title: "Forgot Password?",
                      subtitle:
                          "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                      spaceBetweenLogo: 69,
                      spaceBetweenText: 11),
                  SizedBox(height: 94),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PrimaryInputText(
                        controller: emailController,
                        hintText: "Email",
                      )),
                  SizedBox(height: 186),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PrimaryButton(
                          text: "Send",
                          ontap: () async {
                            await _forgotPasswordStore.sendPasswordResetEmail(
                                emailController.text.trim());

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (_forgotPasswordStore.errorMessage == null) {
                                Navigator.pushNamed(
                                    context, '/instruction-send');
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Error"),
                                    content: Text(
                                        _forgotPasswordStore.errorMessage!),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            });
                          })),
                  SizedBox(height: 11),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SecondaryButton(text: "Back", ontap: () {}))
                ]))),
          );
        }));
  }
}
