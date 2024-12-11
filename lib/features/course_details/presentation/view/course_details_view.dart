import 'package:e_learning_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_learning_app/features/home/domain/entity/course_entity.dart';
import 'package:flutter/material.dart';

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
        child: CourseDetailsViewBody(
          course: course,
        ),
      ),
    );
  }
}
