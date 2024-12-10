import 'package:flutter/material.dart';

import 'course_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => const CourseItem(),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: 3,
    );
  }
}

