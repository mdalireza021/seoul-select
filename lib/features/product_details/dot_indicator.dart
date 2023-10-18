import 'package:flutter/cupertino.dart';
import 'package:seoul_select/theme/src/app_colors.dart';

class ProductDetailsDotIndicator extends StatelessWidget {
  final int dotsCount;
  final int selectedIndex;

  const ProductDetailsDotIndicator({
    Key? key,
    required this.dotsCount,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (var i = 0; i < dotsCount; i += 1) i].map((index) {
        return selectedIndex == index
            ? const Padding(
          padding: EdgeInsets.all(6.0),
          child: RedDotIndicator(),
        ) :
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: GreyDotIndicator(),
        );
      }).toList(),
    );
  }
}

class RedDotIndicator extends StatelessWidget {
  const RedDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.67,
      height: 10,
      decoration: ShapeDecoration(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class GreyDotIndicator extends StatelessWidget {
  const GreyDotIndicator({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: ShapeDecoration(
        color: const Color(0xFFB0B9C6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    );
  }
}
