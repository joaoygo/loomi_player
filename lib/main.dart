import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loomi_player/core/di/di.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/presentation/pages/forgot_password_page.dart';
import 'package:loomi_player/presentation/pages/home_page.dart';
import 'package:loomi_player/presentation/pages/instruction_send_page.dart';
import 'package:loomi_player/presentation/pages/login_page.dart';
import 'package:loomi_player/presentation/pages/profile_page.dart';
import 'package:loomi_player/presentation/pages/register_page.dart';
import 'package:loomi_player/presentation/pages/register_profile_page.dart';
import 'package:loomi_player/presentation/pages/view_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loomi Player',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/register-profile': (context) => RegisterProfilePage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/instruction-send': (context) => InstructionSendPage(),
        '/video-detail': (context) {
          final VideoEntity video =
              ModalRoute.of(context)!.settings.arguments as VideoEntity;
          return VideoDetailPage(video: video);
        },
        '/profile': (context) => ProfilePage(),
        '/': (context) => HomePage(),
      },
    );
  }
}
