import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seoul_select/features/product_details/product_details_screen.dart';
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
  static String initialLocation = RoutePaths.splash;
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
        path: RoutePaths.prodDetails,
        name: RouteNames.prodDetails,
        builder: (context, state) => const ProductDetailsScreen(),
      ),

    ],
  );
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppRouter.backStack.add(route.settings.name ?? '');
    // log('did push route ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppRouter.backStack.removeLast();
    // log('did pop route ${route.settings.name}');
  }
}