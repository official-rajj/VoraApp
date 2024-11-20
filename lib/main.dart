// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voraapp/firebase_options.dart';
import 'package:voraapp/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // DocumentSnapshot snapshot = await FirebaseFirestore.instance // to see numbers of users in the firebase store in console
  //     .collection("users")
  //     .doc("5aK0Jd6rfqzwzq0Rn9eW")
  //     .get();
  // print(snapshot.data().toString());

  // Map<String, dynamic> newUserData = {
  //   "Last Name": "Kumar",
  //   "First Name": "Nishant",
  // };

  // await _firestore
  //     .collection("users")
  //     .add(newUserData); //add new user through code with auto-id

  // await _firestore.collection("users").doc("nkumar@gmail.com").set(newUserData); // add new user through code with your desired id/name

  // await _firestore.collection("users").doc("nkumar@gmail.com").delete();
  // print("User Delete  ");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
