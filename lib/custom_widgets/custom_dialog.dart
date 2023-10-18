import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });
  final String title;
  final String content;
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
      return CupertinoAlertDialog(
        title: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.black,
              size: 40.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: AppTextStyles.p1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              onPressed();
            },
            child: Text(
              buttonText,
              style: const TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      );
  }
}
