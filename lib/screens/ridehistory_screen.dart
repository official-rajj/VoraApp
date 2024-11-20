import 'package:flutter/material.dart';
import 'package:voraapp/screens/dashboard_screen.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1C40F),
        title: const Text(
          'Rides History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFFF1C40F), // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              // First Ride Entry (Kwid Climber)
              _buildRideCard(
                carName: 'Kwid Climber',
                brand: 'Renault',
                orderDate: 'Oct 03, 2024',
                status: 'Active',
                imagePath: 'asset/images/renault_kwid.png', // Add proper path
                statusColor: Colors.green,
              ),
              const SizedBox(height: 30),

              // Second Ride Entry (Hyundai Creta)
              _buildRideCard(
                carName: 'Hyundai Creta',
                brand: 'Hyundai',
                orderDate: 'Sept 19, 2024',
                status: 'Ended',
                imagePath: 'asset/images/hyundai_creta.png', // Add proper path
                statusColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRideCard({
    required String carName,
    required String brand,
    required String orderDate,
    required String status,
    required String imagePath,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 6.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Car Image
          Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Ride Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  brand,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Order Date: $orderDate',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Status: $status',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
