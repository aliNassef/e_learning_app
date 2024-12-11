import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/errors/failure.dart';
import 'package:e_learning_app/features/home/data/source/home_source.dart';
import 'package:e_learning_app/core/entity/course_entity.dart';
import 'package:e_learning_app/features/home/domain/repo/home_repo.dart';

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