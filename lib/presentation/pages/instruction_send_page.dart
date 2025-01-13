import 'package:flutter/material.dart';
import 'package:loomi_player/presentation/widgets/header_credentials.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';

class InstructionSendPage extends StatelessWidget {
  const InstructionSendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF131418),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderCredentials(
                    title: "The instructions were sent!",
                    subtitle:
                        "If this was a valid email, instructions to reset your password will be sent to you. Please check your email.",
                    spaceBetweenLogo: 119,
                    spaceBetweenText: 20),
                SizedBox(height: 320),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: PrimaryButton(
                      text: "Login",
                      ontap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    )),
              ],
            ),
          ),
        )));
  }
}
