import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

class ProductBox extends StatefulWidget {
  const ProductBox(
      {super.key,
      required this.onWishListTapped,
      required this.onAddToCartTapped,});
  final Function(int id) onWishListTapped;
  final Function(int id) onAddToCartTapped;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 300,
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
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          "Buldak Hot Chicken Flavor Ramen",
                          style: AppTextStyles.p3,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Origin: Korea",
                      style: AppTextStyles.p10,
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
                    InkWell(
                      onTap: ()=> widget.onAddToCartTapped.call(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                          child: Text(
                            'Add to Cart',
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
          Positioned(
            top: 7,
            right: 7,
            child:

                ///favourite button
                Material(
              color: AppColors.primary,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: ()=> widget.onWishListTapped.call(1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: AppColors.textGray2,
                      width: 0.2,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Icon(
                      Icons.favorite_border,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
