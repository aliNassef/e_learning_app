import 'dart:developer';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/services/firestore_database.dart';
import '../../../../core/model/course_model.dart';

class HomeSource {
  final FirestoreService firestoreService;

  HomeSource({required this.firestoreService});

  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await firestoreService.getCourses();
      log(response.toString());
      List<CourseModel> courses = response
          .map(
            (e) => CourseModel.fromMap(e),
          )
          .toList();
      log(courses.toString());
      return courses;
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'something went wrong when fetching Courses'),
      );
    }
  }
}
