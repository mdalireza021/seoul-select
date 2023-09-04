import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title:  AppIcons.icon(AppIcons.icLogo, size: 65, ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
