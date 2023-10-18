import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';
import 'ButtonShape.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onClick;
  final ButtonShape? shape;
  final Color? backgroundColor;
  final Color? labelColor;
  final SvgPicture? svgIcon;
  final bool showLoader;
  final double height;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onClick,
    this.svgIcon,
    this.shape,
    this.backgroundColor,
    this.labelColor,
    this.showLoader = false,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var btnRadius;

    if (shape == null || shape == ButtonShape.Standard) {
      btnRadius = BorderRadius.circular(10);
    } else if (shape == ButtonShape.Rounded) {
      btnRadius = BorderRadius.circular(50);
    } else if (shape == ButtonShape.RoundedTop) {
      btnRadius = const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      );
    } else if (shape == ButtonShape.RoundedTopLeft) {
      btnRadius = const BorderRadius.only(
        topLeft: Radius.circular(18),
      );
    } else if (shape == ButtonShape.RoundedTopRight) {
      btnRadius = const BorderRadius.only(
        topRight: Radius.circular(18),
      );
    }

    return ElevatedButton(
        onPressed: () => showLoader ? null : onClick(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: btnRadius,
          ),
          tapTargetSize: shape == ButtonShape.RoundedTop
              ? MaterialTapTargetSize.shrinkWrap
              : null,
        ),
        child: Container(
          height: height,
          child: Center(
            child: svgIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        svgIcon!,
                        const SizedBox(width: 10.0),
                        _label(),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _label(),
                  ),
          ),
        ));
  }

  Widget _label() => Stack(
        children: [
          Visibility(
            visible: !showLoader,
            child: Text(
              label,
              style: AppTextStyles.p3.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: labelColor ?? AppColors.background,
              ),
            ),
          ),
          if (showLoader)
            Platform.isAndroid
                ? Transform.scale(
                    scale: 0.6,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: labelColor ?? AppColors.white,
                    ),
                  )
                : CupertinoActivityIndicator(
                    color: labelColor ?? AppColors.white,
                  ),
        ],
      );
}
