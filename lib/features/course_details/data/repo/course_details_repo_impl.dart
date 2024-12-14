import 'package:dartz/dartz.dart';

import 'package:e_learning_app/core/entity/lesson_entity.dart';
import 'package:e_learning_app/core/errors/exceptions.dart';

import 'package:e_learning_app/core/errors/failure.dart';
import 'package:e_learning_app/features/course_details/data/source/course_details_source.dart';

import '../../domain/repo/course_details_repo.dart';

class CourseDetailsRepoImpl extends CourseDetailsRepo {
  final CourseDetailsSource courseDetailsSource;

  CourseDetailsRepoImpl({required this.courseDetailsSource});
  @override
  Future<Either<Failure, List<LessonEntity>>> getIntroLesson(
      {required String courseId}) async {
    try {
      final response = await courseDetailsSource.getLesson(courseId: courseId);
      return Right(response.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
