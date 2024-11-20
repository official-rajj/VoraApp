import 'package:flutter/material.dart';
import 'package:voraapp/screens/car_selection.dart';

class DestinationScreen extends StatefulWidget {
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  String _selectedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F), // Background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1C40F), // Match background color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Location input with location_on icon on the left
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Your location',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.red, // Red color for the location icon
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Choose Destination input
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Choose destination',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blue, // Location icon for destination
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Suggestions section
                const Text(
                  'Suggestions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // List of suggested destinations
                Expanded(
                  child: ListView(
                    children: _buildSuggestionsList(),
                  ),
                ),

                // Next button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform action when "Next" is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CarSelectionScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: const Color(0xFFF1C40F), fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            // Custom Painted Dotted Line from the location_on to the second location icon
            Positioned(
              top: 72, // Adjust the position to match with TextFields
              left: 24, // Align with location_on icon
              child: CustomPaint(
                size: Size(18, 34), // Size for the dotted line
                painter: DottedLinePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create the list of suggested locations
  List<Widget> _buildSuggestionsList() {
    List<String> locations = [
      'Ahmedabad',
      'Somnath',
      'Dwarka',
      'Porbandar',
      'Girnar',
    ];

    return locations.map((location) {
      return ListTile(
        title: Text(
          location,
          style: const TextStyle(fontSize: 16),
        ),
        leading: const Icon(Icons.history),
        onTap: () {
          setState(() {
            _selectedLocation = location;
          });
        },
      );
    }).toList();
  }
}

// CustomPainter to draw the dotted line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashHeight = 3, dashSpace = 5, startY = -30;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
