import 'package:flutter/material.dart';
// import 'package:voraapp/screens/destination_screen.dart';
import 'package:voraapp/screens/renaultcar_details.dart';

// Main Car Selection Screen
class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({Key? key}) : super(key: key);

  @override
  _CarSelectionScreenState createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1C40F),
        title: const Text(
          'Select Popular Cars',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor:
          const Color(0xFFF1C40F), // Background color as in the image
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Car 1 - Maruti Fronx
                _buildCarCard(
                  'Maruti Fronx',
                  '₹450.0/hr',
                  'asset/images/maruti_fronx.jpg',
                  '4.8',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarutiCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 2 - Hyundai Creta
                _buildCarCard(
                  'Hyundai Creta',
                  '₹550.0/hr',
                  'asset/images/hyundai_creta.png',
                  '4.3',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HyundaiCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 3 - Mahindra Thar
                _buildCarCard(
                  'Mahindra Thar',
                  '₹653.0/hr',
                  'asset/images/mahindra_thar.png',
                  '4.5',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MahindraCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 4 - Volkswagen Polo
                _buildCarCard(
                  'Volkswagen Polo',
                  '₹399.0/hr',
                  'asset/images/volkswagen_polo.png',
                  '4.1',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VolkswagenCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 5 - Renault Kwid Climber
                _buildCarCard(
                  'Renault Kwid Climber',
                  '₹499.0/hr',
                  'asset/images/renault_kwid.png',
                  '4.8',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RenaultCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 6 - Nissan Murano
                _buildCarCard(
                  'Nissan Murano',
                  '₹499.0/hr',
                  'asset/images/nissan_murano.png',
                  '4.5',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NissanCarDetailsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Car 7 - Skoda Yeti
                _buildCarCard(
                  'Skoda Yeti',
                  '₹459.0/hr',
                  'asset/images/skoda_yeti.png',
                  '4.1',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SkodaCarDetailsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build the car card
  Widget _buildCarCard(String carName, String price, String imagePath,
      String rating, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  Image.asset(imagePath), // Car image
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  carName,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Example car details screens (for navigation)
class MarutiCarDetailsScreen extends StatefulWidget {
  @override
  _MarutiCarDetailsScreenState createState() => _MarutiCarDetailsScreenState();
}

class _MarutiCarDetailsScreenState extends State<MarutiCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maruti Fronx Details'),
      ),
      body: Center(
        child: Text(
          'Details about Maruti Fronx.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HyundaiCarDetailsScreen extends StatefulWidget {
  @override
  _HyundaiCarDetailsScreenState createState() =>
      _HyundaiCarDetailsScreenState();
}

class _HyundaiCarDetailsScreenState extends State<HyundaiCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyundai Creta Details'),
      ),
      body: Center(
        child: Text(
          'Details about Hyundai Creta.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MahindraCarDetailsScreen extends StatefulWidget {
  @override
  _MahindraCarDetailsScreenState createState() =>
      _MahindraCarDetailsScreenState();
}

class _MahindraCarDetailsScreenState extends State<MahindraCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahindra Thar Details'),
      ),
      body: Center(
        child: Text(
          'Details about Mahindra Thar.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class VolkswagenCarDetailsScreen extends StatefulWidget {
  @override
  _VolkswagenCarDetailsScreenState createState() =>
      _VolkswagenCarDetailsScreenState();
}

class _VolkswagenCarDetailsScreenState
    extends State<VolkswagenCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volkswagen Polo Details'),
      ),
      body: Center(
        child: Text(
          'Details about Volkswagen Polo.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class NissanCarDetailsScreen extends StatefulWidget {
  @override
  _NissanCarDetailsScreenState createState() => _NissanCarDetailsScreenState();
}

class _NissanCarDetailsScreenState extends State<NissanCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nissan Murano Details'),
      ),
      body: Center(
        child: Text(
          'Details about Nissan Murano.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class SkodaCarDetailsScreen extends StatefulWidget {
  @override
  _SkodaCarDetailsScreenState createState() => _SkodaCarDetailsScreenState();
}

class _SkodaCarDetailsScreenState extends State<SkodaCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skoda Yeti Details'),
      ),
      body: Center(
        child: Text(
          'Details about Skoda Yeti.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
