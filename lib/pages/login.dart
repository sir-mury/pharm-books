import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:pharm_books/controllers/auth_controller.dart';
import 'package:pharm_books/utils/responsive.dart';
import 'package:pharm_books/widgets/buttons.dart';
import 'package:pharm_books/widgets/drawer_widget.dart';
import 'package:pharm_books/widgets/text_input.dart';

import '../consts/color_const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String? email;
    String? password;
    return Container(
      color: ColorConst.primary.withValues(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isDesktop(context)) {
            return buildDesktopLogin(
              context: context,
              emailController: emailController,
              passwordController: passwordController,
              email: email,
              password: password,
              authController: authController,
            );
          } else {
            return buildDesktopLogin(
              context: context,
              emailController: emailController,
              passwordController: passwordController,
              email: email,
              password: password,
              authController: authController,
            );
          }
        },
      ),
    );
  }

  Widget buildDesktopLogin({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String? email,
    required String? password,
    required AuthController authController,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorConst.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 200, height: 50, color: ColorConst.primary),
              const SizedBox(height: 20),
              Text(
                "Welcome, User!",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth * 0.45,
                height: screenHeight * 0.15,
                child: StandardTextInput(
                  controller: emailController,
                  onChanged: (val) {},
                  hintText: "Enter Email",
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!value!.isEmail) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  width: screenWidth * 0.45,
                  height: screenHeight * 0.15,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconTextInput(
                          atBeginning: false,
                          obscureText: authController.isObscure.value,
                          controller: passwordController,
                          onChanged: (val) {},
                          hintText: "",
                          keyboardType: TextInputType.visiblePassword,
                          label: "Password",
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!value!.isEmail) {
                              return "Invalid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          SizedBox(height: screenHeight * 0.052),
                          TertiaryIconButton(
                            onPressed: () {
                              authController.toggleObscure();
                            },
                            backgroundColor: ColorConst.primary.withValues(
                              alpha: 0.5,
                            ),
                            tooltip: authController.isObscure.value
                                ? "Show Password"
                                : "Hide Password",
                            icon: authController.isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth * 0.45,
                child: PrimaryButton(onPressed: () {}, data: "Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
