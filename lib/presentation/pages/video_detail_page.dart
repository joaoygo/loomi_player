import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_player/core/constants/app_colors.dart';
import 'package:loomi_player/core/constants/assets_constants.dart';
import 'package:loomi_player/domain/entities/video_entity.dart';
import 'package:loomi_player/presentation/stores/video_detail_store.dart';
import 'package:loomi_player/presentation/widgets/comments_list_widget.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final VideoEntity video;

  const VideoDetailPage({super.key, required this.video});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final VideoDetailStore _viewDetailPageStore = GetIt.I<VideoDetailStore>();

  @override
  void initState() {
    super.initState();
    _viewDetailPageStore.initializeVideo(widget.video.streamLink);
    _viewDetailPageStore.toggleFullscreen();
    _viewDetailPageStore.togglePlayPause();
    _viewDetailPageStore.getComments(widget.video.id.toString());
    _viewDetailPageStore.getUser();
  }

  @override
  void dispose() {
    _viewDetailPageStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Observer(
          builder: (_) {
            if (!_viewDetailPageStore.isInitialized) {
              return const Center(child: CircularProgressIndicator());
            }

            if (_viewDetailPageStore.videoController.value.hasError) {
              return const Center(child: Text("Erro ao carregar o vídeo"));
            }

            return !_viewDetailPageStore.isExpanded &&
                    _viewDetailPageStore.showComments
                ? CommentsListWidget(
                    isFullScreen: true,
                    avatarUrl: _viewDetailPageStore.user?.photoUrl ?? '',
                    userName: _viewDetailPageStore.user?.name ?? '',
                    onReply: (comment) => _viewDetailPageStore.commentVideo(
                        widget.video.id.toString(), comment),
                    commentsList: _viewDetailPageStore.commentsList,
                    onClose: _viewDetailPageStore.toggleComments)
                : Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: AspectRatio(
                                    aspectRatio: _viewDetailPageStore
                                        .videoController.value.aspectRatio,
                                    child: VideoPlayer(
                                        _viewDetailPageStore.videoController),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 40,
                              left: 16,
                              right: 16,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: AppColors.primaryColor,
                                        ),
                                        onPressed: () {
                                          SystemChrome.setPreferredOrientations(
                                              [DeviceOrientation.portraitUp]);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Text(widget.video.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                            AssetsConstants.iconComment),
                                        onPressed:
                                            _viewDetailPageStore.toggleComments,
                                      ),
                                      _viewDetailPageStore.isExpanded
                                          ? Text(
                                              'Comments ${_viewDetailPageStore.commentsList.length}',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: VideoProgressIndicator(
                                      _viewDetailPageStore.videoController,
                                      allowScrubbing: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _viewDetailPageStore.totalDuration
                                        .toString()
                                        .split('.')
                                        .first,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(
                                      _viewDetailPageStore.isExpanded
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen,
                                      color: Colors.white,
                                    ),
                                    onPressed:
                                        _viewDetailPageStore.toggleFullscreen,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                          AssetsConstants.iconBack15),
                                      onPressed: () {
                                        _viewDetailPageStore.seekTo(
                                          _viewDetailPageStore.videoController
                                                  .value.position -
                                              const Duration(seconds: 15),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        _viewDetailPageStore.isPlaying
                                            ? Icons.pause_circle_rounded
                                            : Icons.play_circle,
                                        color: Colors.white,
                                        size: 70,
                                      ),
                                      onPressed:
                                          _viewDetailPageStore.togglePlayPause,
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                          AssetsConstants.iconSkip15),
                                      onPressed: () {
                                        _viewDetailPageStore.seekTo(
                                          _viewDetailPageStore.videoController
                                                  .value.position +
                                              const Duration(seconds: 15),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _viewDetailPageStore.isExpanded &&
                              _viewDetailPageStore.showComments
                          ? CommentsListWidget(
                              avatarUrl:
                                  _viewDetailPageStore.user?.photoUrl ?? '',
                              userName: _viewDetailPageStore.user?.name ?? '',
                              onReply: (comment) =>
                                  _viewDetailPageStore.commentVideo(
                                      widget.video.id.toString(), comment),
                              commentsList: _viewDetailPageStore.commentsList,
                              onClose: _viewDetailPageStore.toggleComments)
                          : SizedBox()
                    ],
                  );
          },
        ),
      ),
    );
  }
}
