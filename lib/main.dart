import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loomi_player/core/di/di.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/presentation/pages/change_password_page.dart';
import 'package:loomi_player/presentation/pages/edit_profile_page.dart';
import 'package:loomi_player/presentation/pages/forgot_password_page.dart';
import 'package:loomi_player/presentation/pages/home_page.dart';
import 'package:loomi_player/presentation/pages/instruction_send_page.dart';
import 'package:loomi_player/presentation/pages/login_page.dart';
import 'package:loomi_player/presentation/pages/profile_page.dart';
import 'package:loomi_player/presentation/pages/register_page.dart';
import 'package:loomi_player/presentation/pages/register_profile_page.dart';
import 'package:loomi_player/presentation/pages/splash_screen_page.dart';
import 'package:loomi_player/presentation/pages/video_detail_page.dart';

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
      initialRoute: '/splash',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return _buildPageRoute(SplashScreenPage(), settings, Offset(0, 1));
      case '/login':
        return _buildPageRoute(LoginPage(), settings, Offset(-1, 0));
      case '/register':
        return _buildPageRoute(RegisterPage(), settings, Offset(1, 0));
      case '/register-profile':
        return _buildPageRoute(RegisterProfilePage(), settings, Offset(0, 1));
      case '/forgot-password':
        return _buildPageRoute(ForgotPasswordPage(), settings, Offset(1, -1));
      case '/instruction-send':
        return _buildPageRoute(InstructionSendPage(), settings, Offset(0, -1));
      case '/video-detail':
        final video = settings.arguments as VideoEntity;
        return _buildPageRoute(
            VideoDetailPage(video: video), settings, Offset(-1, 0));
      case '/profile':
        return _buildPageRoute(ProfilePage(), settings, Offset(0, 1));
      case '/change-password':
        return _buildPageRoute(ChangePasswordPage(), settings, Offset(1, 0));
      case '/edit-profile':
        return _buildPageRoute(EditProfilePage(), settings, Offset(-1, 0));
      case '/':
        return _buildPageRoute(HomePage(), settings, Offset(0, -1));
      default:
        return null;
    }
  }

  PageRouteBuilder _buildPageRoute(
      Widget page, RouteSettings settings, Offset beginOffset) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;
        final tween = Tween(begin: beginOffset, end: Offset.zero)
            .chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
