import 'package:e_learning_app/core/shared/widgets/spacers.dart';
import 'package:e_learning_app/features/course_details/presentation/manger/course_details_cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import 'custom_list_tile.dart';
import 'display_youtube_video.dart';

class CourseContentViewBody extends StatelessWidget {
  const CourseContentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
      builder: (context, state) {
        if (state is CourseDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DisplayYoutubeVideo(
                url: state.lessons.first.videoUrl,
              ),
              const VerticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.lessons.first.title,
                  style: AppStyles.textStyle16SB,
                  textAlign: TextAlign.start,
                ),
              ),
              const VerticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.lessons.first.description,
                  style: AppStyles.textStyle12R,
                  textAlign: TextAlign.start,
                ),
              ),
              const VerticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Content :-',
                  style: AppStyles.textStyle16M,
                ),
              ),
              const VerticalSpace(16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomListTile(
                      title: state.lessons[index].title,
                      subTitle: state.lessons[index].description,
                    ),
                  ),
                  separatorBuilder: (_, index) => const VerticalSpace(16),
                  itemCount: state.lessons.length,
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
