import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';

class ScrollViewWithScrollBar extends StatefulWidget {
  final Widget child;
  const ScrollViewWithScrollBar({Key? key, required this.child}) : super(key: key);

  @override
  _ScrollViewWithScrollBarState createState() => _ScrollViewWithScrollBarState();
}

class _ScrollViewWithScrollBarState extends State<ScrollViewWithScrollBar> {
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: AppColors.black,
      radius: const Radius.circular(20),
      thickness: 5.0,
      thumbVisibility: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: widget.child,
      ),
    );
  }
}
