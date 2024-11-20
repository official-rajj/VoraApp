// splash_screen.dart
import 'package:flutter/material.dart';
import 'get_started.dart'; // Import the GetStartedPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          const Duration(seconds: 1), // Duration of the entire blink cycle
      vsync: this,
    )..repeat(
        reverse: true); // Repeat the animation in reverse for blinking effect

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Redirect to GetStartedPage after 8 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  'asset/images/logo.png',
                  width: 240, // Adjust size as needed
                  height: 240,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
