import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/entity/course_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
}
