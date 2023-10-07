import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seoul_select/custom_widgets/quantity_button.dart';
import 'package:seoul_select/models/Product.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';

class ProductItem extends StatefulWidget {
  final Product productItem;

  final Function() onDelete;

  const ProductItem({
    super.key,
    required this.onDelete,
    required this.productItem,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1;

  void incrementCount() => setState(() => quantity++);
  void decrementCount() => setState(() => quantity > 1 ? quantity-- : null);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.productItem.id.toString()),
      startActionPane: ActionPane(
        extentRatio: 0.30,

        motion: const ScrollMotion(),
        //motion: StretchMotion(),
        //motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => widget.onDelete.call(),
            backgroundColor: AppColors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            icon: Icons.delete,
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
          )),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
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
                Text(
                  widget.productItem.title,
                  style: AppTextStyles.p3,
                ),
                Text(
                  "Origin: ${widget.productItem.origin}",
                  style: AppTextStyles.p10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "৳${widget.productItem.price}",
                      style: AppTextStyles.p3,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                      child: QuantityButton(
                        quantity: quantity,
                        incrementCallback: () => incrementCount(),
                        decrementCallback: () => decrementCount(),
                      ),
                    ),
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
