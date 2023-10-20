import 'package:flutter/material.dart';
import 'package:seoul_select/router/router_context_extension.dart';
import '../../router/route_names.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';
import '../../utils/Const.dart';

class CustomBottomNav extends StatefulWidget {
  final int selectedIndex;
  final Function(int index)? onItemTapped;

  const CustomBottomNav({
    super.key,
    this.selectedIndex = -1,
    this.onItemTapped,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomSheetItem(
            label: Const.HOME_NAV_HOME,
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(0)
                : _defaultOnItemTap(0),
            icon: Icon(
             Icons.home_outlined,
              size: 25,
              color: widget.selectedIndex == 0 ? AppColors.primary : AppColors.textGray2,
            ),
            labelColor: widget.selectedIndex == 0 ? AppColors.primary : AppColors.textGray2,
          ),
          _bottomSheetItem(
            label: Const.HOME_NAV_WISHLIST,
            icon: Icon(
              Icons.favorite_outline,
              size: 25,
              color: widget.selectedIndex == 1 ? AppColors.primary : AppColors.textGray2,
            ),
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(1)
                : _defaultOnItemTap(1),
            labelColor: widget.selectedIndex == 1 ? AppColors.primary : AppColors.textGray2,
          ),
          _bottomSheetItem(
            label: Const.HOME_NAV_BAG,
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(2)
                : _defaultOnItemTap(2),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 25,
                color: widget.selectedIndex == 2
                    ? AppColors.primary : AppColors.textGray2,
              ),
            ),
            labelColor: widget.selectedIndex == 2 ? AppColors.primary : AppColors.textGray2,
          ),
          _bottomSheetItem(
            label: Const.HOME_NAV_MENU,
            onPressed: () => widget.onItemTapped != null
                ? widget.onItemTapped!.call(3)
                : _defaultOnItemTap(3),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Icon(
                Icons.menu_outlined,
                size: 25,
                color: widget.selectedIndex == 3 ? AppColors.primary : AppColors.textGray2,

              ),
            ),
            labelColor: widget.selectedIndex == 3 ? AppColors.primary : AppColors.textGray2,
          ),
        ],
      ),
    );
  }

  Widget _bottomSheetItem({
    required String label,
    required Color labelColor,
    required Widget icon,
    required Function() onPressed,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () => onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 3.0),
                icon,
                const SizedBox(height: 2.0),
                Text(
                  label,
                  style: AppTextStyles.base.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: labelColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _defaultOnItemTap(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
        context.popUntil(RouteNames.bottomNav);
        break;
    }
  }
}
