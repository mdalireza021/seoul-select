import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ButtonShape.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../theme/src/app_colors.dart';

class SignOutDialog extends StatefulWidget {
  const SignOutDialog({
    super.key,
    required this.onClick,
    required this.onCancel,
  });

  final Function() onClick;
  final Function() onCancel;

  @override
  State<SignOutDialog> createState() => _SignOutDialogState();
}

class _SignOutDialogState extends State<SignOutDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: InkWell(
                    onTap: () => widget.onCancel.call(),
                    child: AppIcons.icon(AppIcons.icCancel,
                        size: AppIcons.sizeXSmall),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Are you sure want to",
              style: AppTextStyles.h3,
            )),
            Center(
                child: Text(
              "signout?",
              style: AppTextStyles.h3,
            )),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(flex: 2, child: SizedBox.shrink()),
                Expanded(
                  flex: 6,
                  child: CustomButton(
                    label: "Cancel",
                    shape: ButtonShape.Rounded,
                    onClick: () => widget.onCancel.call(),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox.shrink()),
              ],
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => widget.onClick.call(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,5,10,5),
                  child: Text(
                    "Sign Out",
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
