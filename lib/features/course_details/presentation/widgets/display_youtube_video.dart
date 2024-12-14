
import 'package:e_learning_app/core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DisplayYoutubeVideo extends StatefulWidget {
  const DisplayYoutubeVideo({super.key, required this.url});
  final String url;
  @override
  State<DisplayYoutubeVideo> createState() => _DisplayYoutubeVideoState();
}

class _DisplayYoutubeVideoState extends State<DisplayYoutubeVideo> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = getVideoId(widget.url);
    return SizedBox(
      height: context.height * .3,
      width: context.width,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          controller.addListener(
            () {
              setState(() {});
            },
          );
        },
      ),
    );
  }

  YoutubePlayerController getVideoId(String url) {
    String? videId = YoutubePlayer.convertUrlToId(url);
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return controller;
  }
}
