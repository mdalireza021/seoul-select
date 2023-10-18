import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar2({
    super.key,
    this.automaticallyImplyLeading,
    required this.title,
  });

  final String title;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      elevation: 5,
      centerTitle: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(title, style: AppTextStyles.p2.copyWith(
        fontWeight: FontWeight.bold,
      ),),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
