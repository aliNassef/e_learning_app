import 'package:e_learning_app/core/services/service_locator.dart';
import 'package:e_learning_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_learning_app/features/home/data/repo/course_repo_impl.dart';
import 'package:e_learning_app/features/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:e_learning_app/features/home/presentation/widgets/home_view_body.dart';
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
          ),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
