import '../../../../core/services/service_locator.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../data/repo/course_repo_impl.dart';
import '../manger/home_cubit/home_cubit.dart';
import '../widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Courses',
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeCubit(
            injector<HomeRepoImpl>(),
          )..getCourses(),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
