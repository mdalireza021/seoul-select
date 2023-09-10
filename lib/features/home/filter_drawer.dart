import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import '../../theme/src/app_colors.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Clear All",
                    labelColor: AppColors.textGray,
                    backgroundColor: AppColors.white,
                    onClick: () {},
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: CustomButton(
                    label: "Apply",
                    backgroundColor: AppColors.primary,
                    onClick: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
