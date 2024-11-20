import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voraapp/screens/dashboard_screen.dart';
// import 'package:voraapp/screens/otp_screen.dart';
import 'package:voraapp/screens/profile_screen.dart';

class BankInformationScreen extends StatefulWidget {
  const BankInformationScreen({super.key});

  @override
  _BankInformationScreenState createState() => _BankInformationScreenState();
}

class _BankInformationScreenState extends State<BankInformationScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    upiIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 187, 17),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 220, 187, 17),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey, // Add form key to the form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSectionTitleWithIcon(
                      'Bank Information', Icons.account_balance_wallet),
                  const SizedBox(height: 30),
                  _buildTextFormField(
                    controller: cardNumberController,
                    hintText: 'Card Number',
                    labelText: 'Card Number',
                    validatorMessage: 'Please enter a valid card number',
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: expiryController,
                    hintText: 'Expiry (MM/YY)',
                    labelText: 'Expiry (MM/YY)',
                    validatorMessage: 'Please enter the expiry date',
                  ),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: cvvController,
                    hintText: 'CVV',
                    labelText: 'CVV',
                    validatorMessage: 'Please enter a valid CVV',
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: const Text(
                      '________or_________',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('UPI Information'),
                  const SizedBox(height: 20),
                  _buildTextFormField(
                    controller: upiIdController,
                    hintText: 'UPI IDs',
                    labelText: 'UPI IDs',
                    // This field can remain optional, so no validator here
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Allow the "Ask Me Later" action even if fields are empty
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                        );
                      },
                      child: const Text(
                        'Ask Me Later',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, proceed with registration
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    String? validatorMessage,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionTitleWithIcon(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
