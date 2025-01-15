import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 131, 173),
      body: Observer(builder: (_) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              children: [],
            )),
          ),
        );
      }),
    );
  }
}
