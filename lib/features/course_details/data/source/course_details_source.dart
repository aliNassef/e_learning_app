import 'package:e_learning_app/core/errors/error_model.dart';
import 'package:e_learning_app/core/errors/exceptions.dart';
import 'package:e_learning_app/core/model/lesson_model.dart';
import 'package:e_learning_app/core/services/firestore_database.dart';

class CourseDetailsSource {
  final FirestoreService firestoreService;

  CourseDetailsSource({required this.firestoreService});
  Future<List<LessonModel>> getLesson({
    required String courseId,
  }) async {
    try {
      final response = await firestoreService.getLessons(courseId);
      return response.map((e) => LessonModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'something went wrong when getting lessons'),
      );
    }
  }
}
