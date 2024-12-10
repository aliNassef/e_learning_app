import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/errors/failure.dart';
import 'package:e_learning_app/features/home/domain/entity/course_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
}
