import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppShadows {
  static BoxShadow cardShadow = const  BoxShadow(
  color: AppColors.cardShadowColor,
  blurRadius: 10,
  offset: Offset(0, 3),
  spreadRadius: 2,
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
