// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:voraapp/screens/otp_screen.dart';

// class InformationScreen extends StatefulWidget {
//   const InformationScreen({super.key});

//   @override
//   _InformationScreenState createState() => _InformationScreenState();
// }

// class _InformationScreenState extends State<InformationScreen> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   String gender = 'Male';
//   DateTime selectedDate = DateTime(2003, 1, 9);

//   void sendOTP() async {
//     String phone = "+91" + phoneNumberController.text.trim();
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phone,
//       codeSent: (verificationId, resendToken) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => OtpScreen(
//                     verificationId: verificationId,
//                   )),
//         );
//       },
//       verificationCompleted: (credential) {},
//       verificationFailed: (e) {
//         print(e.code.toString());
//       },
//       codeAutoRetrievalTimeout: (verificationId) {},
//       timeout: const Duration(seconds: 30),
//     );
//   }

//   void validateAndSendOTP() {
//     if (firstNameController.text.isEmpty ||
//         lastNameController.text.isEmpty ||
//         phoneNumberController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all the details')),
//       );
//     } else {
//       String first = firstNameController.text.trim();
//       String last = lastNameController.text.trim();
//       String number = phoneNumberController.text.trim();
//       String dob =
//           '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

//       Map<String, dynamic> userData = {
//         "First Name": first,
//         "Last Name": last,
//         "Phone Number": number,
//         "Gender": gender,
//         "Date of Birth": dob,
//       };
//       FirebaseFirestore.instance.collection("users").add(userData);
//       print("User Data Saved");
//       sendOTP();
//     }
//   }

//   // void saveUser() {
//   //   String first = firstNameController.text.trim();
//   //   String last = lastNameController.text.trim();
//   //   String number = phoneNumberController.text.trim();

//   //   Map<String, dynamic> userData = {
//   //     "First Name": first,
//   //     "Last Name": last,
//   //     "Phone Number": number
//   //   };
//   //   FirebaseFirestore.instance.collection("users").add(userData);
//   //   print("User Data Saved");
//   // }

//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 220, 187, 17),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             // Navigator.of(context).pop();
//           },
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 220, 187, 17),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 Text(
//                   'Personal Information',
//                   style: GoogleFonts.inter(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 _buildTextField(
//                   controller: firstNameController,
//                   hintText: 'ADITYA',
//                   labelText: 'First Name*',
//                   icon: Icons.person,
//                 ),
//                 const SizedBox(height: 20),
//                 _buildTextField(
//                   controller: lastNameController,
//                   hintText: 'RAJ',
//                   labelText: 'Last Name*',
//                   icon: Icons.person_outline,
//                 ),
//                 const SizedBox(height: 30),
//                 _buildPhoneField(),
//                 const SizedBox(height: 30),
//                 _buildGenderField(),
//                 const SizedBox(height: 30),
//                 _buildDOBField(context),
//                 const SizedBox(height: 60),
//                 ElevatedButton(
//                   onPressed: validateAndSendOTP,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 100, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Next',
//                     style: TextStyle(
//                       color: Colors.yellow,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required String labelText,
//     IconData? icon,
//   }) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         filled: true,
//         fillColor: Colors.white,
//         prefixIcon: icon != null ? Icon(icon) : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//     );
//   }

//   Widget _buildPhoneField() {
//     return TextField(
//       controller: phoneNumberController,
//       keyboardType: TextInputType.phone,
//       decoration: InputDecoration(
//         labelText: 'Phone Number*',
//         hintText: '8935103618',
//         filled: true,
//         fillColor: Colors.white,
//         prefixIcon: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SizedBox(
//             width: 50,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'asset/images/flag.png', // Indian flag asset
//                   width: 20,
//                 ),
//                 const SizedBox(width: 5),
//                 const Text('+91'),
//               ],
//             ),
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//     );
//   }

//   Widget _buildGenderField() {
//     return DropdownButtonFormField<String>(
//       value: gender,
//       decoration: InputDecoration(
//         labelText: 'Gender*',
//         filled: true,
//         fillColor: Colors.white,
//         prefixIcon: const Icon(Icons.male),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       items: ['Male', 'Female', 'Other'].map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (newValue) {
//         setState(() {
//           gender = newValue!;
//         });
//       },
//     );
//   }

//   Widget _buildDOBField(BuildContext context) {
//     return TextField(
//       readOnly: true,
//       decoration: InputDecoration(
//         labelText: 'Date of Birth*',
//         hintText:
//             '${selectedDate.month} ${selectedDate.day} ${selectedDate.year}',
//         filled: true,
//         fillColor: Colors.white,
//         suffixIcon: const Icon(Icons.calendar_today),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       onTap: () async {
//         final DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: selectedDate,
//           firstDate: DateTime(1900),
//           lastDate: DateTime.now(),
//         );
//         if (picked != null && picked != selectedDate) {
//           setState(() {
//             selectedDate = picked;
//           });
//         }
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voraapp/screens/otp_screen.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String gender = 'Male';
  DateTime selectedDate = DateTime(2003, 1, 9);

  Future<void> sendOTP() async {
    String phone = "+91" + phoneNumberController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    verificationId: verificationId,
                  )),
        );
      },
      verificationCompleted: (credential) {},
      verificationFailed: (e) {
        print(e.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 30),
    );
  }

  Future<void> validateAndSaveUserData() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the details')),
      );
      return;
    }

    // Access the currently logged-in user
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No authenticated user found')),
      );
      return;
    }

    // Prepare user data to save
    String email = user.email!;
    String first = firstNameController.text.trim();
    String last = lastNameController.text.trim();
    String number = phoneNumberController.text.trim();
    String dob =
        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

    Map<String, dynamic> userData = {
      "First Name": first,
      "Last Name": last,
      "Phone Number": number,
      "Gender": gender,
      "Date of Birth": dob,
    };

    // Save user data in Firestore using the email as the document ID
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userData);
      print("User data saved with email as document ID");
      sendOTP(); // Proceed to send OTP if needed
    } catch (e) {
      print("Error saving user data: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to save data')));
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 196, 15),
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
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
                  'Personal Information',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField(
                  controller: firstNameController,
                  hintText: 'ADITYA',
                  labelText: 'First Name*',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: lastNameController,
                  hintText: 'RAJ',
                  labelText: 'Last Name*',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 30),
                _buildPhoneField(),
                const SizedBox(height: 30),
                _buildGenderField(),
                const SizedBox(height: 30),
                _buildDOBField(context),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: validateAndSaveUserData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Next',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    IconData? icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone Number*',
        hintText: '8935103618',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'asset/images/flag.png',
                  width: 20,
                ),
                const SizedBox(width: 5),
                const Text('+91'),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      value: gender,
      decoration: InputDecoration(
        labelText: 'Gender*',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.male),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      items: ['Male', 'Female', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          gender = newValue!;
        });
      },
    );
  }

  Widget _buildDOBField(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Date of Birth*',
        hintText:
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
        filled: true,
        fillColor: Colors.white,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null && picked != selectedDate) {
          setState(() {
            selectedDate = picked;
          });
        }
      },
    );
  }
}
