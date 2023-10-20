import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seoul_select/features/menu/local/about_us_screen.dart';
import 'package:seoul_select/features/menu/local/privacy_policy_screen.dart';
import 'package:seoul_select/features/order_confirm/order_confirm_screen.dart';
import 'package:seoul_select/features/product_details/product_details_screen.dart';
import '../features/bottom_nav/bottom_nav_screen.dart';
import '../features/menu/local/faqs_screen.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter() {
    appRouter = _getAppRouter();
  }

  /// Use this for testing to change the initial
  /// location and quickly access some page
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  late GoRouter appRouter;
  static String initialLocation = RoutePaths.bottomNav;
  static List<String> backStack = [];

  GoRouter _getAppRouter() => GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    observers: [
      MyNavigatorObserver(),
    ],
    // errorBuilder: (context, state) => const NotFoundPage(),
    routes: [
      GoRoute(
        path: RoutePaths.bottomNav,
        name: RouteNames.bottomNav,
        builder: (context, state) => const BottomNavScreen(),
      ),

      GoRoute(
        path: RoutePaths.prodDetails,
        name: RouteNames.prodDetails,
        builder: (context, state) => const ProductDetailsScreen(),
      ),

      GoRoute(
        path: RoutePaths.orderConfirmScreen,
        name: RouteNames.orderConfirmScreen,
        builder: (context, state) => const OrderConfirmScreen(),
      ),
      GoRoute(
        path: RoutePaths.faq,
        name: RouteNames.faq,
        builder: (context, state) => const FaqsScreen(),
      ),
      GoRoute(
        path: RoutePaths.aboutUs,
        name: RouteNames.aboutUs,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: RoutePaths.privacyPolicy,
        name: RouteNames.privacyPolicy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
    ],
  );
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppRouter.backStack.add(route.settings.name ?? '');
     log('did push route ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppRouter.backStack.removeLast();
     log('did pop route ${route.settings.name}');
  }
}