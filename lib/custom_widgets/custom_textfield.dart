import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final String? prefixText;
  final bool isPassword;
  final bool? autofocus;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color enabledBorderColor;
  final Color errorBorderColor;
  final Color focusedBorderColor;
  final Color focusedErrorBorderColor;
  final Color borderColor;
  final Color labelTextColor;
  final Color? cursorColor;
  final Function(String? value)? validator, onChanged, onSaved;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.inputFormatter,
    this.controller,
    this.prefixText,
    this.isPassword = false,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.autofocus,
    this.fillColor = AppColors.white,
    this.enabledBorderColor = AppColors.borderColor,
    this.errorBorderColor = AppColors.red,
    this.focusedBorderColor = AppColors.borderColor,
    this.focusedErrorBorderColor = AppColors.red,
    this.borderColor = AppColors.customBoxBorderColor,
    this.labelTextColor = AppColors.primary,
    this.cursorColor = AppColors.primary,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: _focusNode,
      autofocus: widget.autofocus ?? false,
      cursorColor: widget.cursorColor,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        prefixText: widget.prefixText,
        enabledBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderSide: BorderSide(
            width: 1.0,
            color: widget.labelTextColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderSide: BorderSide(
            color: widget.errorBorderColor,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderSide: BorderSide(
            color: widget.focusedErrorBorderColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
            width: 1.0,
          ),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primary,
                ),
              )
            : null,
        filled: true,
        isDense: true,
        alignLabelWithHint: true,
        prefixStyle: AppTextStyles.p6,
        hintStyle: AppTextStyles.p6.copyWith(
          color: AppColors.textGray,
        ),
        labelStyle: AppTextStyles.p6.copyWith(
          color: widget.labelTextColor,
        ),
        errorStyle: AppTextStyles.p6.copyWith(
          height: 0.5,
          color: AppColors.brickRed,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
      ),
      style: AppTextStyles.p6,
      validator: (value) => widget.validator?.call(value),
      onChanged: (value) => widget.onChanged?.call(value),
      onSaved: (newValue) => widget.onSaved?.call(newValue),
    );
  }
}
