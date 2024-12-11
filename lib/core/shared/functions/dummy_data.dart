import 'package:e_learning_app/core/entity/course_entity.dart';

CourseEntity dummyCourseEntity() {
  return CourseEntity(
    courseCode: '123',
    courseTitle: 'title',
    courseDescription: 'description',
    category: 'category',
    thumnailUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9wKPoZoutfEk5STg5NzM_-DdVjfwU0JTQpkXElevHpASsBFPgtrUlQOafHmuOkRO3ymA&usqp=CAU',
    createdBy: 'createdBy',
    price: '12',
    discount: '12',
  );
}

List<CourseEntity> getDummyCourses() {
  return [
    dummyCourseEntity(),
    dummyCourseEntity(),
    dummyCourseEntity(),
    dummyCourseEntity(),
  ];
}
