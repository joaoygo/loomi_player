import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:loomi_player/data/models/comments_model.dart';
import 'package:loomi_player/data/models/user_model.dart';
import 'package:loomi_player/domain/usecases/add_comment_video_usecases.dart';
import 'package:loomi_player/domain/usecases/delete_comment_video_usecases.dart';
import 'package:loomi_player/domain/usecases/get_comment_video_usecases.dart';
import 'package:loomi_player/domain/usecases/get_user_firestore_usecase.dart';
import 'package:loomi_player/domain/usecases/get_user_id_shared_preferences_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'video_detail_store.g.dart';

class VideoDetailStore = VideoDetailStoreBase with _$VideoDetailStore;

abstract class VideoDetailStoreBase with Store {
  var logger = Logger();
  late VideoPlayerController _videoController;
  final GetUserIdSharedPreferencesUseCase _getUserIdSharedPreferencesUseCase =
      GetIt.I<GetUserIdSharedPreferencesUseCase>();
  final GetUserFirestoreUseCase _getUserFirestoreUseCase =
      GetIt.I<GetUserFirestoreUseCase>();
  final AddCommentVideoUsecases _addCommentVideoUsecases =
      GetIt.I<AddCommentVideoUsecases>();
  final GetCommentVideoUsecases _getCommentVideoUsecases =
      GetIt.I<GetCommentVideoUsecases>();
  final DeleteCommentVideoUsecases _deleteCommentVideoUsecases =
      GetIt.I<DeleteCommentVideoUsecases>();

  @observable
  ObservableList<CommentsModel> commentsList = ObservableList<CommentsModel>();

  @observable
  UserModel? user;

  @observable
  bool isLoading = false;

  @observable
  bool isInitialized = false;

  @observable
  bool isPlaying = false;

  @observable
  Duration currentPosition = Duration.zero;

  @observable
  bool isExpanded = false;

  @observable
  bool showComments = false;

  @observable
  bool showControls = true;

  Timer? _hideControlsTimer;

  @computed
  Duration get totalDuration => _videoController.value.duration;

  VideoPlayerController get videoController => _videoController;

  @action
  void toggleControlsVisibility() {
    showControls = true;
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      showControls = false;
    });
  }

  @action
  Future<void> initializeVideo(String videoUrl) async {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await _videoController.initialize();
    isInitialized = true;

    _videoController.addListener(() {
      currentPosition = _videoController.value.position;
      isPlaying = _videoController.value.isPlaying;

      if (!isPlaying) {
        showControls = true;
        _hideControlsTimer?.cancel();
      }
    });
  }

  @action
  void togglePlayPause() {
    if (isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
  }

  @action
  void toggleComments() {
    showComments = !showComments;
  }

  @action
  void toggleFullscreen() {
    if (isExpanded) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    }
    isExpanded = !isExpanded;
  }

  @action
  void seekTo(Duration position) {
    _videoController.seekTo(position);
  }

  @action
  void toggleExpansion() {
    isExpanded = !isExpanded;
  }

  @action
  Future<bool> commentVideo(String videoId, String comment) async {
    await getUser();
    if (user == null) {
      return false;
    }
    final result = await _addCommentVideoUsecases(
        videoId, user?.name ?? '', comment, user?.photoUrl ?? '');
    if (result) {
      getComments(videoId);
      logger.i('Comment added successfully.');
    }
    return result;
  }

  @action
  Future<void> getComments(String videoId) async {
    try {
      isLoading = true;

      final comments = await _getCommentVideoUsecases(videoId);

      if (comments.isNotEmpty) {
        commentsList.clear();

        commentsList
            .addAll(comments.map((comment) => CommentsModel.fromJson(comment)));

        for (var comment in commentsList) {
          logger.i(comment.userName.toString());
        }

        logger.f(commentsList);
      }
    } catch (e) {
      logger.e('Error getting comments: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<bool> deleteComment(String videoId, String commentId) async {
    return await _deleteCommentVideoUsecases(videoId, commentId);
  }

  Future<void> getUser() async {
    try {
      isLoading = true;
      final userId = await _getUserIdSharedPreferencesUseCase();
      if (userId == null) return;
      final userData = await _getUserFirestoreUseCase(userId);

      if (userData != null) {
        user = UserModel.fromJson(userData);
      } else {
        user = null;
      }
    } catch (e) {
      logger.d("Error getting user: $e");
    } finally {
      isLoading = false;
    }
  }

  void dispose() {
    _videoController.dispose();
    _hideControlsTimer?.cancel();
  }
}
