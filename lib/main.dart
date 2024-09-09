import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/landing/presentation/views/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
  // await FirebaseAuth.instance.verifyPhoneNumber(
  //   phoneNumber: '+44 7123 123 456',
  //   verificationCompleted: (PhoneAuthCredential credential) {},
  //   verificationFailed: (FirebaseAuthException e) {},
  //   codeSent: (String verificationId, int? resendToken) {},
  //   codeAutoRetrievalTimeout: (String verificationId) {},
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
