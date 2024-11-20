import 'package:flutter/material.dart';
import 'package:voraapp/screens/dashboard_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Define the slide-in from right animation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start from right (off-screen)
      end: Offset.zero, // Slide to the center (on-screen)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the screen is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation, // Apply the slide transition
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7, // Small window width
          color: const Color(
              0xFFF1C40F), // Background color of notification screen
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                    (Route<dynamic> route) => false,
                  ); // Close the notification screen
                },
              ),
              title: const Text('Notification'),
              backgroundColor:
                  const Color(0xFFF1C40F), // Same as the screen background
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'VORA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Thank you for joining us. We value your journey and would love to know about your experience.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
