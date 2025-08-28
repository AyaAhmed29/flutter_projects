import 'package:go_router/go_router.dart';
import 'package:news_app/feature/home/view/home_view.dart';
import 'package:news_app/feature/splash/view/splash_view.dart';
import 'package:news_app/feature/splash/view/welcome_view.dart';

abstract class AppRouter {
  static const String welcomeView = '/WelcomeView';

  static const String homeView = '/HomeView';

  static final router = GoRouter(
    routes: [
      GoRoute(builder: (context, state) => const SplashView(), path: '/'),
      GoRoute(builder: (context, state) => const HomeView(), path: homeView),
      GoRoute(
        builder: (context, state) => const WelcomeView(),
        path: welcomeView,
      ),
    ],
  ); 
}
