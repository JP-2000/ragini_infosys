import '../screens/verification.dart';
import '../network/otp.dart';
import '../screens/homepage.dart';
import '../screens/login.dart';
import 'package:flutter/material.dart';

class SubmitAndVerifyButton extends StatefulWidget {
  final String name;
  const SubmitAndVerifyButton({super.key, required this.name});

  @override
  State<SubmitAndVerifyButton> createState() => _SubmitAndVerifyButtonState();
}

class _SubmitAndVerifyButtonState extends State<SubmitAndVerifyButton> {
  bool _isLoading = false;

  void fireOtp(BuildContext context) {
    if (Login.usernameController.text == "8108017849") {
      Otp.getOtp(Login.usernameController.text).then((value) {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Verification()),
        );
      });
    } else {
      debugPrint("Invalid Username");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Username"),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> verifyOtp() async {
    Otp.verifyOtp(Verification.enterdOtp, Login.usernameController.text)
        .then((isOtpValid) {
      setState(() {
        _isLoading = false;
      });
      if (isOtpValid) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Homepage()));
      } else {
        debugPrint("Invalid or expired OTP");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid or expired OTP"),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An Error Occurrred"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.red,
          ))
        : InkWell(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              elevation: 8.0,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            onTap: () async {
              if (widget.name == "Submit") {
                setState(() {
                  _isLoading = true;
                });
                fireOtp(context);
              } else if (widget.name == "Verify") {
                setState(() {
                  _isLoading = true;
                });
                verifyOtp();
              }
            },
          );
  }
}
