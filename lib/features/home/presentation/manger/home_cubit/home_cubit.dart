import 'package:e_learning_app/features/home/domain/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/core/entity/course_entity.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  void getCourses() async {
    emit(HomeGetCoursesLoading());
    final result = await _homeRepo.getCourses();
    result.fold(
      (failure) => emit(
        HomeGetCoursesFailure(errMessage: failure.errMessage),
      ),
      (courses) => emit(
        HomeGetCoursesLoaded(courses: courses),
      ),
    );
  }
}
