import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seoul_select/custom_widgets/ButtonShape.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/custom_textfield.dart';
import 'package:seoul_select/features/auth/login_screen.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../theme/src/app_colors.dart';
import '../../utils/utility.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Material(
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
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
                        ///name
                        CustomTextField(
                          labelText: "Name",
                          iconData: Icons.person,
                          labelTextColor: AppColors.primary,
                          focusedBorderColor: AppColors.primary,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          onSaved: (value) {
                            ///value
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        ///email
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
                            ///value
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

                        ///phone
                        CustomTextField(
                          labelText: "Phone",
                          iconData: Icons.call,
                          labelTextColor: AppColors.primary,
                          focusedBorderColor: AppColors.primary,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'\d'),
                            ),
                          ],
                          onSaved: (value) {
                            ///value
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone no.required';
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
                            ///value
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
                        const SizedBox(height: 20),

                        ///signup button
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                label: "Sign Up",
                                onClick: () {
                                  removeFocusFromInputField(context);
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    _formKey.currentState?.save();

                                    ///post form data now
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    ///bottom Container
                    Wrap(
                      children: [
                        Text(
                          "Already have an Account? ",
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
                                  builder: (context) => const LoginScreen(),
                                ),
                              ),
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                "Login",
                                style: AppTextStyles.p7.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
