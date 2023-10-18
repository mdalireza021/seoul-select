import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import '../../models/Product.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';

class WishListItem extends StatefulWidget {
  final Product productItem;
  final Function() onCancel;
  final Function() onPress;

  const WishListItem({
    super.key,
    required this.productItem,
    required this.onPress,
    required this.onCancel,
  });

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  @override
  Widget build(BuildContext context) {
    return rootWidget();
  }

  Widget rootWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: AppColors.textGray2,
          width: 0.2,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Material(
              //     color: const Color(0xFFF5F6FA),
              //     clipBehavior: Clip.hardEdge,
              //     borderRadius: BorderRadius.circular(50),
              //     child: InkWell(
              //       onTap: () => widget.onCancel.call(),
              //       child: Padding(
              //         padding: const EdgeInsets.all(7),
              //         child: AppIcons.icon(
              //           AppIcons.icCancel,
              //           size: 12,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Row(
                children: [
                  // const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        widget.productItem.imgUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(
                        //   height: 20,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,10,0,0),
                              child: Text(
                                widget.productItem.title ?? "",
                                style: AppTextStyles.p3,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "Origin: ${widget.productItem.origin}",
                          style: AppTextStyles.p10,
                        ),
                        Text(
                          "৳${widget.productItem.price}",
                          style: AppTextStyles.p3,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
                          child: InkWell(
                            onTap: () => widget.onPress.call(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(4),
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            top: 4,
            right: 4,
            child: Material(
              color: const Color(0xFFF5F6FA),
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () => widget.onCancel.call(),
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: AppIcons.icon(
                    AppIcons.icCancel,
                    size: 12,
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
