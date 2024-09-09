import 'package:finany/common/utils/theme.dart';
import 'package:finany/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:finany/src/splashscreen/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'common/utils/app_routes.dart';
import 'src/splashscreen/controllers/onboarding_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => TabIndexNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: FAppTheme.lightTheme,
          darkTheme: FAppTheme.darkTheme,
          routerConfig: router,
        );
      },
      child: Splashscreen(),
    );
  }
}
