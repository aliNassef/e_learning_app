import 'package:flutter/material.dart';

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
