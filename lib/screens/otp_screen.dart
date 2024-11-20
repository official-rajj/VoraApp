import 'dart:async'; // For using Timer
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voraapp/screens/welcome_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  void verifyOTP() async {
    String otp = _otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("OTP verification is done"),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (Route<dynamic> route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registered Successfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("OTP doesn't match"),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${e.message}"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  int timerCountdown = 29;
  late Timer _timer;

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCountdown > 0) {
        setState(() {
          timerCountdown--;
        });
      } else {
        _timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 196, 15),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 196, 15),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Verification Code',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'We Sent a Code',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please enter the verification code that we have sent to your Phone number.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            const SizedBox(height: 45),
            _TextField(),
            const SizedBox(height: 30),
            Text(
              timerCountdown > 0
                  ? "Didn't receive code?\n($timerCountdown)"
                  : "Didn't receive code?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                verifyOTP();
                //Show SnackBar with success message
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text("Registered Successfully"),
                //     duration: Duration(seconds: 2),
                //   ),
                // );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const WelcomeScreen(),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.yellow, fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _TextField() {
    return TextField(
      controller: _otpController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 6,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide.none,
        ),
        counterText: '',
        hintText: 'Enter 6-digit OTP',
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
