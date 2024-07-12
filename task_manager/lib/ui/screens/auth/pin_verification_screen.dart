import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/screens/auth/reset_password_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  bool _otpVerificationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 digits verification pin has been sent to your email address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  _buildPinCodeTextField(),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: _otpVerificationInProgress == false,
                    replacement: const CenteredProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapVerifyOtpButton,
                      child: const Text('Verify'),
                    ),
                  ),
                  const SizedBox(height: 36),
                  _buildSignInSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
          text: "Have account? ",
          children: [
            TextSpan(
              text: 'Sign in',
              style: const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.themeColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }

  void _onTapVerifyOtpButton() {
    _verifyOtp(_pinTEController.text);
  }

  Future<void> _verifyOtp(String otp) async {
    _otpVerificationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.verifyOtp(widget.email, otp));
    _otpVerificationInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess && response.responseData['status'] == 'success') {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(
              email: widget.email,
              otp: otp,
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Otp verification failed! Try again');
      }
    }
  }
}
