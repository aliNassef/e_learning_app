import 'package:e_learning_app/core/extensions/mediaquery_size.dart';
import 'package:e_learning_app/core/shared/widgets/custom_network_image.dart';
import 'package:e_learning_app/core/utils/app_constants.dart';
import 'package:e_learning_app/core/utils/app_styles.dart';
import 'package:e_learning_app/core/entity/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({super.key, required this.course});
  final CourseEntity course;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * .3,
            width: context.width,
            child: CustomNetworkImage(img: course.thumnailUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.kHorizontalPadding,
              vertical: 8.h,
            ),
            child: Column(
              children: [
                Text(
                  course.courseDescription,
                  style: AppStyles.textStyle14SB,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
