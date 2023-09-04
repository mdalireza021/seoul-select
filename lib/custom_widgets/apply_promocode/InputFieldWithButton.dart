import 'package:flutter/material.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_text_styles.dart';
import 'button_apply_promocode.dart';

class InputFieldWithButton extends StatefulWidget {
  final String hintText;
  final String buttonLabelText;
  final Color buttonColor;
  final bool showLoader;
  final Function(String value) callback;

  const InputFieldWithButton({
    Key? key,
    required this.hintText,
    required this.buttonLabelText,
    required this.buttonColor,
    required this.callback,
    required this.showLoader,
  }) : super(key: key);

  @override
  State<InputFieldWithButton> createState() => _InputFieldWithButtonState();
}

class _InputFieldWithButtonState extends State<InputFieldWithButton> {
  final TextEditingController _controller = TextEditingController();
  late bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
      color: const Color(0xFFF3F3F3),
              border: Border.all(
                width: 0.50,
                color: const Color(0xFFDBDADF),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _controller,
                    cursorColor: AppColors.black,
                    style: AppTextStyles.p6,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,5,0),
                    child: ButtonApplyPromoCode(
                      onClick: () => widget.callback(_controller.text),
                      buttonColor: widget.buttonColor,
                      labelText: widget.buttonLabelText,
                      showLoader: widget.showLoader,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: showError,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 1, 2, 0),
                child: Wrap(
                  children: [
                    Text("",
                      style: AppTextStyles.p6.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
