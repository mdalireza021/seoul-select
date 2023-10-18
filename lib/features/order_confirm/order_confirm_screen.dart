import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar.dart';
import '../../custom_widgets/CustomButton.dart';
import '../../custom_widgets/apply_promocode/InputFieldWithButton.dart';
import '../../custom_widgets/custom_appbar2.dart';
import '../../models/Product.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_icons.dart';
import '../../theme/src/app_text_styles.dart';
import '../../utils/Const.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({super.key});

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: "Order Confirm",
      ),
      body: rootWidget(),
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
                              "",

                              ///"৳${calculateTotalPrice(products)}",
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
                            10 > 1
                                ? Text(
                                    "(${10} items) ",
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
                              "৳${10 + 49}",
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

        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: AppTextStyles.p6,),
                  Text("BDT 1280",style: AppTextStyles.p6,),
                ],
              ),
              Row(
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
                    child: CustomButton(
                      label: "Place order",
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
