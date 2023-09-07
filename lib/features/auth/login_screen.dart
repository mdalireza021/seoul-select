import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seoul_select/custom_widgets/ButtonShape.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/custom_textfield.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../theme/src/app_colors.dart';
import '../../utils/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo2.png",
              width: size.width * 0.4,
              height: size.width * 0.4,
              fit: BoxFit.contain,
            ),

            Column(
              children: [
                CustomTextField(
                  labelText: "Email",
                  labelTextColor: AppColors.primary,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z\d@._]'),
                    ),
                  ],
                  onSaved: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email required';
                    }
                    if (!isValidEmailAddress(value)) {
                      return 'Invalid email. Try Again!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                CustomTextField(
                  labelText: "Password",
                  controller: _passwordController,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  onSaved: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password required';
                    }
                    if (value.length < 6) {
                      return 'Invalid password. Try Again!';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: AppColors.white,
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () => print("forgot password"),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text("Forgot Password?"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ///login button
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: "Login",
                        onClick: () {
                          removeFocusFromInputField(context);
                          if (_formKey.currentState?.validate() == true) {
                            _formKey.currentState?.save();
                            print("post form data now");
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                ///orView
                orView(),
                const SizedBox(
                  height: 10,
                ),

                ///social login social
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      shape: ButtonShape.Rounded,
                      svgIcon: SvgPicture.asset(
                        'assets/icons/ic_facebook.svg',
                        color: AppColors.white,
                        width: 15,
                        height: 15,
                      ),
                      label: "Facebook",
                      onClick: () {},
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CustomButton(
                      shape: ButtonShape.Rounded,
                      label: "Google",
                      onClick: () {},
                      svgIcon: SvgPicture.asset(
                        'assets/icons/ic_google.svg',
                        color: AppColors.white,
                        width: 15,
                        height: 15,
                      ),
                      backgroundColor: const Color(0xFFF04336),
                      labelColor: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),

            ///bottom Container
            Column(
              children: [
                /// create account section
                Wrap(
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: AppTextStyles.p7,
                    ),
                    Material(
                      color: AppColors.white,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () => print("create account"),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            "Create Account",
                            style: AppTextStyles.p7.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget orView() {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: Container(
            height: 0.2,
            color: AppColors.primary,
          ),
        ),
      ),
      Text(
        "OR",
        style: AppTextStyles.h3,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: Container(
            height: 0.2,
            color: AppColors.primary,
          ),
        ),
      ),
    ],
  );
}
