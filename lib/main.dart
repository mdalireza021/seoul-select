import 'package:flutter/material.dart';
import 'package:seoul_select/router/app_router.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (_) => 'SeoulSelect',
      debugShowCheckedModeBanner: false,
      routerDelegate: router.appRouter.routerDelegate,
      routeInformationParser: router.appRouter.routeInformationParser,
      routeInformationProvider: router.appRouter.routeInformationProvider,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.white,
        ),
        //useMaterial3: true,
      ),
      builder: (context, child) {
        return SafeArea(child: child ?? const SizedBox.shrink());
      },
    );
  }
}

