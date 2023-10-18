import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/src/app_colors.dart';
import '../theme/src/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? prefixText;
  final bool isPassword;
  final bool? autofocus;
  final IconData iconData;
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
    required this.iconData,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text:'');
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
      focusNode: _focusNode,
      autofocus: widget.autofocus ?? false,
      cursorColor: widget.cursorColor,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        prefixText: widget.prefixText,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0,15,0,0),
          child: Icon(
            widget.iconData,
            color: AppColors.primary,
            size: 25,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
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

      ),
      style: AppTextStyles.p6,
      validator: (value) => widget.validator?.call(value),
      onChanged: (value) => widget.onChanged?.call(value),
      onSaved: (newValue) => widget.onSaved?.call(newValue),
    );
  }
}
