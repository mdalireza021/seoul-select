import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';

class ButtonApplyPromoCode extends StatefulWidget {
  final String labelText;
  final Color buttonColor;
  final Function onClick;
  final bool showLoader;

  const ButtonApplyPromoCode({
    Key? key,
    required this.labelText,
    required this.buttonColor,
    required this.onClick,
    this.showLoader = false,
  }) : super(key: key);

  @override
  State<ButtonApplyPromoCode> createState() => _ButtonApplyPromoCodeState();
}

class _ButtonApplyPromoCodeState extends State<ButtonApplyPromoCode> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.showLoader ? null : widget.onClick.call(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Set border radius here
        ),
      ),
      child: _label(),
    );
  }

  Widget _label() => Stack(
    children: [
      Visibility(
        visible: !widget.showLoader,
        child: FittedBox(
          child: Text(
            widget.labelText,
            maxLines: 1,
            style: AppTextStyles.p8.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      if (widget.showLoader)
        Platform.isAndroid
            ? Transform.scale(
          scale: 0.5,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.white,
          ),
        )
            : const CupertinoActivityIndicator(
          color: AppColors.white,
        ),
    ],
  );
}
