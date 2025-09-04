import 'package:ecommerce_app/core/utlis/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        // theme: ThemeData(
        //   fontFamily: 'Montserrat',
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        // ),
      ),
    );
  }
}
