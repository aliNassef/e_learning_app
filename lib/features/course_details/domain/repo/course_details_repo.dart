import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/entity/lesson_entity.dart';
import 'package:e_learning_app/core/errors/failure.dart';

abstract class CourseDetailsRepo {
  Future<Either<Failure, List<LessonEntity>>> getIntroLesson({required String courseId});
}
