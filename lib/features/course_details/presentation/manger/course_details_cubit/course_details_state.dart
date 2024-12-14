part of 'course_details_cubit.dart';

@immutable
sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsFailure extends CourseDetailsState {
  final String errMessage;

  CourseDetailsFailure({required this.errMessage});
}

final class CourseDetailsSuccess extends CourseDetailsState {
  final List<LessonEntity> lessons;

  CourseDetailsSuccess({required this.lessons});
}
