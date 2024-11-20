import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voraapp/screens/bank_information.dart';
import 'package:voraapp/screens/dashboard_screen.dart';
import 'package:voraapp/screens/update_screen.dart';
import 'package:voraapp/screens/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = ''; // Variable to store the user's first name
  String lastName = ''; // Variable to store the user's last name

  @override
  void initState() {
    super.initState();
    fetchUserName(); // Fetch the user's names on initialization
  }

  Future<void> fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email!;

      // Fetch user data from Firestore based on email as document ID
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email).get();

      if (userDoc.exists) {
        setState(() {
          firstName = userDoc['First Name'] ?? 'User'; // Fallback if none found
          lastName = userDoc['Last Name'] ?? ''; // Fallback if none found
        });
      } else {
        print("User document not found in Firestore.");
      }
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // Navigate to WelcomeScreen and clear all previous routes
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'VORA Account',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Account Information',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child:
                      const Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName', // Display both names
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateScreen()),
                        );
                      },
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [
                  // Navigate to Payment Methods
                  _buildProfileOption('Payment methods', Icons.payment, context,
                      const BankInformationScreen()),
                  const SizedBox(height: 15),

                  // Logout option
                  _buildProfileOption('Logout', Icons.logout, context, null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each profile option
  Widget _buildProfileOption(
    String title,
    IconData icon,
    BuildContext context,
    Widget? destinationScreen, // Make this parameter nullable
  ) {
    return GestureDetector(
      onTap: () {
        if (title == 'Logout') {
          logOut();
        } else if (destinationScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destinationScreen,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
