import 'package:flutter/material.dart';
import 'package:voraapp/screens/booking_confirmed.dart';

class RenaultCarDetailsScreen extends StatefulWidget {
  const RenaultCarDetailsScreen({super.key});

  @override
  State<RenaultCarDetailsScreen> createState() =>
      _RenaultCarDetailsScreenState();
}

class _RenaultCarDetailsScreenState extends State<RenaultCarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F), // Yellow background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Car Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Image.asset(
                'asset/images/renault_kwid.png',
                height: 300,
              ),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: const Text(
                'Car Specs',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCarSpecIcon(
                  Icons.local_gas_station,
                  'Fuel Capacity',
                  '15 KM/L',
                ),
                _buildCarSpecIcon(Icons.speed, 'Speed', '152 km/h'),
                _buildCarSpecIcon(Icons.event_seat, 'Capacity', '4 Seats'),
              ],
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: const Text(
                'Agent Partner',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Deepak Sinha',
                  style: TextStyle(color: Colors.black)),
              trailing: IconButton(
                icon: const Icon(Icons.info, color: Colors.black),
                onPressed: () {
                  // Additional agent info or actions
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to ConfirmBookingScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmBookingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Book Now',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Helper method for building car spec icons
  Widget _buildCarSpecIcon(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.black),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(color: Colors.black)),
        Text(value, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  _ConfirmBookingScreenState createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  String?
      selectedPaymentMethod; // State variable to store the selected payment method
  DateTime? startDate; // State variable for the selected start date
  DateTime? endDate; // State variable for the selected end date

  // Function to pick a date
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null &&
        pickedDate != (isStartDate ? startDate : endDate)) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
        } else {
          endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1C40F), // Yellow background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Confirm Your Booking',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'asset/images/renault_kwid.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Car Specs',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCarSpecIcon(
                  Icons.local_gas_station,
                  'Fuel Capacity',
                  '15 KM/L',
                ),
                _buildCarSpecIcon(Icons.speed, 'Speed', '152 km/h'),
                _buildCarSpecIcon(Icons.event_seat, 'Capacity', '4 Seats'),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Journey Date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildDatePicker('Start Date', true),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDatePicker('End Date', false),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment methods',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value:
                  selectedPaymentMethod, // Set initial value to state variable
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Cash on Delivery',
                  child: Text('Cash on Delivery'),
                ),
                DropdownMenuItem(
                  value: 'Online Payment',
                  child: Text('Online Payment'),
                ),
                DropdownMenuItem(
                  value: 'UPI IDs',
                  child: Text('UPI IDs'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Confirm booking action
                  if (startDate != null &&
                      endDate != null &&
                      selectedPaymentMethod != null) {
                    // Proceed with confirmation and navigate to BookingConfirmed screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingConfirmed(),
                      ),
                    );
                  } else {
                    // Show a message to the user if not all fields are selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Please fill all the details to proceed.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Confirm Now',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Helper method for building car spec icons
  Widget _buildCarSpecIcon(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.black),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(color: Colors.black)),
        Text(value, style: const TextStyle(color: Colors.black)),
      ],
    );
  }

  // Helper method for date picker fields
  Widget _buildDatePicker(String hintText, bool isStartDate) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: isStartDate
            ? (startDate == null
                ? hintText
                : startDate.toString().split(' ')[0])
            : (endDate == null ? hintText : endDate.toString().split(' ')[0]),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context, isStartDate);
      },
    );
  }
}
