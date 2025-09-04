import 'package:go_router/go_router.dart';
import 'package:news_app/feature/bookmark/view/bookmark_view.dart';
import 'package:news_app/feature/explor/view/explor_view.dart';
import 'package:news_app/feature/explor/view/search_view.dart';
import 'package:news_app/feature/home/view/home_view.dart';
import 'package:news_app/feature/location/view/location_view.dart';
import 'package:news_app/feature/navigation/view/navigation_view.dart';
import 'package:news_app/feature/weather/view/weather_view.dart';
import 'package:news_app/feature/splash/view/welcome_view.dart';

abstract class AppRouter {
  static const String welcomeView = '/WelcomeView';
  static const String homeView = '/HomeView';
  static const String navigationViwe = '/NavigationViwe';
  static const String explorView = '/ExplorView';
  static const String bookmarkViewhView = '/BookmarkView';
  static const String profileView = '/ProfileView';
  static const String searchView = '/SearchView';
  static const String searchSesultsView = '/SearchSesultsView';

  static final router = GoRouter(
    routes: [
      GoRoute(builder: (context, state) => const LocationView(), path: '/'),
      GoRoute(builder: (context, state) => const HomeView(), path: homeView),
      GoRoute(
        builder: (context, state) => const WelcomeView(),
        path: welcomeView,
      ),
      GoRoute(
        builder: (context, state) => const NavigationView(),
        path: navigationViwe,
      ),
      GoRoute(
        path: explorView,
        builder: (context, state) => const ExplorView(),
      ),
      GoRoute(
        builder: (context, state) => const BookmarkView(),
        path: bookmarkViewhView,
      ),
      GoRoute(
        builder: (context, state) => const WeatherView(),
        path: profileView,
      ),
      GoRoute(path: searchView, builder: (context, state) => SearchView()),
    ],
  );
}
