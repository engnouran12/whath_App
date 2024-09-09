import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthPhone {
  final   Function onsavecode;
    AuthPhone({
  required this.onsavecode
  });

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code and sign in the user automatically
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        
        print('Verification failed: ${e.message}');
      },
      codeSent: onsavecode(),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout
      },
      timeout: const Duration(seconds: 60),
    );
  }
}
