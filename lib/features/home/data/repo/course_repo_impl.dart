import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../source/home_source.dart';
import '../../../../core/entity/course_entity.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeSource homeSource;

  HomeRepoImpl({required this.homeSource});
  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      final courses = await homeSource.getCourses();
      log(courses.toString());
      List<CourseEntity> courseEntities =
          courses.map((e) => e.toEntity()).toList();
      return right(courseEntities);
    } catch (e) {
      return left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}