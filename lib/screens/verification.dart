import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../widgets/submit_and_verify_button.dart';
import '../widgets/join_us.dart';

class Verification extends StatelessWidget {
  static String enterdOtp = "";

  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50.0, bottom: 75.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "Verify Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              otpCard(context),
              const SubmitAndVerifyButton(name: "Verify"),
              const Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const JoinUs(),
              const Text(
                "GUEST",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        elevation: 0,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              width: 200.0,
              child: Text('Please enter verification code sent to your mobile'),
            ),
            const SizedBox(height: 20.0),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                focusBorderColor: Colors.black,
              ),
              onChanged: (value) {
                Verification.enterdOtp = value;
              },
            ),
          ]),
        ),
      ),
    );
  }
}
