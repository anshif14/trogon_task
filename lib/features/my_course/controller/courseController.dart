import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_task/features/my_course/repository/courseRepository.dart';

final courseControllerProvider = Provider((ref) => CourseController(courseRepository: ref.watch(CourseRepositoryProvider)));


class CourseController {
  final CourseRepository _courseRepository;
  CourseController({required CourseRepository courseRepository}):
      _courseRepository = courseRepository;

  getUserData(){


   return _courseRepository.getData();
  }
  getCourseLevel(){
    return _courseRepository.getLevelByCourse();
  }
}