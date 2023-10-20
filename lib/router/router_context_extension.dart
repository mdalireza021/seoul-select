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

  void replaceHome({
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
  }) {
    GoRouter.of(this).pushReplacementNamed(
      RouteNames.bottomNav,
      extra: extra,
    );
  }

  void pushFaqsScreen() => GoRouter.of(this).pushNamed(
    RouteNames.faq,
  );
  void pushPrivacyPolicyScreen() => GoRouter.of(this).pushNamed(
    RouteNames.privacyPolicy,
  );
  void pushAboutUsScreen() => GoRouter.of(this).pushNamed(
    RouteNames.aboutUs,
  );
  void pushOrderConfirmScreen() => GoRouter.of(this).pushNamed(
    RouteNames.orderConfirmScreen,
  );

}
