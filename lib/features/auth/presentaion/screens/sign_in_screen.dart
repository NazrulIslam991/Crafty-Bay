import 'package:crafty_bay/features/auth/presentaion/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name =
      '/sign_in'; /////////////////////////////////////////

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 80),
                AppLogo(width: 100),
                const SizedBox(height: 12),
                Text("Login_Headline".tr, style: textTheme.titleLarge),
                Text("Login_subHeadLine".tr, style: textTheme.bodySmall),
                const SizedBox(height: 25),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email".tr),
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password".tr),
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => _onTapLoginButton(),
                  child: Text('Login_Button'.tr),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => _onTapSignUpButton(),
                  child: Text('SignUp_Button'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {}
  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
