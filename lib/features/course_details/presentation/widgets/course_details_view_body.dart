import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/shared/widgets/custom_network_image.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/entity/course_entity.dart';
import 'custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.category,
                  style: AppStyles.textStyle14SB.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const VerticalSpace(8),
                Text(
                  'what will you learn in this course ?',
                  style: AppStyles.textStyle14SB,
                ),
                ReadMoreText(
                  course.courseDescription,
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: AppColors.primaryColor,
                  style: AppStyles.textStyle14R,
                  trimCollapsedText: 'show more',
                  trimExpandedText: 'show less',
                  moreStyle: AppStyles.textStyle14R.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const VerticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount : ',
                      style: AppStyles.textStyle14SB,
                    ),
                    Text(
                      '${course.discount} %',
                      style: AppStyles.textStyle14SB.copyWith(
                        color: AppColors.gray150Color,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price : ',
                      style: AppStyles.textStyle14SB,
                    ),
                    Text(
                      '${int.parse(course.price) - (int.parse(course.price) * int.parse(course.discount) / 100)} EGP',
                      style: AppStyles.textStyle14SB.copyWith(
                        color: AppColors.gray150Color,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Insructor : ',
                      style: AppStyles.textStyle14SB,
                    ),
                    Text(
                      course.createdBy,
                      style: AppStyles.textStyle14SB.copyWith(
                        color: AppColors.gray150Color,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(20),
                const CustomListTile(),
                const VerticalSpace(24),
                const DefaultAppButton(
                  text: 'Enroll Now',
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
