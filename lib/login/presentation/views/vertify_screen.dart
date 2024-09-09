import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:task/login/presentation/views/home.dart';

class PhoneVerificationScreen extends StatefulWidget {
  final String vertifyid;
  const PhoneVerificationScreen({super.key, required this.vertifyid});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController _verifycontroller = TextEditingController();
  static const String staticVerificationCode = 'your_static_verification_code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 50,
              ),
              const Center(
                child: Text(
                  ' verify your number',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            ' We have sent SMS to your Phone',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          OtpTextField(
            textStyle: const TextStyle(color: Colors.green),
          ),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green),
              fixedSize: WidgetStateProperty.all(
                const Size(300, 50),
              ),
            ),
            onPressed: () async {
              try {
                // final cred = PhoneAuthProvider.credential(
                //     verificationId: staticVerificationCode,
                //     smsCode: _verifycontroller.text);

                // await FirebaseAuth.instance.signInWithCredential(cred);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              } catch (e) {
                print(e);
              }
            },
            child: const Text(
              'vertify',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
