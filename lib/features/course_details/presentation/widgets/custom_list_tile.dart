import '../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero.copyWith(
          left: 8.w,
          right: 8.w,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primaryColor,
        ),
        title: Text(
          'Intro',
          style: AppStyles.textStyle12SB,
        ),
        onTap: onTap,
        subtitle: Text(
          'take a look at course content',
          style: AppStyles.textStyle10R,
        ),
      ),
    );
  }
}
