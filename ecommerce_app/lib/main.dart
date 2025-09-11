import 'package:ecommerce_app/core/logic/language/toggle_language_cubit.dart';
import 'package:ecommerce_app/core/utlis/App_theme.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

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

      child: BlocProvider(
        create: (context) => ToggleLanguageCubit(),
        child: BlocBuilder<ToggleLanguageCubit, Locale>(
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
               locale: state,
              supportedLocales: S.delegate.supportedLocales,

              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              // theme: ThemeData(
              //   fontFamily: 'Montserrat',
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
              // ),
            );
          },
        ),
      ),
    );
  }
}
