import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';
import 'core/init_config/initalization_config.dart';
import 'core/utils/restart_app_class.dart';
void main() async {
  
  await initializationClass();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', ''), Locale('ar', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('en', ''),
      fallbackLocale: const Locale('en', ''),
      child: HotRestartController(
          child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) {
          return const MyApp();
        },
      )),
    ),
  );
}
