import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/presentation/stores/profile_store.dart';
import 'package:loomi_player/presentation/widgets/banner_widget.dart';
import 'package:loomi_player/presentation/widgets/custom_button_rounded_widget.dart';
import 'package:loomi_player/presentation/widgets/custom_card_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileStore _profileStore = GetIt.I<ProfileStore>();

  @override
  void initState() {
    super.initState();
    _profileStore.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15),
            child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 110,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primaryColorOpacity),
                  ),
                  child: const Center(
                      child: Text('Edit Profile',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor))),
                )),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 20),
                  child: CircleAvatar(
                    radius: 57,
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: _profileStore.user?.photoUrl != null &&
                            _profileStore.user!.photoUrl!.isNotEmpty
                        ? NetworkImage(_profileStore.user!.photoUrl!)
                        : null,
                    child: _profileStore.user?.photoUrl == null ||
                            _profileStore.user!.photoUrl!.isEmpty
                        ? Icon(Icons.person, size: 50, color: Colors.white)
                        : null,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    Text(
                      _profileStore.user?.name ?? '',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/change-password');
                },
                child: CustomCardWidget(
                  icon: Icon(Icons.shield_outlined, color: Colors.white),
                  text: 'Change Password',
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomCardWidget(
                icon: Icon(Icons.delete_outline_outlined, color: Colors.white),
                text: 'Delete my account',
              ),
            ),
            SizedBox(height: 46),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Subscriptions',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.backgroundCardColor,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 67,
                            height: 68,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AssetsConstants.logoMini),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 19),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('STREAM Premium',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                  Text('Jan 22, 2023',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors
                                              .primaryColorTextOpacity)),
                                ]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: Text(
                          'Coming soon',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 41),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('History',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                )),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BannerWidget(
                  movieName: 'Barbie',
                  movieYear: '2023',
                ),
                SizedBox(width: 8),
                BannerWidget(
                    movieName: 'Everything',
                    movieYear: '2022',
                    imageProvider: AssetImage('assets/imgs/allatonce.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 34),
              child: CustomButtonRoundedWidget(
                  text: 'Log out',
                  onTap: () {
                    _profileStore.clearUser();
                    Navigator.pushReplacementNamed(context, '/login');
                  }),
            )
          ],
        ),
      ))),
    );
  }
}
