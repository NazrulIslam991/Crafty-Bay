import 'package:crafty_bay/features/auth/presentaion/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentaion/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  static const String name =
      '/otp_screen'; /////////////////////////////////////////

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();
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
                Text("OTP_Headline".tr, style: textTheme.titleLarge),
                Text("OTP_subHeadLine".tr, style: textTheme.bodySmall),
                const SizedBox(height: 55),

                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  controller: _otpController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),

                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => _onTapOTP_verify(),
                  child: Text('OTP_Button'.tr),
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

  void _onTapOTP_verify() {}
  void _onTapBackSignInButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (p) => false);
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
