import 'package:e_learning_app/core/errors/error_model.dart';
import 'package:e_learning_app/core/errors/exceptions.dart';

import '../../../../core/services/firestore_database.dart';
import '../model/course_model.dart';

class HomeSource {
  final FirestoreService firestoreService;

  HomeSource({required this.firestoreService});

  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await firestoreService.getCourses();
      List<CourseModel> courses = response
          .map(
            (e) => CourseModel.fromMap(e),
          )
          .toList();
      return courses;
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'something went wrong when fetching Courses'),
      );
    }
  }
}
