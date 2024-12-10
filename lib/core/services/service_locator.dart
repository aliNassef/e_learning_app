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

   
}
