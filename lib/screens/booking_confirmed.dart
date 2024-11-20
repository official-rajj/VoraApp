import 'dart:async';
import 'package:flutter/material.dart';
import 'package:voraapp/screens/dashboard_screen.dart';

class BookingConfirmed extends StatefulWidget {
  const BookingConfirmed({super.key});

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  bool _isVisible = true; // Initial visibility state
  Timer? _timer; // Reference to the timer

  @override
  void initState() {
    super.initState();
    // Start a timer that toggles the visibility every 800 milliseconds (0.8 second)
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (mounted) {
        setState(() {
          _isVisible = !_isVisible; // Toggle the visibility state
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F), // Yellow background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'Your Booking has been confirmed.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            AnimatedOpacity(
              opacity: _isVisible
                  ? 1.0
                  : 0.0, // Switch opacity based on visibility state
              duration: const Duration(milliseconds: 800), // Animation duration
              child: const Icon(
                Icons.check_circle,
                size: 120,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to DashboardScreen
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
