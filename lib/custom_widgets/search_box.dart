import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextChanged;
  final Function() onClick;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onTextChanged,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 3, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFB9BDCC),
        ),
        color: const Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onTextChanged,
                style: AppTextStyles.p7,
                cursorColor: AppColors.primary,
                decoration: const InputDecoration(
                  hintText: 'I\'m shopping for...',
                  border: InputBorder.none,
                ),
              ),
            ),
            Material(
              color: AppColors.primary,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: ()=> onClick.call(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                  child: AppIcons.icon(
                    AppIcons.icSearch,
                    color: AppColors.white,
                    size: AppIcons.sizeSmall,
                  ),
                ),
              ),
            ),
          ],
      )
    );
  }
}
