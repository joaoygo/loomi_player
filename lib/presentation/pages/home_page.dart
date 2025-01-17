import 'package:flutter/material.dart';
import 'package:loomi_player/presentation/widgets/app_bar_custom.dart';
import 'package:loomi_player/presentation/widgets/video_card_widget.dart';
import 'package:loomi_player/presentation/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final HomeStore store = GetIt.I<HomeStore>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 233, 233),
      appBar: AppBarCustom(
        title: 'title',
        nameUser: 'joaoygo',
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (store.videos.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum vídeo disponível.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return PageView.builder(
            itemCount: store.videos.length,
            itemBuilder: (context, index) {
              final video = store.videos[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: VideoCardWidget(video: video),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.fetchVideos();
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
