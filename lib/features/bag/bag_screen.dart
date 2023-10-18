import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar.dart';
import '../../custom_widgets/CustomButton.dart';
import '../../custom_widgets/apply_promocode/InputFieldWithButton.dart';
import '../../models/Product.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_icons.dart';
import '../../theme/src/app_text_styles.dart';
import '../../utils/Const.dart';
import 'product_item.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final double price = 0;
  bool isCheckedAll = false;
  int totalSelectedItem = 0;
  final List<Product> products = [
    Product(
      id: 1,
      title: "Shin Kimchi Ramen 120gm",
      imgUrl: "assets/images/kimchi.png",
      origin: "Korea",
      quantity: 1,
      price: 198,
    ),
    Product(
      id: 2,
      title: "Bibigo Kimbap Kim 20gm",
      imgUrl: "assets/images/bibigo-kimpap-kim.png",
      origin: "Korea",
      quantity: 1,
      price: 240,
    ),
    Product(
      id: 3,
      title: "Shrimp Flavoured Chips 75gm",
      imgUrl: "assets/images/shrimp-flavoured-chips.png",
      origin: "Korea",
      quantity: 1,
      price: 200,
    ),
    Product(
      id: 4,
      title: "Fresh Udon 200gm",
      imgUrl: "assets/images/samlip-fresh-udon.png",
      origin: "Korea",
      quantity: 1,
      price: 145,
    ),
    Product(
      id: 5,
      title: "Fresh Udon 200gm",
      imgUrl: "assets/images/samlip-fresh-udon.png",
      origin: "Korea",
      quantity: 1,
      price: 145,
    ),
    Product(
      id: 6,
      title: "Fresh Udon 200gm",
      imgUrl: "assets/images/samlip-fresh-udon.png",
      origin: "Korea",
      quantity: 1,
      price: 145,
    ),
  ];

  double calculateTotalPrice(List<Product> products) {
    double totalPrice = 0;
    for (var product in products) {
      totalPrice += (product.price * product.quantity);
    }
    return totalPrice;
  }

  _deleteItem(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: products.isNotEmpty ? rootWidget() : emptyWidget(),
    );
  }

  Widget emptyWidget() {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcons.icon(
            AppIcons.icBag,
            size: AppIcons.sizeMedium,
            color: AppColors.primary,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Your Bag is",
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Empty",
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 4,
                  child: CustomButton(
                    label: "Shop now",
                    backgroundColor: AppColors.primary,
                    onClick: () {},
                  )),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget rootWidget() {
    return Column(
      children: [
        Expanded(
          child: ScrollViewWithScrollBar(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 6),
                      child: ProductItem(
                        productItem: products[index],
                        onDelete: () => _deleteItem(index),
                      ),
                    );
                  },
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///apply promoCode
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: InputFieldWithButton(
                              hintText: Const.promoCode,
                              buttonLabelText: Const.apply,
                              showLoader: false,
                              buttonColor: AppColors.primary,
                              callback: (a) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                ///subtotal, shipping & bag total
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: AppColors.textGray,
                        width: 0.1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0C000000),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal:",
                              style: AppTextStyles.p3,
                            ),
                            Text(
                              "৳${calculateTotalPrice(products)}",
                              style: AppTextStyles.p3,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping:",
                                style: AppTextStyles.p3,
                              ),
                              Text(
                                "৳49",
                                style: AppTextStyles.p3,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price:",
                              style: AppTextStyles.p3,
                            ),
                            const Spacer(),
                            products.length > 1
                                ? Text(
                                    "(${products.length} items) ",
                                    style: AppTextStyles.p3.copyWith(
                                      color: const Color(0xFF888888),
                                      height: 2.08,
                                    ),
                                  )
                                : Text(
                                    "(1 item) ",
                                    style: AppTextStyles.p3.copyWith(
                                      color: const Color(0xFF888888),
                                      height: 2.08,
                                    ),
                                  ),
                            Text(
                              "৳${calculateTotalPrice(products) + 49}",
                              style: AppTextStyles.p3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// end of subtotal, shipping & bag total
        ///

        // Padding(
        //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       products.length > 1
        //           ? Text(
        //               'Total (${products.length} items) :',
        //               style: AppTextStyles.p3.copyWith(
        //                 color: const Color(0xFF888888),
        //                 height: 2.08,
        //               ),
        //             )
        //           : Text(
        //               'Total (${products.length} item) :',
        //               style: AppTextStyles.p3.copyWith(
        //                 color: const Color(0xFF888888),
        //                 height: 2.08,
        //               ),
        //             ),
        //       Text(
        //         '৳${calculateTotalPrice(products).toString()}',
        //         style: AppTextStyles.h3.copyWith(
        //           fontSize: 20,
        //           height: 2.08,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
          color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              //     child: CustomButton(
              //         //showLoader: true,
              //         label: "Proceed to Checkout",
              //         backgroundColor: Colors.black,
              //         onClick: () {}),
              //   ),
              // ),

              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() => isCheckedAll = !isCheckedAll),
                      child: AppIcons.icon(
                        isCheckedAll ? AppIcons.icCheck : AppIcons.icUncheck,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "All",
                        style: AppTextStyles.p1Bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BDT 143.22",
                        style: AppTextStyles.p3,
                      ),
                      CustomButton(
                        //showLoader: true,
                        label: "Checkout($totalSelectedItem)",
                        backgroundColor: Colors.black,
                        onClick: () {},
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
