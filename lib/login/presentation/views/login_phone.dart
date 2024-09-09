import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:task/login/data/remote_repo/auth_firebase.dart';
import 'package:task/login/presentation/views/vertify_screen.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({super.key});

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = "+1";
  static const String staticVerificationCode =
      'your_static_verification_code'; // Default country code

  @override
  void initState() {
    super.initState();
    _handlePhoneVerification();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handlePhoneVerification() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Enter Phone Number',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'WhatsApp will verify your number',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CountryCodePicker(
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.white,
                    onChanged: (countryCode) {
                      setState(() {
                        _selectedCountryCode = countryCode.dialCode!;
                      });
                    },
                    initialSelection: 'US', // Default country
                    favorite: const ['+1', 'US'], // Favorite country codes
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(height: 20)),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  fixedSize: WidgetStateProperty.all(
                    const Size(300, 50),
                  ),
                ),
                onPressed: () async {
                  String phoneNumberWithCode =
                      '$_selectedCountryCode${_phoneController.text}';
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumberWithCode,
                    verificationCompleted: (phoneAuthCredential) =>
                        print('Auto verification completed'),
                    verificationFailed: (FirebaseAuthException error) =>
                        print(error.toString()),
                    codeSent: (verificationId, resendToken) =>
                        print('Code sent to phone $verificationId'),
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    timeout: const Duration(seconds: 60),
                  );

                  // Use the static verification code
                  final phoneAuthCredential = PhoneAuthProvider.credential(
                      smsCode: '123456',
                      verificationId: staticVerificationCode);
                  // await FirebaseAuth.instance
                  //     .signInWithCredential(phoneAuthCredential)
                  //     .then((userCredential) =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (con) => const PhoneVerificationScreen(
                              vertifyid: staticVerificationCode)));
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
