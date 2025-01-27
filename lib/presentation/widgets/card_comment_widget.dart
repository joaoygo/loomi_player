import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';

class CardCommentWidget extends StatelessWidget {
  final String? nameUser;
  final String? avatarImageUrl;
  final String? comment;
  final Function(String) onEdit;
  final Function(String) onDelete;
  final Function(String) onReport;
  final String idComment;
  final String? time;

  const CardCommentWidget(
      {super.key,
      this.avatarImageUrl,
      this.nameUser,
      this.comment,
      required this.onEdit,
      required this.onDelete,
      required this.onReport,
      required this.idComment,
      this.time = '2 weeks ago'});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              backgroundImage:
                  avatarImageUrl != null && avatarImageUrl!.contains('https://')
                      ? NetworkImage(avatarImageUrl!)
                      : avatarImageUrl != null && avatarImageUrl!.isNotEmpty
                          ? FileImage(File(avatarImageUrl!))
                          : null,
              child: avatarImageUrl == null || avatarImageUrl!.isEmpty
                  ? Text(
                      nameUser?.substring(0, 1).toUpperCase() ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameUser ?? '',
                    style: const TextStyle(
                      color: AppColors.primaryColorText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    time ?? '2 weeks ago',
                    style: TextStyle(
                        color: AppColors.primaryColorTextOpacity,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comment ?? '',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColorText),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'View 12 replies',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(width: 13),
                      Text(
                        'REPLY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(193, 204, 209, 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert,
                  color: AppColors.primaryColorText),
              color: AppColors.backgroundColor,
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    onEdit(idComment);
                    break;
                  case 'delete':
                    onDelete(idComment);
                    break;
                  case 'report':
                    onReport(idComment);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsConstants.iconWrite),
                      SizedBox(width: 11),
                      Text('Edit',
                          style: TextStyle(
                              color: AppColors.primaryColorText, fontSize: 13)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsConstants.iconTrash),
                      SizedBox(width: 11),
                      Text('Delete',
                          style: TextStyle(
                              color: AppColors.primaryColorText, fontSize: 13)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'report',
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsConstants.iconFlag),
                      SizedBox(width: 11),
                      Text('Report',
                          style: TextStyle(
                              color: AppColors.primaryColorText, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
