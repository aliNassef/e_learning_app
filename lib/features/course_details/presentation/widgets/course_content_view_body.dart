import 'package:e_learning_app/core/extensions/mediaquery_size.dart';
import 'package:e_learning_app/features/course_details/presentation/manger/course_details_cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseContentViewBody extends StatefulWidget {
  const CourseContentViewBody({super.key});

  @override
  State<CourseContentViewBody> createState() => _CourseContentViewBodyState();
}

class _CourseContentViewBodyState extends State<CourseContentViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
      builder: (context, state) {
        if (state is CourseDetailsSuccess) {
          String? videId =
              YoutubePlayer.convertUrlToId(state.lessons.first.videoUrl);
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: videId!,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );
          return Column(
            children: [
              SizedBox(
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
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
