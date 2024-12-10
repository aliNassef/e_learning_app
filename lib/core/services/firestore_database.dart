import 'package:cloud_firestore/cloud_firestore.dart';
import 'endpoints.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new course
  Future<void> addCourse(Map<String, dynamic> course) async {
    final courseDoc =
        _firestore.collection(Endpoints.courses).doc(course['courseId']);
    await courseDoc.set(course);
  }

  /// Add a lesson to a specific course
  Future<void> addLesson(String courseId, Map<String, dynamic> lesson) async {
    final lessonDoc = _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.lessons)
        .doc(lesson['lessonId']);
    await lessonDoc.set(lesson);
  }

  /// Update progress for a user
  Future<void> updateProgress(
      String userId, Map<String, dynamic> progress) async {
    final progressDoc = _firestore
        .collection(Endpoints.users)
        .doc(userId)
        .collection(Endpoints.progress)
        .doc(progress['lessonId']);
    await progressDoc.set(progress);
  }

  /// Add a quiz to a course
  Future<void> addQuiz(String courseId, Map<String, dynamic> quiz) async {
    final quizDoc = _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.quizes)
        .doc(quiz['id']);
    await quizDoc.set(quiz);
  }

  /// Add a question to a quiz
  Future<void> addQuestions(String courseId, String quizId,
      List<Map<String, dynamic>> questions) async {
    final questionDoc = _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.quizes)
        .doc(quizId)
        .collection(Endpoints.questions);
    for (var question in questions) {
      await questionDoc.add(question); // Add each question
    }
  }

  /// Record a payment
  Future<void> recordPayment(Map<String, dynamic> payment) async {
    final paymentDoc =
        _firestore.collection(Endpoints.payments).doc(payment['paymentId']);
    await paymentDoc.set(payment);
  }

  Future<List<Map<String, dynamic>>> getCourses() async {
    final querySnapshot = await _firestore.collection(Endpoints.courses).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Fetch all lessons for a specific course
  Future<List<Map<String, dynamic>>> getLessons(String courseId) async {
    final querySnapshot = await _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.lessons)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Fetch user progress for all lessons
  Future<List<Map<String, dynamic>>> getUserProgress(String userId) async {
    final querySnapshot = await _firestore
        .collection(Endpoints.users)
        .doc(userId)
        .collection(Endpoints.progress)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Fetch all quizzes for a course
  Future<List<Map<String, dynamic>>> getQuizzes(String courseId) async {
    final querySnapshot = await _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.quizes)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Fetch all questions for a specific quiz
  Future<List<Map<String, dynamic>>> getQuestions(
      String courseId, String quizId) async {
    final querySnapshot = await _firestore
        .collection(Endpoints.courses)
        .doc(courseId)
        .collection(Endpoints.quizes)
        .doc(quizId)
        .collection(Endpoints.questions)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
