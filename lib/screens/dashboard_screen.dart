import 'package:flutter/material.dart';
import 'package:voraapp/screens/destination_screen.dart';
import 'package:voraapp/screens/help_screen.dart';
import 'package:voraapp/screens/profile_screen.dart';
import 'package:voraapp/screens/ridehistory_screen.dart';
import 'notification_screen.dart'; // Import for Notification Screen
import 'car_selection.dart'; // Import for Car Selection Screen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Variable to track selected bottom nav item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 1:
        // Navigate to RideHistoryScreen when the "Rides" icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RideHistoryScreen(),
          ),
        );
        break;
      // You can add more navigation for other tabs if needed
    }

    switch (index) {
      case 2:
        // Navigate to Help Screen when the "Help" icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HelpScreen(),
          ),
        );
        break;
      // You can add more navigation for other tabs if needed
    }

    switch (index) {
      case 3:
        // Navigate to Profile Screen when the "Profile" icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
        break;
      // You can add more navigation for other tabs if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F), // Set background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location and Search Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Rajkot, Gujarat',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to NotificationScreen when clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()),
                            );
                          },
                          child: Container(
                            width:
                                32, // Adjust the size as per your requirement
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6, // Position the red dot
                          right: 6, // Adjust the positioning
                          child: Container(
                            width: 7, // Size of the red dot
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Colors.red, // Red color for the dot
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                GestureDetector(
                  onTap: () {
                    // Navigate to DestinationScreen when the search bar is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DestinationScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true, // Makes the TextField read-only
                            decoration: InputDecoration(
                              hintText: 'Choose Your Destination',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Brands Section
                const Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 90, // Height of the brand logos
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildBrandLogo('asset/images/maruti_logo.png', 'Maruti'),
                      _buildBrandLogo(
                          'asset/images/mahindra_logo.png', 'Mahindra'),
                      _buildBrandLogo(
                          'asset/images/hyundai_logo.png', 'Hyundai'),
                      _buildBrandLogo('asset/images/nissan_logo.png', 'Nissan'),
                      _buildBrandLogo(
                          'asset/images/volkswagen_logo.png', 'Volkswagen'),
                      _buildBrandLogo('asset/images/skoda_logo.png', 'Skoda'),
                      _buildBrandLogo(
                          'asset/images/Renault_logo.png', 'Renault'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Popular Cars Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Cars',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to CarSelectionScreen when "See all" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarSelectionScreen()),
                        );
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 2, 20, 34),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Car Card Example
                Container(
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
                            Image.asset('asset/images/maruti_fronx.jpg'),
                            Positioned(
                              top: 10,
                              left: 15,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 14,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Maruti Fronx',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '₹450.0/hr',
                            style: TextStyle(
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
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Set the background color to black
        selectedItemColor:
            const Color(0xFFF1C40F), // Set the selected icon color to yellow
        unselectedItemColor: Colors.grey, // Unselected icon color
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildBottomNavIcon(Icons.home, _selectedIndex == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavIcon(Icons.history, _selectedIndex == 1),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: _buildBottomNavIcon(Icons.help, _selectedIndex == 2),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon:
                _buildBottomNavIcon(Icons.account_circle, _selectedIndex == 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper method to build the bottom nav icons with a yellow circle for selected ones
  Widget _buildBottomNavIcon(IconData icon, bool isSelected) {
    return isSelected
        ? Container(
            padding: const EdgeInsets.all(
                7.0), // Add padding inside the yellow circle
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(
                  0xFFF1C40F), // Circle background color for selected icon
            ),
            child: Icon(
              icon,
              color: Colors.black, // Icon color inside the yellow circle
            ),
          )
        : Icon(icon); // Unselected state
  }

  // Helper method to create brand logos
  Widget _buildBrandLogo(String imagePath, String brandName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 60,
                height: 60,
              ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            brandName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
