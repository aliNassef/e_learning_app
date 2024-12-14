import 'package:e_learning_app/features/course_details/domain/repo/course_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entity/lesson_entity.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(this._courseDetailsRepo) : super(CourseDetailsInitial());
  final CourseDetailsRepo _courseDetailsRepo;

  Future<void> getCourseDetails({required String courseId}) async {
    emit(CourseDetailsLoading());
    final response = await _courseDetailsRepo.getIntroLesson(
      courseId: courseId,
    );
    response.fold(
      (l) => emit(CourseDetailsFailure(errMessage: l.errMessage)),
      (r) => emit(
        CourseDetailsSuccess(lessons: r),
      ),
    );
  }
}
