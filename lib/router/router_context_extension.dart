import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';
import 'route_names.dart';

/// Extension on [BuildContext] to simplify navigation
extension RouterContextExtension on BuildContext {
  void backToPreviousPage() {
    GoRouter.of(this).pop();
  }

  void popUntil(String routeName) {
    if (!AppRouter.backStack.contains(routeName)) {
      return;
    }

    while (AppRouter.backStack.last != routeName) {
      GoRouter.of(this).pop();
    }
  }

  void pushProductDetailsScreen() =>
      GoRouter.of(this).pushNamed(
        RouteNames.prodDetails,
      );
}
