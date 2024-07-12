import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen(
      {super.key, required this.email, required this.otp});

  final String email, otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _resetPasswordInProgress = false;

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
                    'Set Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Minimum length of password should be more than 6 letters and, combination of numbers and letters',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration:
                        const InputDecoration(hintText: 'Confirm Password'),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: _resetPasswordInProgress == false,
                    replacement: const CenteredProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapConfirmButton,
                      child: const Text('Confirm'),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                        text: "Haven account? ",
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: const TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }

  void _onTapConfirmButton() {
    _resetPassword(_passwordTEController.text);
  }

  Future<void> _resetPassword(String password) async {
    _resetPasswordInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> inputParams = {
      "email": widget.email,
      "OTP": widget.otp,
      "password": password,
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.resetPassword, body: inputParams);
    _resetPasswordInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Reset password! Try Login now.');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
          (route) => false,
        );
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Reset password failed! Try again');
      }
    }
  }

  @override
  void dispose() {
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
