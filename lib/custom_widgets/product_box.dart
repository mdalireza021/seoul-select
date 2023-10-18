import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

class ProductBox extends StatefulWidget {
  const ProductBox({
    super.key,
    required this.onWishListTapped,
    required this.onAddToCartTapped,
    required this.onClick,
  });
  final Function() onClick;
  final Function(int id) onWishListTapped;
  final Function(int id) onAddToCartTapped;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick.call(),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.textGray2,
            width: 0.3,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/ramen.jpg',
                  width: double.infinity,
                  height: 90,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        "Buldak Hot Chicken Flavor Ramen",
                        style: AppTextStyles.p3,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        strutStyle: const StrutStyle(forceStrutHeight: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Weight: 140g",
                        style: AppTextStyles.p10,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///add to bag button
                      InkWell(
                        onTap: () => widget.onAddToCartTapped.call(1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                            child: Text(
                              'Add to Bag',
                              style: AppTextStyles.p10.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "৳",
                            style: AppTextStyles.p1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              '135',
                              style: AppTextStyles.h2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ///wishList button
            Positioned(
              top: 7,
              right: 7,
              child: Material(
                color: AppColors.primary,
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: () => widget.onWishListTapped.call(1),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
