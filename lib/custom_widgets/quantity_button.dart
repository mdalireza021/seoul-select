import 'package:flutter/material.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';

class QuantityButton extends StatelessWidget {
  final int quantity;
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  const QuantityButton({super.key,
    required this.quantity,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.textGray2,
          width: 0.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.quantityButtonColor,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          Material(
            color: const Color(0xFFEEEEEE),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: InkWell(
              onTap: decrementCallback,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 8, 5),
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                quantity.toString(),
                style: AppTextStyles.p4.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          Material(
            color: const Color(0xFFEEEEEE),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: InkWell(
              onTap: incrementCallback,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}