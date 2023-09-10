import 'package:flutter/material.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFB9BDCC),
        ),
        color: const Color(0xFFF3F4F5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        onChanged: onTextChanged,
        style: AppTextStyles.p7,
        cursorColor: AppColors.primary,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
