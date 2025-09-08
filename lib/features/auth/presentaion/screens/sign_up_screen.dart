import 'package:crafty_bay/features/auth/presentaion/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name =
      '/sign_up'; /////////////////////////////////////////

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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
                const SizedBox(height: 24),
                AppLogo(width: 80),
                const SizedBox(height: 12),
                Text("SignUp_Headline".tr, style: textTheme.titleLarge),
                Text("SignUp_subHeadLine".tr, style: textTheme.bodySmall),
                const SizedBox(height: 25),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email".tr),
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "First_Name".tr),
                  textInputAction: TextInputAction.next,
                  controller: _firstNameController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "Last_Name".tr),
                  textInputAction: TextInputAction.next,
                  controller: _lastNameController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mobile".tr),
                  textInputAction: TextInputAction.next,
                  controller: _mobileController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "Address".tr),
                  textInputAction: TextInputAction.next,
                  controller: _addressController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password".tr),
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => _onTapSignUpButton(),
                  child: Text('SignUp_Button'.tr),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => _onTapBackSignInButton(),
                  child: Text('BackTo_login'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOTPScreen.name);
  }

  void _onTapBackSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
