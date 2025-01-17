import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/presentation/widgets/primary_button.dart';
import 'package:share_plus/share_plus.dart';

class VideoCardWidget extends StatelessWidget {
  final VideoEntity video;

  const VideoCardWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff12c2e9),
                  Color(0xffc471ed),
                  Color(0xfff64f59)
                ],
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.genre.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColorText,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    video.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColorText,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    video.synopsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColorTextOpacity,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 31),
                  Row(
                    children: [
                      Text(
                        'coments',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '1000',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Color(0xff12c2e9),
                        child: Text('J'),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        constraints: BoxConstraints(maxWidth: 227),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectd',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(217, 218, 222, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        ontap: () {
                          Navigator.pushNamed(
                            context,
                            '/video-detail',
                            arguments: video,
                          );
                        },
                        text: 'Watch',
                        width: 207,
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  Divider(color: Colors.white70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon:
                                    SvgPicture.asset(AssetsConstants.iconRate),
                                onPressed: () {
                                  // Lógica de curtir
                                },
                                color: Colors.white,
                              ),
                              Text(
                                'Rate',
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon:
                                    SvgPicture.asset(AssetsConstants.iconShare),
                                onPressed: () {
                                  String linkToShare = 'https://seulink.com';
                                  Share.share(linkToShare);
                                },
                                color: Colors.white70,
                              ),
                              Text(
                                'Gift to someone?',
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(children: [
                        Text(
                          'Available until',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          DateFormat('MMM dd, yyyy')
                              .format(video.publishedAt)
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffAA73F0)),
                        ),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
