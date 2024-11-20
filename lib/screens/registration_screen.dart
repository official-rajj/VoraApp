import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voraapp/screens/terms_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  void registerAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || cPassword.isEmpty) {
      print('Please fill all fields');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all the fields')));
    } else if (password != cPassword) {
      print('Passwords do not match');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')));
    } else if (password.length < 6) {
      print('Password must be at least 6 characters long');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be at least 6 characters long')));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print('User Created');
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text('User Created')));

        // Show the modal bottom sheet after successful registration
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allows the sheet to take more height
          backgroundColor: Colors.transparent, // Set transparent background
          builder: (context) => const TermsBottomSheet(),
        );
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${e.code}')));
      }
    }
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is removed from the widget tree
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 196, 15),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromARGB(255, 241, 196, 15),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Register Here!',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                _buildTextField(
                  icon: Icons.email,
                  controller: emailController,
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress,
                  iconImage:
                      'asset/images/gmail.png', // Add the Gmail icon here
                ),
                const SizedBox(height: 20),
                // Text(
                //   '___________or___________',
                //   style: GoogleFonts.inter(
                //     color: Colors.black,
                //     fontSize: 18,
                //   ),
                // ),
                // SizedBox(height: 20),
                // _buildPhoneField(), // Corrected phone number field
                // SizedBox(height: 35),
                _buildTextField(
                  icon: Icons.lock,
                  controller: passwordController,
                  hintText: 'Password',
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  icon: Icons.lock,
                  controller: cPasswordController,
                  hintText: 'Confirm Password',
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Show the modal bottom sheet when Register is clicked
                    registerAccount();
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled:
                    //       true, // Allows the sheet to take more height
                    //   backgroundColor:
                    //       Colors.transparent, // Set transparent background
                    //   builder: (context) => TermsBottomSheet(),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button background color
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function for email and password text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    bool obscureText = false,
    String? iconImage,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: iconImage != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(iconImage, width: 20, height: 20),
              )
            : Icon(icon, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
