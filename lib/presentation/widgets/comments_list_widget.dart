import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/data/models/comments_model.dart';
import 'package:loomi_player/presentation/widgets/card_comment_widget.dart';

class CommentsListWidget extends StatefulWidget {
  final List<CommentsModel> commentsList;
  final Function() onClose;
  final Function(String) onReply;
  final String avatarUrl;
  final String userName;
  final bool? isFullScreen;

  const CommentsListWidget({
    super.key,
    required this.commentsList,
    required this.onClose,
    required this.onReply,
    required this.avatarUrl,
    required this.userName,
    this.isFullScreen = false,
  });

  @override
  State<CommentsListWidget> createState() => _CommentsListWidgetState();
}

class _CommentsListWidgetState extends State<CommentsListWidget> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isFullScreen == true ? double.infinity : 335,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.commentsList.length} Comments",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onClose,
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.commentsList.length,
                itemBuilder: (context, index) {
                  String dateReply =
                      widget.commentsList[index].timestamp.toString();
                  DateTime receivedTime = DateTime.parse(dateReply);
                  DateTime now = DateTime.now().toUtc();
                  Duration difference = now.difference(receivedTime);
                  return CardCommentWidget(
                    onEdit: (id) {},
                    onDelete: (id) {},
                    onReport: (id) {},
                    idComment: index.toString(),
                    nameUser: widget.commentsList[index].userName,
                    comment: widget.commentsList[index].comment,
                    time: difference.inHours > 0
                        ? '${difference.inHours} hours'
                        : '${difference.inMinutes} minutes',
                    avatarImageUrl: widget.commentsList[index].photoUrl,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: widget.avatarUrl.contains('https://')
                      ? NetworkImage(widget.avatarUrl)
                      : widget.avatarUrl.isNotEmpty
                          ? FileImage(File(widget.avatarUrl))
                          : null,
                  child: widget.avatarUrl.isEmpty
                      ? Text(
                          widget.userName.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : null,
                ),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.backgroundColor.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    if (_commentController.text.trim().isNotEmpty) {
                      widget.onReply(_commentController.text.trim());
                      _commentController.clear();
                    }
                  },
                  icon: Icon(Icons.send, color: AppColors.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
