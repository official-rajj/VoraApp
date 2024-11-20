import 'package:flutter/material.dart';
import 'package:voraapp/screens/information_screen.dart';

class TermsBottomSheet extends StatefulWidget {
  const TermsBottomSheet({super.key});

  @override
  _TermsBottomSheetState createState() => _TermsBottomSheetState();
}

class _TermsBottomSheetState extends State<TermsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // Modal height control
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Terms and Conditions',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Text(
                'The Services constitute a technology platform that enables users of  VORA’s mobile applications or websites provided as part of the Services  (each, an “Application”) to arrange and schedule transportation and/or  logistics services with independent third party providers of such  services, including independent third party transportation providers and  independent third party logistics providers under agreement with VORA  or certain of VORA’s affiliates (“Third Party Providers”). Unless  otherwise agreed by VORA in a separate written agreement with you, the  Services are made available solely for your personal, non-commercial use.\n\nOur collection and use of personal information in connection with the Services is as provided in VORA’s Privacy Policy',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Check if InformationScreen exists
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InformationScreen(),
                ),
              ); // Close the modal on agreement
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'I agree',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
