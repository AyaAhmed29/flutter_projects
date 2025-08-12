import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
    
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.primaryColor,
              selectionHandleColor: AppColors.primaryColor,
            ),
            secondaryHeaderColor: AppColors.primaryColor,
            fontFamily: 'Lexend_Deca',
            appBarTheme: AppBarTheme(color: Color(0xffF3F5F4)),
            scaffoldBackgroundColor: Color(0xffF3F5F4),
          ),
        );
      },
    );
  }
}
