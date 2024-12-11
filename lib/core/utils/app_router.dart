import 'package:e_learning_app/core/entity/course_entity.dart';
import 'package:flutter/material.dart';

import '../../features/course_details/presentation/view/course_details_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../shared/widgets/custom_no_internet_widget.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const LayoutView();
        },
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const LayoutView();
        },
      );
    case CourseDetailsView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          final course = settings.arguments as CourseEntity;
          return CourseDetailsView(
            course: course,
          );
        },
      );
    case CustomNoInternetWidget.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CustomNoInternetWidget();
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
