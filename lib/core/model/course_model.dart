import 'package:cloud_firestore/cloud_firestore.dart';
import '../entity/course_entity.dart';
import 'review_model.dart';

class CourseModel {
  final String courseId;
  final String title;
  final String description;
  final String category;
  final String thumbnailUrl;
  final String createdBy; // userId of the teacher
  final DateTime? createdAt;
  final String price;
  final String discount;
  final List<ReviewModel> reviews;
  CourseModel({
    required this.reviews,
    required this.courseId,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnailUrl,
    required this.createdBy,
    required this.price,
    required this.discount,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'title': title,
      'reviews': reviews.map((e) => e.toMap()).toList(),
      'description': description,
      'category': category,
      'thumbnailUrl': thumbnailUrl,
      'createdBy': createdBy,
      'price': price,
      'discount': discount,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      reviews:
          map['reviews'] != null ? List<ReviewModel>.from(map['reviews']) : [],
      courseId: map['courseId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      thumbnailUrl: map['thumbnailUrl'] ?? '',
      createdBy: map['createdBy'] ?? '',
      price: map['price'] ?? '',
      discount: map['discount'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  CourseEntity toEntity() => CourseEntity(
        reviewEntity: reviews.map((e) => e.toEntity()).toList(),
        courseCode: courseId,
        courseTitle: title,
        courseDescription: description,
        category: category,
        thumnailUrl: thumbnailUrl,
        createdBy: createdBy,
        price: price,
        discount: discount,
      );
  factory CourseModel.fromEntity(CourseEntity course) {
    return CourseModel(
      reviews:
          course.reviewEntity?.map((e) => ReviewModel.fromEntity(e)).toList() ??
              [],
      courseId: course.courseCode,
      title: course.courseTitle,
      description: course.courseDescription,
      category: course.category,
      thumbnailUrl: course.thumnailUrl,
      createdBy: course.createdBy,
      createdAt: DateTime.now(),
      price: course.price,
      discount: course.discount,
    );
  }
}
