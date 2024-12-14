import 'package:e_learning_app/core/services/service_locator.dart';
import 'package:e_learning_app/features/course_details/data/repo/course_details_repo_impl.dart';
import 'package:e_learning_app/features/course_details/presentation/manger/course_details_cubit/course_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/course_content_view_body.dart';

class CourseContentView extends StatelessWidget {
  const CourseContentView({super.key, required this.courseId});
  static const routeName = 'course_content_view';
  final String courseId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CourseDetailsCubit(
          injector<CourseDetailsRepoImpl>(),
        )..getCourseDetails(
            courseId: courseId,
          ),
        child: const SafeArea(
          child: CourseContentViewBody(),
        ),
      ),
    );
  }
}
