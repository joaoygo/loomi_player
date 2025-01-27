import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:loomi_player/presentation/widgets/app_bar_custom.dart';
import 'package:loomi_player/presentation/widgets/video_card_skeleton.dart';
import 'package:loomi_player/presentation/widgets/video_card_widget.dart';
import 'package:loomi_player/presentation/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _store = GetIt.I<HomeStore>();
  var logger = Logger();
  @override
  void initState() {
    super.initState();
    _store.getUser();
    logger.f(_store.user?.email ?? '');
    logger.f(_store.user?.name ?? '');
    logger.f(_store.user?.photoUrl ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/imgs/barbie.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.2],
              ),
            ),
          ),
          Column(
            children: [
              Observer(builder: (_) {
                if (_store.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return AppBarCustom(
                  title: 'title',
                  nameUser: _store.user?.name,
                  avatarImageUrl: _store.user?.photoUrl,
                );
              }),
              Expanded(
                child: Observer(
                  builder: (_) {
                    if (_store.isLoading) {
                      return const Center(child: VideoCardSkeleton());
                    }

                    if (_store.videos.isEmpty) {
                      return const Center(
                        child: Text(
                          'No videos available.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    }

                    return PageView.builder(
                      itemCount: _store.videos.length,
                      itemBuilder: (context, index) {
                        final video = _store.videos[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: VideoCardWidget(video: video),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
