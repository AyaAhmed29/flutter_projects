import 'package:ecommerce_app/features/auth/view/login_view.dart';
import 'package:ecommerce_app/features/auth/view/register_view.dart';
import 'package:ecommerce_app/features/checkout/cubit/order/cubit/order_cubit.dart';
import 'package:ecommerce_app/features/checkout/location/view/location_view.dart';
import 'package:ecommerce_app/features/checkout/view/checkout_view.dart';
import 'package:ecommerce_app/features/checkout/view/place_order_view.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:ecommerce_app/features/home/view/search_view.dart';
import 'package:ecommerce_app/features/home/view/widgets/search_widget.dart';
import 'package:ecommerce_app/features/items/view/items_view.dart';
import 'package:ecommerce_app/features/items/view/product_view.dart';
import 'package:ecommerce_app/features/navigation/view/navigation_view.dart';
import 'package:ecommerce_app/features/onboarding/presentation/view/get_started_view.dart';
import 'package:ecommerce_app/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:ecommerce_app/features/profile/view/my_profile_view.dart';
import 'package:ecommerce_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingView = '/OnBoardingView';
  static const getStartedView = '/GetStartedView';
  static const registerView = '/RegisterView';
  static const loginView = '/LoginView';
  static const homeView = '/HomeView';
  static const navigationView = '/NavigationView';
  static const itemsView = '/ItemsView';
  static const productView = '/ProductView';
  static const myProfileView = '/MyProfileView';
  static const searchView = '/SearchView';
  static const checkoutView = '/CheckoutView';
  static const placeOrderView = '/PlaceOrderView';
  static const locationView = '/locationView';

  static const String ordersView = '/OrdersView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const NavigationView()),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: getStartedView,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: navigationView,
        builder: (context, state) => const NavigationView(),
      ),
      GoRoute(path: itemsView, builder: (context, state) => const ItemsView()),
      GoRoute(
        path: productView,
        builder: (context, state) => const ProductView(),
      ),
      GoRoute(
        path: myProfileView,
        builder: (context, state) => const MyProfileView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: checkoutView,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: placeOrderView,
        builder: (context, state) => const PlaceOrderView(),
      ),

      GoRoute(
        path: locationView,
        builder: (context, state) => const LocationView(),
      ),
      // GoRoute(
      //   path: ordersView,
      //   builder: (context, state) => const OrdersView(),
      // ),
    ],
  );
}
