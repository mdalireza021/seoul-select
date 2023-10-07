import 'package:flutter/material.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';

class QuantityButton extends StatelessWidget {
  final int quantity;
  final VoidCallback incrementCallback;
  final VoidCallback decrementCallback;

  const QuantityButton({
    super.key,
    required this.quantity,
    required this.incrementCallback,
    required this.decrementCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Material(
            color: AppColors.primary,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: () => decrementCallback.call(),
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
                    Icons.remove,
                    size: 18,
                    color: Colors.white,
                  ),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Material(
            color: AppColors.primary,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: () => incrementCallback.call(),
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
                    Icons.add,
                    size: 18,
                    color: Colors.white,
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