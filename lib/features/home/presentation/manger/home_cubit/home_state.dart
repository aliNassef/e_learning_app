part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetCoursesLoading extends HomeState {}

final class HomeGetCoursesLoaded extends HomeState {
  final List<CourseEntity> courses;

  HomeGetCoursesLoaded({required this.courses});
}

final class HomeGetCoursesFailure extends HomeState {
  final String errMessage;

  HomeGetCoursesFailure({required this.errMessage});
}
