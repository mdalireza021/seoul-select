import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';

class CartItem extends StatefulWidget {
  final int index;
  const CartItem({super.key, required this.index});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {

    void incrementCount() => setState(() => quantity++);
    void decrementCount() => setState(() => quantity > 1 ? quantity-- : null);

    return Slidable(
      key: Key(widget.index.toString()),
      startActionPane: ActionPane(
        extentRatio: 0.30,
       // motion: const ScrollMotion(),
       // motion: StretchMotion(),
        motion: const BehindMotion(),
        children: [
          SlidableAction(onPressed: (context){
          }, backgroundColor: AppColors.black, borderRadius: const BorderRadius.only(
            topLeft:Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
            icon:Icons.delete,
          ),

        ],
      ),
      child: rootWidget(),
    );

  }

  Widget rootWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 90,
              height: 90,
              child: Image.asset(
                "assets/images/kimchi.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Shin Kimchi Ramen 120g",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                  ),
                ),
                const Text(
                  "Origin: Korea",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "198.00",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                      child: Container(
                        width: 110,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.quickViewButtonShadowColor,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              //onTap: () => decrementCount(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  quantity.toString(),
                                  style: AppTextStyles.p4.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              //onTap: () => incrementCount(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(1, 5, 5, 5),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
