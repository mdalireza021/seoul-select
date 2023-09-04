import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppShadows {
  static BoxShadow primary = BoxShadow(
    color: AppColors.primaryDark.withOpacity(0.2),
    blurRadius: 20,
    spreadRadius: -20,
    offset: const Offset(0, 10),
  );

  static BoxShadow cardShadow = const BoxShadow(
    color: AppColors.cardShadow,
    blurRadius: 1,
    offset: Offset(0, 1),
    spreadRadius: 0,
  );

  static BoxShadow productBoxButtonShadow = const BoxShadow(
    color: Color(0x26000000),
    blurRadius: 3,
    offset: Offset(1, 1),
    spreadRadius: 0,
  );

  static BoxShadow productBoxShadow = const BoxShadow(
    color: Color(0x0C000000),
    blurRadius: 4,
    offset: Offset(0, 4),
    spreadRadius: 1,
  );
}
