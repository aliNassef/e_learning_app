import 'package:e_learning_app/features/course_details/data/repo/course_details_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entity/course_entity.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../manger/course_details_cubit/course_details_cubit.dart';
import '../widgets/course_details_view_body.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.course});
  static const String routeName = 'CourseDetailsView';
  final CourseEntity course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: course.courseTitle,
        hasLeading: true,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CourseDetailsCubit(
            injector<CourseDetailsRepoImpl>(),
          ),
          child: CourseDetailsViewBody(
            course: course,
          ),
        ),
      ),
    );
  }
}
