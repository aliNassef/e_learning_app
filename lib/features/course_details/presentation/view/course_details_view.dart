import 'package:flutter/material.dart';

import '../../../../core/entity/course_entity.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
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
