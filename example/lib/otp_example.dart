import 'package:flutter/material.dart';
import 'package:widget_toolkit/otp.dart';

class OtpExample extends StatelessWidget {
  const OtpExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SmsCodeProvider(
        sentNewCodeActivationTime: 2,
        smsCodeService: FakeSmsCodeService(),
        builder: (state) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 24,
            children: [
              SmsCodeField(),
              ResendCodeButton(
                onPressed: () {
                  print('Resend code button pressed');
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Service used to implement SMS code logic
class FakeSmsCodeService implements SmsCodeService {
  /// Confirm if the entered code is equal to the last send code
  @override
  Future<dynamic> confirmPhoneCode(String code) async {
    return code == '0000' ? true : throw Exception();
  }

  /// Get user's phone number with the country code
  @override
  Future<String> getFullPhoneNumber() async => '+38164 1234567';

  /// Edit the user's phone number and return fullPhoneNumber
  @override
  Future<String> updatePhoneNumber(String newNumber) async => '+38164 1234567';

  /// Send a new code to the user
  @override
  Future<bool> sendConfirmationSms(String usersPhoneNumber) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  /// How long codes will be valid in seconds
  @override
  Future<int> getValidityTime(bool reset) async => 30;

  /// How long the resendCode button will be disabled after a code has been sent
  @override
  Future<int> getResendButtonThrottleTime(bool reset) async => 15;

  /// How many characters the code has
  @override
  Future<int> getCodeLength() async => 4;
}
