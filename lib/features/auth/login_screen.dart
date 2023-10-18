import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:seoul_select/custom_widgets/ButtonShape.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/custom_textfield.dart';
import 'package:seoul_select/features/auth/controllers/Login_controller.dart';
import 'package:seoul_select/features/auth/signup_screen.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../main.dart';
import '../../theme/src/app_colors.dart';
import '../../utils/ApiResponse.dart';
import '../../utils/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(child: Obx(() => rootView())),
    );
  }

  Widget rootView() {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/logo2.png",
                width: size.width * 0.4,
                height: size.width * 0.4,
                fit: BoxFit.contain,
              ),

              Spacer(),
              Column(
                children: [
                  CustomTextField(
                    labelText: "Email",
                    iconData: Icons.email,
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
                  const SizedBox(height: 10),

                  CustomTextField(
                    labelText: "Password",
                    iconData: Icons.lock,
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Material(
                        color: AppColors.white,
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () => print("forgot password"),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text("Forgot Password?"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///login button
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          label: "Login",
                          showLoader:
                              _controller.rxLoginResponse.value.status ==
                                  Status.LOADING,
                          //showLoader: true,
                          onClick: () {
                            removeFocusFromInputField(context);
                            if (_formKey.currentState?.validate() == true) {
                              _formKey.currentState?.save();
                              print("post form data now");
                            }
                           _controller.postLogin("fdfdsf", "ffdsf");

                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //     builder: (context) => const MainScreen(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              Spacer(),
              ///bottom Container
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
                      onTap: () => {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        ),
                      },
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
        ),
      ),
    );
  }
}

