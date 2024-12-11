import '../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';
import '../../../course_details/presentation/view/course_details_view.dart';
import '../../../../core/entity/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final CourseEntity course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDetailsView.routeName, arguments: course);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 120.h,
                width: 120.w,
                child: CustomNetworkImage(
                  img: course.thumnailUrl,
                ),
              ),
            ),
            const HorizantalSpace(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.courseTitle,
                  style: AppStyles.textStyle12SB,
                ),
                Text(
                  'instructor : ${course.createdBy}',
                  style: AppStyles.textStyle12R,
                ),
                Text(
                  'category : ${course.category}',
                  style: AppStyles.textStyle12R,
                ),
                Text(
                  'discount : ${course.discount}%',
                  style: AppStyles.textStyle12R,
                ),
                Text(
                  '${int.parse(course.price) - (int.parse(course.price) * int.parse(course.discount) / 100)} EGP',
                  style: AppStyles.textStyle12R,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
