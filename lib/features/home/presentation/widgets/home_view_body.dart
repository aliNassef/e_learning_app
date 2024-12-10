import 'package:e_learning_app/core/shared/functions/dummy_data.dart';
import 'package:e_learning_app/features/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/shared/widgets/custom_failure_widget.dart';
import 'course_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>(),
      buildWhen: (_, current) =>
          current is HomeGetCoursesLoaded ||
          current is HomeGetCoursesFailure ||
          current is HomeGetCoursesLoading,
      builder: (context, state) {
        if (state is HomeGetCoursesLoaded) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
            itemBuilder: (_, index) => CourseItem(
              course: state.courses[index],
            ),
            separatorBuilder: (_, index) => const Divider(),
            itemCount: state.courses.length,
          );
        } else if (state is HomeGetCoursesFailure) {
          return CustomFailureWidget(
            errMessage: state.errMessage,
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              itemBuilder: (_, index) => CourseItem(
                course: getDummyCourses()[index],
              ),
              separatorBuilder: (_, index) => const Divider(),
              itemCount: getDummyCourses().length,
            ),
          );
        }
      },
    );
  }
}
