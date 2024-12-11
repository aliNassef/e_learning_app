import 'package:device_preview/device_preview.dart';
import 'package:e_learning_app/core/cache/cache_helper.dart';
import 'package:e_learning_app/core/services/service_locator.dart';
import 'package:e_learning_app/core/utils/app_color.dart';
import 'package:e_learning_app/features/layout/presentation/layout_view.dart';
import 'package:e_learning_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/shared/widgets/custom_bloc_observer.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  await CacheHelper.init();
  await setupServiceLocator();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: LayoutView.routeName,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
          ),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
