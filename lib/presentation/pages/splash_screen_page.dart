import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/stores/splash_store.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreenPage> {
  final SplashStore _splashStore = SplashStore();

  @override
  void initState() {
    super.initState();
    _splashStore.initializeApp().then((_) {
      if (_splashStore.isAuthenticated) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCardColor,
      body: Observer(
        builder: (_) {
          return Center(child: SvgPicture.asset(AssetsConstants.logoBasic));
        },
      ),
    );
  }
}
