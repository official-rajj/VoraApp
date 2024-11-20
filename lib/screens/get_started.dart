import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voraapp/screens/welcome_screen.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Text(
                    'BE THE OWNER OF YOUR\nOWN RIDE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Color.fromARGB(255, 227, 189, 34),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 90),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: -250,
                        left: -211, // Adjust this to move the eclipse lower
                        child: Image.asset(
                          'asset/images/eclipse.png', // Add your eclipse image here
                          width: 800, // Adjust size as needed
                          height: 600,

                          // Adjust size as needed
                        ),
                      ),
                      Image.asset(
                        'asset/images/car.png', // Replace with your car image path
                        width: 400, // Adjust size as needed
                        height: 180, // Adjust the height to show the eclipse
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBlinkingDot(0),
                    SizedBox(width: 5),
                    _buildBlinkingDot(1),
                    SizedBox(width: 5),
                    _buildBlinkingDot(2),
                    SizedBox(width: 5),
                    _buildBlinkingDot(3),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFF1C40F), // Background color of button
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlinkingDot(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _getOpacityForDot(index),
          child: Icon(Icons.circle, size: 10, color: Colors.white),
        );
      },
    );
  }

  double _getOpacityForDot(int index) {
    double segmentLength = 1.0 / 4;
    double start = index * segmentLength;
    double end = start + segmentLength;

    if (_animation.value >= start && _animation.value < end) {
      return 1.0;
    }
    return 0.3;
  }
}
