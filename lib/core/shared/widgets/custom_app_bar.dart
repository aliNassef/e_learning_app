import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasLeading = false,
  });
  final String title;
  final bool hasLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLeading
          ? Transform.scale(
              scale: 0.9,
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          : null,
      elevation: 2,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.textStyle16SB.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
