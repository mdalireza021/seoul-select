import 'package:flutter/material.dart';
import '../../custom_widgets/CustomButton.dart';
import '../../custom_widgets/apply_promocode/InputFieldWithButton.dart';
import '../../theme/src/app_colors.dart';
import '../../utils/Const.dart';
import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.fromLTRB(15,10,15,0),
                  child: CartItem(index: index,),
                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputFieldWithButton(
                    hintText: Const.promoCode,
                    buttonLabelText: Const.apply,
                    showLoader: false,
                    buttonColor: AppColors.black,
                    callback: (a) {},
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total (3 item) :',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 2.08,
                  ),
                ),
                Text(
                  '\$500',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 2.08,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: CustomButton(
                      //showLoader: true,
                      label: "Proceed to Checkout",
                      backgroundColor: Colors.black,
                      onClick: () {}),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
