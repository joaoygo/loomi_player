import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? nameUser;
  final String? avatarImageUrl;

  const AppBarCustom({
    super.key,
    required this.title,
    this.avatarImageUrl,
    this.nameUser,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: SvgPicture.asset(AssetsConstants.logoMini),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage:
                  avatarImageUrl == null ? null : NetworkImage(avatarImageUrl!),
              backgroundColor:
                  avatarImageUrl == null ? Colors.lightBlueAccent : null,
              child: avatarImageUrl == null
                  ? Text(
                      nameUser?.substring(0, 1).toUpperCase() ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
