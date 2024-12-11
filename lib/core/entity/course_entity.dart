import 'review_entity.dart';

class CourseEntity {
  final String courseCode;
  final String courseTitle;
  final String courseDescription;
  final String category;
  final String createdBy;
  final String thumnailUrl;
  final String price;
  final String discount;
  final List<ReviewEntity>? reviewEntity;
  CourseEntity({
    this.reviewEntity,
    required this.price,
    required this.discount,
    required this.courseCode,
    required this.courseTitle,
    required this.courseDescription,
    required this.category,
    required this.createdBy,
    required this.thumnailUrl,
  });
}
