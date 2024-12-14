import 'package:e_learning_app/core/entity/lesson_entity.dart';

class LessonModel {
  final String courseId;
  final String description;
  final String lessonId;
  final String title;
  final String videoUrl;

  LessonModel({
    required this.courseId,
    required this.description,
    required this.lessonId,
    required this.title,
    required this.videoUrl,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      courseId: json['courseId'],
      description: json['description'],
      lessonId: json['lessonId'],
      title: json['title'],
      videoUrl: json['videoUrl'],
    );
  }
  LessonEntity toEntity() => LessonEntity(
        courseId: courseId,
        description: description,
        lessonId: lessonId,
        title: title,
        videoUrl: videoUrl,
      );
}

/*
courseId
description
lessonId
title
videoUrl

 */
