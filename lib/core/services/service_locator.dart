import 'package:e_learning_app/features/course_details/data/repo/course_details_repo_impl.dart';
import 'package:e_learning_app/features/course_details/data/source/course_details_source.dart';

import '../../features/home/data/repo/course_repo_impl.dart';
import '../../features/home/data/source/home_source.dart';

import '../repos/image_repo/image_rep_impl.dart';
import '../repos/image_repo/image_repo.dart';
import 'fire_storage.dart';
import 'storage_service.dart';
import 'firestore_database.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  injector.registerSingleton<FirestoreService>(
    FirestoreService(),
  );

  injector.registerSingleton<StorageService>(
    FireStorage(),
  );
  injector.registerSingleton<ImageRepo>(
    ImageRepImpl(
      storageService: injector<StorageService>(),
    ),
  );
  injector.registerSingleton<HomeSource>(
    HomeSource(
      firestoreService: injector<FirestoreService>(),
    ),
  );
  injector.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeSource: injector<HomeSource>(),
    ),
  );

  injector.registerSingleton<CourseDetailsSource>(
    CourseDetailsSource(
      firestoreService: injector<FirestoreService>(),
    ),
  );
  injector.registerSingleton<CourseDetailsRepoImpl>(
    CourseDetailsRepoImpl(
      courseDetailsSource: injector<CourseDetailsSource>(),
    ),
  );
}
